library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use WORK.MIPS_CONSTANT_PKG.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


--TODO ADD PIPELINESTAGE FOR THE FORWARDING AND THE ALUOP UNITS
entity PROCESSOR is
 generic ( MEM_ADDR_BUS, MEM_DATA_BUS : natural := 32);
Port ( 
		clk : in STD_LOGIC;
		reset					: in STD_LOGIC;
		processor_enable	: in  STD_LOGIC;
		imem_address 		: out  STD_LOGIC_VECTOR (MEM_ADDR_BUS-1 downto 0);
		imem_data_in 		: in  STD_LOGIC_VECTOR (MEM_DATA_BUS-1 downto 0);
		dmem_data_in 		: in  STD_LOGIC_VECTOR (MEM_DATA_BUS-1 downto 0);
		dmem_address 		: out  STD_LOGIC_VECTOR (MEM_ADDR_BUS-1 downto 0);
		dmem_address_wr	: out  STD_LOGIC_VECTOR (MEM_ADDR_BUS-1 downto 0);
		dmem_data_out		: out  STD_LOGIC_VECTOR (MEM_DATA_BUS-1 downto 0);
		dmem_write_enable	: out  STD_LOGIC
	);
end PROCESSOR;

architecture Behavioral of PROCESSOR is

	--component declarations
	component controlpath is
    Port ( PC_OUTPUT : in  STD_LOGIC_VECTOR (31 downto 0);
           Signextended : in  STD_LOGIC_VECTOR (31 downto 0);
           Instr_Mem_Concat : in  STD_LOGIC_VECTOR (25 downto 0);
           FinalPCAddress : out  STD_LOGIC_VECTOR (31 downto 0);
           jump : in  STD_LOGIC;
			  branch: in std_logic;
			  zero: in std_logic);
	end component controlpath;

	component ALUOperation is
    Port ( aluop0 : in  STD_LOGIC;
           aluop1 : in  STD_LOGIC;
           funct : in  STD_LOGIC_VECTOR (3 downto 0);
           operation : out  STD_LOGIC_VECTOR (3 downto 0));
	end component ALUOperation;
	
		component adder is
		generic (N :NATURAL :=DDATA_BUS);  
		port(
			X	: in	STD_LOGIC_VECTOR(N-1 downto 0);
			Y	: in	STD_LOGIC_VECTOR(N-1 downto 0);
			COUT	: out	STD_LOGIC;
			R	: out	STD_LOGIC_VECTOR(N-1 downto 0));
	end component adder;
	component TriputMux is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           C : in  STD_LOGIC_VECTOR (31 downto 0);
           R : out  STD_LOGIC_VECTOR (31 downto 0);
           control : in  STD_LOGIC_VECTOR (1 downto 0));
end component TriputMux;

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
	
	component Regi is
	generic(N : natural :=32);
   port ( Data_in : in  STD_LOGIC_VECTOR (N-1 downto 0);
           data_out : out  STD_LOGIC_VECTOR (N-1 downto 0);
           clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           write_enable : in  STD_LOGIC);--remove this if not needed
	end component regi;
	
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
           data_out : out  STD_LOGIC_VECTOR (31 downto 0);
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
    Port ( control_input : in  STD_LOGIC_VECTOR (5 downto 0);
           Ops : out STD_LOGIC_VECTOR (8 downto 0);
			  write_enable: out std_logic;
			  reset: in std_logic;
			  clk: in std_logic;
			  processor_enable: in std_logic);
	end component control;
	
	component Forwarding is
    Port ( ExmemregisterRD : in  STD_LOGIC_VECTOR (4 downto 0);
           MEMWbregisterRD : in  STD_LOGIC_VECTOR (4 downto 0);
			  MEMWBregwrite: in std_logic;
			  EXMEMregwrite: in std_logic;
           RS : in  STD_LOGIC_VECTOR (4 downto 0);
           RT : in  STD_LOGIC_VECTOR (4 downto 0);
           forwardA : out  STD_LOGIC_VECTOR (1 downto 0);
           forwardB  : out  STD_LOGIC_VECTOR (1 downto 0));
