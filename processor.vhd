----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:30:57 09/20/2013 
-- Design Name: 
-- Module Name:    processor - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use WORK.MIPS_CONSTANT_PKG.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;l
--use UNISIM.VComponents.all;

--todo: find any use for reset, remove reset fra alle registre

entity processor is
 generic ( MEM_ADDR_BUS, MEM_DATA_BUS : natural := 32);
Port ( 
		clk : in STD_LOGIC;
		reset					: in STD_LOGIC;
		processor_enable	: in  STD_LOGIC;
		imem_address 		: out  STD_LOGIC_VECTOR (MEM_ADDR_BUS-1 downto 0);
		imem_data_in 		: in  STD_LOGIC_VECTOR (MEM_DATA_BUS-1 downto 0);--needs to be implemented
		dmem_data_in 		: in  STD_LOGIC_VECTOR (MEM_DATA_BUS-1 downto 0);
		dmem_address 		: out  STD_LOGIC_VECTOR (MEM_ADDR_BUS-1 downto 0);
		dmem_address_wr	: out  STD_LOGIC_VECTOR (MEM_ADDR_BUS-1 downto 0);
		dmem_data_out		: out  STD_LOGIC_VECTOR (MEM_DATA_BUS-1 downto 0);--goes right to the mux
		dmem_write_enable	: out  STD_LOGIC
	);
end processor;

-- Type "CHECK" on each that is done

--Requirements: 

-- R-type function codes: -- the first number in functioncode is uneccessary as it seams now because it is a "dont care bit"
-- * ADD: 100000
-- * SUB: 100010
-- * SLT: 101010
-- * AND: 100100
-- * OR:  100101
-- I-Type and J-Type Op-codes:
-- * BEQ: 000100
-- * LW:  100011 (We might also need more loads than Load Word)
-- * SW:  101011
-- * LUI: 001111
-- * JMP: 000010

