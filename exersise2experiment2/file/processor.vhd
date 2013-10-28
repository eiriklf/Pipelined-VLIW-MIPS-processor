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
	
	component Hazarddetection is
    Port ( IDEXCONTROL : in  STD_LOGIC_VECTOR(8 downto 0);
           IDEXregisterRT : in  STD_LOGIC_VECTOR(31 downto 0);
			  IFIDInstructionType: in  STD_LOGIC_VECTOR (5 downto 0);
           PCWrite : out  STD_LOGIC;
			  IFIDwrite: out STD_LOGIC;
			  IFIDreset: out STD_LOGIC;--syncronous reset for god's sake
			  processor_enable: in std_logic;
           Controlenable : out  STD_LOGIC;
			  State: out std_logic_vector(1 downto 0);
			  State_in: in std_logic_vector(1 downto 0);
			  State_in2: in std_logic_vector(1 downto 0);
			  buffer_write: out std_logic;
			  branch: in std_logic;
			  branch_ok:out std_logic;
			  revert:out std_logic;
			  IFIDbranch_taken: in std_logic;
			  branch_taken: out std_logic;
			  equalvals2: in std_logic_vector(31 downto 0);
			  predicted_address: in std_logic_vector(15 downto 0);
			  branch_address: in std_logic_vector(15 downto 0)
			  );
	end component Hazarddetection;
	
		component predictorbuffer is
	port(
			CLK 			:	in	STD_LOGIC;				
			RESET			:	in	STD_LOGIC;				
			RW				:	in	STD_LOGIC;				
			RS_ADDR 		:	in	STD_LOGIC_VECTOR (4 downto 0); 
			RT_ADDR 		:	in	STD_LOGIC_VECTOR (4 downto 0); 
			RD_ADDR 		:	in	STD_LOGIC_VECTOR (4 downto 0);
			WRITE_DATA	:	in	STD_LOGIC_VECTOR (17 downto 0); 
			RS				:	out	STD_LOGIC_VECTOR (17 downto 0);
			RT				:	out	STD_LOGIC_VECTOR (17 downto 0)
	);