end component Forwarding;

	--Signal, categorized as signals FROM different components:

	--From PC
	signal PC_Output : STD_LOGIC_VECTOR (31 downto 0); --From PC to Instruction Memory + Control Circuit


	-- From Register
	signal Read_Data1 : STD_LOGIC_VECTOR (31 downto 0); -- Read data 1 from Register_File
	signal Read_Data2 : STD_LOGIC_VECTOR (31 downto 0); -- Read data 2 from Register_File


	-- From ALU
	signal ALU_Result : STD_LOGIC_VECTOR (31 downto 0); -- The ALU Result output from the ALU
	signal Zero : ALU_FLAGS; -- The Zero output from the ALU

	-- From instruction memory
	signal Signextended : STD_LOGIC_VECTOR (31 downto 0); -- Data output from Signextend

	-- From ALUControl
	signal ALUControl : ALU_INPUT; 

	--controlsignal for forwardingA
	signal ctForwardA: STD_LOGIC_VECTOR(1 downto 0);
		--controlsignal for forwardingB
	signal ctForwardB: STD_LOGIC_VECTOR(1 downto 0);
	
	--output from forwardA mux
	signal ForwardAout: std_logic_vector(31 downto 0);
	
	--output from forwardB mux
	signal ForwardBout: std_logic_vector(31 downto 0);
	-- From MUX1, Between Instruction Memory and Register File (input for Write Register)
	signal ChosenWriteReg : STD_LOGIC_VECTOR (4 downto 0);

	-- From MUX2 Between Register File/Sign Extend and ALU (ALU Input 2)
	signal ChosenALUInput : STD_LOGIC_VECTOR (31 downto 0);

	-- From MUX3 Between ALU/Data Memory and Instruction Memory (input for Write Data)
	signal ChosenWriteData : STD_LOGIC_VECTOR (31 downto 0);
	
	--input to PC register
	signal FinalPCAddress : STD_LOGIC_VECTOR (31 downto 0);

	--writenable signal from the controlunit
	signal enablepcwrite: std_logic;
	
		-- From Concat
	signal Concat : STD_LOGIC_VECTOR (31 downto 0); -- Data output from Concat
	--incremented PC signal to MUX
	signal incremented : STD_LOGIC_VECTOR (31 downto 0);
	--output from mux1
	signal mux1out: STD_LOGIC_VECTOR (31 downto 0);
	
	
	-- Output signals from the controller.
	signal Ops : std_logic_vector (8 downto 0);
	-- They are divided into each signal to make the overview easier
	--signal jump : std_logic;
	--signal memwrite : std_logic;
	--signal regwrite : std_logic;
	--signal memtoreg : std_logic;
	--signal alusrc : std_logic;
	--signal branch : std_logic;
	--signal regdest : std_logic;
	--signal ALUOp : std_logic_vector(1 downto 0);
	--assigned to the alu operation. We dont use the enumeration in aluOP module because its easier for us to use a vector
	signal operation: std_logic_vector(3 downto 0);
	--branchadder
	signal BranchAdder : STD_LOGIC_VECTOR (31 downto 0);
	--IF/ID out
	signal IFIDs: std_logic_vector(63 downto 0);
	
	--ID/EX out
	signal IDEXs: std_logic_vector(183 downto 0);
	
	--EX/MEM out
	
	signal EXMEMs: std_logic_vector(138 downto 0);
	
	--mem/wb output
	signal MEMWBs: std_logic_vector(70 downto 0);
	
		--this signal is 1 if branch equal
	signal branch_ok: std_logic;

	begin
	
	--branch ok
	branch_ok <= (EXMEMs(138) and EXMEMs(69));
	
	--assign control signals
	--jump <= Ops(0); -- Jump
	--memwrite <= Ops(1);
	--regwrite <= Ops(2);
	--memtoreg <= Ops(3);
	--alusrc <= Ops(4);
	--branch <= Ops(5);
	--regdest <= Ops(6);
	--ALUOp(0) <= Ops(7);