--Components:
--Program Counter (more advanced with Eirik's design)
--Control Unit (with 3 states(?) )
--Memory * 2? (Instruction or Data, but check if Toplevel handles this)
--Register-block.
--Sign-extend 16 to 32 bits
--ALU
--ALU-control
--Concat
--And gate
--MUX * 5
--1 or 2 Adders (depending if we choose to change architecture).

--Signals:
--  

architecture Behavioral of processor is

--	component MEMORY is
--		generic (M :NATURAL :=MEM_ADDR_COUNT; N :NATURAL :=DDATA_BUS); 
--		port(
--			CLK			: in STD_LOGIC;
--			RESET			:	in  STD_LOGIC;	
--			W_ADDR		:	in  STD_LOGIC_VECTOR (N-1 downto 0);	-- Address to write data
--			WRITE_DATA	:	in  STD_LOGIC_VECTOR (N-1 downto 0);	-- Data to be written
--			MemWrite		:	in  STD_LOGIC;									-- Write Signal
--			ADDR			:	in  STD_LOGIC_VECTOR (N-1 downto 0);	-- Address to access data
--			READ_DATA	:	out STD_LOGIC_VECTOR (N-1 downto 0)		-- Data read from memory
--		);
--	end component MEMORY;
component controlpath is
    Port ( PC_OUTPUT : in  STD_LOGIC_VECTOR (31 downto 0);
           InstrMem_Signext : in  STD_LOGIC_VECTOR (15 downto 0);
           Instr_Mem_Concat : in  STD_LOGIC_VECTOR (25 downto 0);
           FinalPCAddress : out  STD_LOGIC_VECTOR (31 downto 0);
           jump : in  STD_LOGIC);
end component controlpath;
component ALUoperation is
    Port ( aluop0 : in  STD_LOGIC;
           aluop1 : in  STD_LOGIC;
           funct : in  STD_LOGIC_VECTOR (3 downto 0);
           operation : out  STD_LOGIC_VECTOR (3 downto 0));
end component ALUoperation;
	component REGISTER_FILE is
		port(
			CLK 			:	in	STD_LOGIC;				
			RESET			:	in	STD_LOGIC;				
			RW				:	in	STD_LOGIC;				
			RS_ADDR 		:	in	STD_LOGIC_VECTOR (RADDR_BUS-1 downto 0); 
			RT_ADDR 		:	in	STD_LOGIC_VECTOR (RADDR_BUS-1 downto 0); 
			RD_ADDR 		:	in	STD_LOGIC_VECTOR (RADDR_BUS-1 downto 0);
			WRITE_DATA	:	in	STD_LOGIC_VECTOR (DDATA_BUS-1 downto 0); 
			RS				:	out	STD_LOGIC_VECTOR (DDATA_BUS-1 downto 0);
			RT				:	out	STD_LOGIC_VECTOR (DDATA_BUS-1 downto 0)
		);
	end component REGISTER_FILE;

	component alu is
				generic (N :NATURAL :=DDATA_BUS);
		port(
			X			: in STD_LOGIC_VECTOR(N-1 downto 0);
			Y			: in STD_LOGIC_VECTOR(N-1 downto 0);
			ALU_IN	: in ALU_INPUT;
			R			: out STD_LOGIC_VECTOR(N-1 downto 0);
			FLAGS		: out ALU_FLAGS
		);
	end component alu;
	
	component PC is
	    Port ( Data_in : in  STD_LOGIC_VECTOR (31 downto 0);
           increment : in  STD_LOGIC;
           data_out : out  STD_LOGIC_VECTOR (31 downto 0);--set to constant instead, 
           clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           write_enable : in  STD_LOGIC);
	end component PC;
	
	component simple_multiplexer is
	generic (N :NATURAL :=DDATA_BUS);
	    Port ( a : in  STD_LOGIC_VECTOR (N-1 downto 0);
           b : in  STD_LOGIC_VECTOR (N-1 downto 0);
           control_signal : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (N-1 downto 0));
	
	end component simple_multiplexer;
	
	component control is
    Port ( procon : in  STD_LOGIC_VECTOR (5 downto 0);
           Ops : out ProOP;
			  increment: out std_logic;
			  reset: in std_logic;
			  clk: in std_logic;
			  processor_enable: in std_logic);
end component control;

	--Signal, categorized as signals FROM different components:

	--From PC
	signal PC_Output : STD_LOGIC_VECTOR (31 downto 0); --From PC to Instruction Memory + Incrementer (currently removed)
	--signal Incremented  : STD_LOGIC_VECTOR (31 downto 0); --From PC to Instruction Memory + Incrementer (may be removed)
	--signal Past-Incremented  : STD_LOGIC_VECTOR (31 downto 0); --Original Incrementation-form


	-- From PC to Instruction Memory
	signal InstrMem_FullOutput : STD_LOGIC_VECTOR (31 downto 0);
	--WARNING!!
	--InstruMem_FullOutout signal may be sufficient, if so: Delete the 8 next signals
	--WARNING!!

	--- * Common
	signal InstrMem_ProCon : STD_LOGIC_VECTOR (5 downto 0); -- From Instruction Memory to Processor Controller [31-26]
	signal InstrMem_ReadReg1 : STD_LOGIC_VECTOR (4 downto 0); --From Instruction Memory to Read Register 1 [25-21] 
	--- * R-Type Only
	signal InstrMem_ReadReg2 : STD_LOGIC_VECTOR (4 downto 0); --From Instruction Memory to Read Register 2 [20-16], R-Type
	signal InstrMem_WriteReg2 : STD_LOGIC_VECTOR (4 downto 0); --From Instruction Memory to Write Reg [15-11], R-type
	signal InstrMem_ALUCon : STD_LOGIC_VECTOR (3 downto 0); --From Instruction Memory to ALU control [5-0], R-type
	--- * I-Type Only
	signal InstrMem_WriteReg1 : STD_LOGIC_VECTOR (4 downto 0); --From Instruction Memory to Write Reg [20-16], I-type
	signal InstrMem_Signext : STD_LOGIC_VECTOR (15 downto 0); --From Instruction Memory to SignExtend [15-0], I-type
	--- * J-Type Only
	signal Instr_Mem_Concat : STD_LOGIC_VECTOR (25 downto 0); --From Instruction Memory to Concat [25-0]


	-- From Processor Controller
	--WARNING!!
	-- State Machine not included in signal-design, be prepared to change if necessary
	--WARNING!!

	signal increment: STD_LOGIC;

	-- From Register
	signal Read_Data1 : STD_LOGIC_VECTOR (31 downto 0); -- Read data 1 from Register_File
	signal Read_Data2 : STD_LOGIC_VECTOR (31 downto 0); -- Read data 2 from Register_File


	-- From ALU
	signal ALU_Result : STD_LOGIC_VECTOR (31 downto 0); -- The ALU Result output from the ALU
	signal Zero : ALU_FLAGS; -- The Zero output from the ALU


	-- From Data Memory
	signal Read_Data : STD_LOGIC_VECTOR (31 downto 0); -- Data fetched from the ALU

	signal Signextended : STD_LOGIC_VECTOR (31 downto 0); -- Data output from Signextend

	-- From ALUControl
	signal ALUControl : ALU_INPUT; 

	--WARNING!!
	--Schedule specifies shift on 6 bits, but it will conflict with output from PC / Increment-Adder
	--WARNING!!

	-- From MUX1, Between Instruction Memory and Register File (input for Write Register)
	signal ChosenWriteReg : STD_LOGIC_VECTOR (4 downto 0);

	-- From MUX2 Between Register File/Sign Extend and ALU (ALU Input 2)
	signal ChosenALUInput : STD_LOGIC_VECTOR (31 downto 0);

	-- From MUX3 Between ALU/Data Memory and Instruction Memory (input for Write Data)
	signal ChosenWriteData : STD_LOGIC_VECTOR (31 downto 0);

	-- From MUX4 Between PC/Branch Adder and MUX5 (input for next Address #1, regular OR branch)
	signal PCAddressMidMUX : STD_LOGIC_VECTOR (31 downto 0);

	-- From MUX5 Between MUX4 and PC (input for next Address #2, Reg/Bra OR Jump)
	signal FinalPCAddress : STD_LOGIC_VECTOR (31 downto 0);
	-- From Branch-AND-gate
--	signal BranchAND_MUX4 : STD_LOGIC; -- !!!!!!!  Result from the Branch AND-gate

	--signal memread: std_logic;--!!!!!!
	--signal be: std_logic;--!!!!!!
	signal enablepcwrite: std_logic;
	signal consignal: ProOP;
--  constant CMD_FET    : std_logic_vector(0 to INPUT_BUS_WIDTH-1) := "00000000000000000000000000000000";
--  constant CMD_EXE     : std_logic_vector(0 to INPUT_BUS_WIDTH-1) := "00000000000000000000000000000001";
--  constant CMD_STA     : std_logic_vector(0 to INPUT_BUS_WIDTH-1) := "00000000000000000000000000000010";
signal operation: std_logic_vector(3 downto 0);

	begin
Signextended<=InstrMem_Signext&"0000000000000000";
enablepcwrite<=consignal.jump or (consignal.branch and zero.zero); -- i might not need processor_enable here, we need to create a startup sequence
Instr_Mem_Concat<=imem_data_in(25 downto 0);
InstrMem_Signext<=Instr_Mem_Concat(15 downto 0);
InstrMem_WriteReg1<=Instr_Mem_Concat(20 downto 16);
InstrMem_ReadReg1<=Instr_Mem_Concat(20 downto 16);--assigning the left most bit as most significant
InstrMem_WriteReg2<=Instr_Mem_Concat(15 downto 11);
InstrMem_ALUCon<=Instr_Mem_Concat(3 downto 0);
InstrMem_ProCon<=imem_data_in(31 downto 26);
InstrMem_ReadReg2<=Instr_Mem_Concat(25 downto 21);


--assignments for ai controlsignals
ALUControl.op0<=operation(3 );--after what i have read, the each of the types here are enumerations and have to be individually assigned with either vectors or 
ALUControl.op1<=operation(2 );
ALUControl.op2<=operation(1);
ALUControl.op3<=operation(0 );--check all these signals


Controlcircut: controlpath
    Port map ( PC_OUTPUT => pc_output,
           InstrMem_Signext =>InstrMem_Signext,
           Instr_Mem_Concat =>Instr_Mem_Concat,
           FinalPCAddress =>FinalPCAddress,
           jump =>consignal.jump);
ALUopmodule:ALUoperation 
    Port map ( aluop0 =>consignal.aluop0,
           aluop1 =>consignal.aluop1,
           funct =>InstrMem_ALUCon,
           operation =>operation);


	ALUtd : alu generic map ( N=>DDATA_BUS)  port map(
		Y					=>	ChosenALUInput,
		X					=> Read_Data1,
		ALU_IN			=> ALUControl,
		R					=> ALU_Result,
		FLAGS		=> ZERO
	);
	
	RegisterF: REGISTER_FILE port map(
				CLK 			=> clk,			
			RESET			=> reset,		
			RS				=>read_data1,				
			RT				=>read_data2,--the dataoutput who also go to the mux
			RW				=>consignal.RegWrite,			
			RS_ADDR 		=>	InstrMem_ReadReg1, 
			RT_ADDR 		=> InstrMem_ReadReg2,
			RD_ADDR 		=> ChosenWriteReg,
			WRITE_DATA	=>ChosenWriteData
	);
	Counter: PC port map(
	 Data_in => FinalPCAddress,
           increment =>increment,
           data_out =>PC_Output,
           clock =>clk,
           reset =>reset,
           write_enable =>enablepcwrite--may work, check this later
	
	);
	
	CONTROL_UNIT: control Port map( 
	procon =>InstrMem_ProCon,
           Ops => consignal,
			  clk=>clk,
			  reset=>reset,
			  processor_enable=>processor_enable,
			  increment=>increment);

	MUX2: simple_multiplexer port map( a =>read_data2,
           b =>Signextended,
           control_signal =>consignal.alusrc,
           output =>ChosenALUInput);
	MUX1: simple_multiplexer generic map ( N=>5) port map(--you have to make the components generic
	 a =>InstrMem_WriteReg1,
           b =>InstrMem_WriteReg2,
           control_signal =>consignal.regdest,
           output =>ChosenWriteReg);
	MUX3: simple_multiplexer port map(	 b =>dmem_data_in,
           a =>ALU_Result,
           control_signal =>consignal.memtoreg,
           output =>ChosenWriteData);
	--PCAddressMidMUX <= b when branch = '1';we dont need mux4 because there is only 1 signal




-- generic process, has to be replaced with something

   --process(clk,pc_output,alu_result,read_data2,consignal)--combinatorial circut::::assigns inputs and outputs to and from processor
 --  begin
	imem_address<=PC_output;
	dmem_address<=ALU_Result;
	dmem_address_wr<=read_data2;--??do you write and specify what adresses you are using or something? this is not needed
	dmem_data_out<=read_data2;
	dmem_write_enable<=consignal.memwrite;
      
 --  end process;

end Behavioral;