end component predictorbuffer;

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
			  reset: in std_logic;
			  clk: in std_logic);
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
	signal mux2out: STD_LOGIC_VECTOR (31 downto 0);
	signal branchcalc: STD_LOGIC_VECTOR (31 downto 0);
	
	
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
	signal IFIDs: std_logic_vector(85 downto 0);
	
	--ID/EX out
	signal IDEXs: std_logic_vector(184 downto 0);
	
	--EX/MEM out
	
	signal EXMEMs: std_logic_vector(138 downto 0);
	
	--mem/wb output
	signal MEMWBs: std_logic_vector(70 downto 0);
	
		--this signal is 1 if branch equal
	signal branch_ok: std_logic;
	
	--enables output from controlunit
	signal control_enable: std_logic;
	
	--chosen operation from the controloutputmux
	signal chosen_OP: std_logic_vector(8 downto 0);
	
	--flushsignals
	
	signal IFflush:std_logic;
	
	--controls write to IFID
	signal IFIDwrite:std_logic;
	signal IFIDreset: std_logic;

	
	--enables write to pcpointer register and the predictionbuffer
	--output from state in branchpredictor
	signal state:std_logic_vector(1 downto 0);
	signal stateread:std_logic_vector(17 downto 0);
	--output from the PCpointer
	signal predictionout: std_logic_vector(31 downto 0);
	--signal to write to the dynamic branchpred registers
	signal buffer_write: std_logic;
	
	--output for the muxt for the branchadress
	signal branch_out:std_logic_vector(31 downto 0);
	
	signal revert: std_logic;
	
	signal equalvals:std_logic_vector(31 downto 0);
	signal equalvals2:std_logic_vector(31 downto 0);
	
	signal branch_taken: std_logic;
	signal stateread2:std_logic_vector(17 downto 0);
	begin
	--equalvals<=(IDEXs(105 downto 74) xor IDEXs(73 downto 42));
	equalvals2<=read_data1 xor read_data2;

	
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
	imem_address<=PC_OUTPUT;
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
	IFID: regi generic map ( N=>86) port map(
		 Data_in =>stateread(15 downto 0)&pc_output(4 downto 0)&branch_taken&incremented&imem_data_in,--change incremented?
           data_out => IFIDs,
           clock => clk,
           reset => IFIDreset,
			  write_enable=>IFIDwrite
	);
	IDEX: regi generic map (N=>185) port map(
	--OMGOMGOMGOMG
			 Data_in => IFIDs(64)&IFIDs(25 downto 21)&chosen_OP&IFIDs(31 downto 26)&IFIDs(25 downto 0)&IFIDs(63 downto 32)&read_data1&read_data2&Signextended&IFIDs(20 downto 16)&IFIDs(15 downto 11),--138+25, perform signex later?
           data_out => IDEXs,
           clock => clk,
           reset => reset,
			  write_enable=>'1'
	);
	EXMEM: regi generic map (N=>139)  port map(
			 Data_in => IDEXs(175)&IDEXs(173 downto 170)&concat&branchadder&zero.zero&ALU_Result&ForwardBout&ChosenWriteReg,--134, not 161 bit
           data_out => EXMEMs,
           clock => clk,
           reset => reset,
			  write_enable=>'1'
	);
	MEMWB: regi generic map (N=>71) port map(
			 Data_in => EXMEMs(137)&EXMEMs(136)&dmem_data_in&EXMEMs(68 downto 37)&EXMEMs(4 downto 0),--
           data_out => MEMWBs,
           clock => clk,
           reset => reset,
			  write_enable=>'1'
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
			  reset=> reset);
			  
	DETECTION_UNIT: Hazarddetection
    Port map ( IDEXCONTROL=>IDEXs(178 downto 170),--figures out if operation in idex register is read
           IDEXregisterRT=>IDEXs(73 downto 42),--RT register
			  IFIDInstructionType=>IFIDs(31 downto 26),
           PCWrite =>enablepcwrite,--enable PC write
           Controlenable=>control_enable,
			  processor_enable=> processor_enable,
			  buffer_write=>buffer_write,
			  State_in=>stateread(17 downto 16),
			  state_in2=>stateread2(17 downto 16),
			  State=>State,
			  IFIDwrite=>IFIDwrite,
			  IFIDreset=>IFIDreset,
			  branch_ok=>branch_ok,
			  IFIDbranch_taken=>IFIDs(64),
			  --IDEXbranch_taken=>IDEXs(184), 
			  branch_taken=>branch_taken,
			  branch=>chosen_OP(5),
			  revert=>revert,
			 -- equalvals=>equalvals,
			  equalvals2=>equalvals2,
			  --IDEXbranch=>IDEXs(175)
			  branch_address=>stateread2(15 downto 0),
			  predicted_address=>IFIDs(85 downto 70)
			  
			  
			  );
			  
		--!!!!!	  
	Concat <= IFIDs(63 downto 58)&IFIDs(25 downto 0);--IDEXs(169 downto 164) & IDEXs(163 downto 138);--32 bit
	
	-- Incrementer increases input from PC with 1 bit, since the MIPS processor will be
	-- addressing by words
	Addressincrementer: adder port map(
		x => pc_output,
		y => "00000000000000000000000000000001",
		R => incremented
	);
	
	
	-- ADRESSADDER is the second adder, which is used for calculation new PC based on branching
	ADDRESSADDER: adder port map(
		X	=>IFIDs(63 downto 32),
		Y	=>Signextended,
		R	=> BranchAdder
	);
	
		PREDICTOR_BUFF: predictorbuffer
	port map(
			CLK 	=>clk,			
			RESET		=>reset,				
			RW			=>buffer_write,			
			RS_ADDR 		=>pc_output(4 downto 0),
			RT_ADDR		=>IFIDs(69 downto 65),
			RD_ADDR 		=>IFIDs(69 downto 65),
			WRITE_DATA	=>state&BranchAdder(15 downto 0), --look on this
			RS				=>stateread,
			RT 			=>stateread2
	);
	
	
	ForwardmuxA: TriputMux 
    Port map( A =>IDEXs(105 downto 74),--readdataB
           B =>EXMEMs(68 downto 37),--aluresult
           C =>ChosenWriteData,
           R =>ForwardAout,
           control =>ctForwardA);
			  
			  	ForwardmuxB: TriputMux 
    Port map( A =>IDEXs(73 downto 42),--ReaddataA
           B =>EXMEMs(68 downto 37),--aluresult
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
		a => mux2out,
      b =>BranchAdder,-- EXMEMs(101 downto 70),
		control_signal => branch_ok,
      output => branchcalc
	);
		
		--outputs pc counter if branch is taken and revert back to the old address if not taken
			BranchTAKEN:	simple_multiplexer port map( 
		a =>incremented,
      b => IFIDs(63 downto 32),--FIX
      control_signal =>revert,--must fix
      output =>mux1out
	);
	--output the result address from branchprediction
				BranchPRED:	simple_multiplexer port map( 
		a =>mux1out,
      b => incremented(31 downto 16)&stateread(15 downto 0),--the calculated branch destination, maybe pc_output instead of incremented signal
      control_signal =>branch_Taken,--must fix
      output =>mux2out
	);
	-- Second multiplexor. It is used to choose between the result from the first multiplexor, or PC value based on jump-instruction
	MUX5: simple_multiplexer port map( 
		a =>branchcalc,
      b => Concat,
      control_signal =>chosen_OP(0),--EXMEMs(134)
      output =>FinalPCAddress
	);
	
		CONTROL_OUTPUT: simple_multiplexer generic map ( N=>9) port map( 
		a =>"000000000",
      b => OPs,
      control_signal =>control_enable,--jump,
      output =>chosen_OP
	);
end Behavioral;