--	ALUOp(1) <= Ops(8); -- ALUOp(1)
	--if more non-R instructions are added, add more aluOP signals

	--perform signextension
	Signextended(15 downto 0) <=IFIDs(15 downto 0);
	Signextended(31 downto 16) <= (31 downto 16 => IFIDs(15));


	--assignments for alu controlsignals
	ALUControl.op0<=operation(0 );
	ALUControl.op1<=operation(1 );
	ALUControl.op2<=operation(2);
	ALUControl.op3<=operation(3 );--check all these signals
	--if more alufunctions are needed, add more signals when needed
	
	--mapping out of processor
	imem_address<=PC_output;
	dmem_address<=EXMEMs(68 downto 37);--aluresult
	dmem_address_wr<=EXMEMs(68 downto 37);
	dmem_data_out<=EXMEMs(36 downto 5);--read_data2;
	dmem_write_enable<=EXMEMs(135);--memwrite;

	--PCPath: controlpath
    --Port map ( PC_OUTPUT => IDEXs(137 downto 106),
		--	  Signextended =>IDEXs(41 downto 10),
        --   Instr_Mem_Concat =>IFIDs(25 downto 0),--!!!!!!!
          -- FinalPCAddress =>FinalPCAddress,
  --         jump =>jump,
--			  branch=>branch,
	--		  zero=>zero.zero);
			  
	ALUOpModule : ALUOPERATION Port map ( aluop0 =>IDEXs(177),--ALUOp(0)
           aluop1 =>IDEXs(178),--ALUOp(1),
           funct =>IDEXs(13 downto 10),--we dont need 5 signals in, so we ignore them
           operation =>operation);


	ALUTD : ALU generic map ( N=>DDATA_BUS)  port map(
			  X => ForwardAout,--IDEXs(105 downto 74),
			  Y => ChosenALUInput,
			  ALU_IN	=> ALUControl,
			  R => ALU_Result,
			  FLAGS => ZERO
	);
	
	REGISTER_F: REGISTER_FILE port map(
			  CLK => clk,			
			  RESET => reset,		
			  RS => read_data1,				
			  RT => read_data2,--the dataoutput which also go to the mux
			  RW =>  MEMWBs(69),
		  	  RS_ADDR => IFIDs(25 downto 21), --addresses for the register datas
			  RT_ADDR => IFIDs(20 downto 16), --addresses for the register datas
			  RD_ADDR => MEMWBs(4 downto 0),--ChosenWriteReg,
			  WRITE_DATA => ChosenWriteData
	);
	COUNTER: PC port map(
	 Data_in => FinalPCAddress,
           data_out => PC_Output,
           clock => clk,
           reset => reset,
           write_enable =>enablepcwrite
	
	);
	IFID: regi generic map ( N=>64) port map(
		 Data_in => pc_output&imem_data_in,--??
           data_out => IFIDs,
           clock => clk,
           reset => reset,
			  write_enable=>'0'
	);
	IDEX: regi generic map (N=>184) port map(
	--OMGOMGOMGOMG
			 Data_in => IFIDs(25 downto 21)&Ops&IFIDs(31 downto 26)&IFIDs(25 downto 0)&IFIDs(63 downto 32)&read_data1&read_data2&Signextended&IFIDs(20 downto 16)&IFIDs(15 downto 11),--138+25, perform signex later?
           data_out => IDEXs,
           clock => clk,
           reset => reset,
			  write_enable=>'0'
	);
	EXMEM: regi generic map (N=>139)  port map(
	--OOOMG
			 Data_in => IDEXs(175)&IDEXs(173 downto 170)&concat&branchadder&zero.zero&ALU_Result&IDEXs(73 downto 42)&ChosenWriteReg,--134, not 161 bit
           data_out => EXMEMs,
           clock => clk,
           reset => reset,
			  write_enable=>'0'
	);
	MEMWB: regi generic map (N=>71) port map(
			 Data_in => EXMEMs(137)&EXMEMs(136)&dmem_data_in&EXMEMs(68 downto 37)&EXMEMs(4 downto 0),--
           data_out => MEMWBs,
           clock => clk,
           reset => reset,
			  write_enable=>'0'
	);
	
	Forwardunit: Forwarding
    Port map ( ExmemregisterRD =>EXMEMs(4 downto 0),
           MEMWbregisterRD =>MEMWBs(4 downto 0),
			  MEMWBregwrite=>MEMWBs(69),
			  EXMEMregwrite=>EXMEMs(136),--ops
           RS =>IDEXs(183 downto 179),--check this is not crisscorssed
           RT =>IDEXs(9 downto 5),--verify this, updated in commit
           forwardA =>ctForwardA,
           forwardB =>ctForwardB);
			  
	CONTROL_UNIT: CONTROL Port map(
			  control_input =>IFIDS(31 downto 26),
           Ops => Ops,
			  clk => clk,
			  reset=> reset,
			  processor_enable=> processor_enable,
			  write_enable=> enablepcwrite);
			  
		--!!!!!	  
	Concat <= IDEXs(169 downto 164) & IDEXs(163 downto 138);--32 bit
	
	-- Incrementer increases input from PC with 1 bit, since the MIPS processor will be
	-- addressing by words
	Addressincrementer: adder port map(
		x => PC_output,
		y => "00000000000000000000000000000001",
		R => incremented
	);
	
	-- ADRESSADDER is the second adder, which is used for calculation new PC based on branching
	ADDRESSADDER: adder port map(
		X	=> IDEXs(137 downto 106),
		Y	=> IDEXs(41 downto 10),
		R	=> BranchAdder
	);
	
	ForwardmuxA: TriputMux 
    Port map( A =>IDEXs(105 downto 74),
           B =>EXMEMs(68 downto 37),
           C =>ChosenWriteData,
           R =>ForwardAout,
           control =>ctForwardA);
			  
			  	ForwardmuxB: TriputMux 
    Port map( A =>IDEXs(73 downto 42),--OOOOOOOOOMGOMGOMGOGM
           B =>EXMEMs(68 downto 37),
           C =>ChosenWriteData,
           R =>ForwardBout,
           control =>ctForwardB);

			  --mux for chosing write register
			  --need to redefine the generic by mapping it to a new value.
	MUX1: simple_multiplexer generic map ( N=>5) port map(

			  a => IDEXs(9 downto 5),
           b => IDEXs(4 downto 0),
           control_signal => IDEXs(176),--regdest,
           output => ChosenWriteReg);
			  
			  --mux for chosing alu input
	MUX2: simple_multiplexer port map( 
			  a => ForwardBout,--IDEXs(73 downto 42),
           b => IDEXs(41 downto 10),
           control_signal => IDEXs(174),--alusrc,
           output => ChosenALUInput);
			--mux for chosing input from DMEM
	MUX3: simple_multiplexer port map(	 
           b =>MEMWBs(68 downto 37),--dmem_data_in, 
			  a => MEMWBs(36 downto 5),--ALU_Result,
           control_signal => MEMWBs(70),--memtoreg,
           output => ChosenWriteData);

	-- First multiplexor. It is used to choose between regular incremented PC value or PC value based on branching
	MUX4: simple_multiplexer port map( 
		a => incremented,
      b => EXMEMs(101 downto 70),--BranchAdder,
		control_signal => branch_ok,
      output => mux1out
	);
		
	-- Second multiplexor. It is used to choose between the result from the first multiplexor, or PC value based on jump-instruction
	MUX5: simple_multiplexer port map( 
		a =>mux1out,
      b => EXMEMs(133 downto 102),
      control_signal =>EXMEMs(134),--jump,
      output =>FinalPCAddress
	);
end Behavioral;
