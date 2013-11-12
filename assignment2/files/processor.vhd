library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use WORK.MIPS_CONSTANT_PKG.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


--This file contains the processor module. This module is mainly where all the lesser components (like registers, alus and so on) are wired together. 
--The branchcondition (if the branch is actually taken or not) is also calculated in this file/module to make it easier to distribute the result to various components.
--We also have several pipeline registers in this file, and above every pipeline register we have made a comment-field about what the corresponding signal the different bits of the-
-- pipeline registers maps. This is done because many of the signals goes through several pipeline registers, and it is then easy to lose track of which signal is which.
--We also did the same thing on some of the more basic signals that is remapped like the control signals.

--There is an explaination for every component when it is declared. There is also a deeper explaination about the design of every component inside their respective files.
--This is usually related to designchoices.

--We also considered placing some of the components here inside their own files. However, we were also aware of that this also would make it much harder to 
--perform changes to our design.
 
entity PROCESSOR is
 generic ( MEM_ADDR_BUS: natural := 32; MEM_DATA_BUS : natural := 32);
    Port (
        clk                 : in STD_LOGIC;
        reset               : in STD_LOGIC;
        processor_enable    : in  STD_LOGIC;
        imem_address        : out  STD_LOGIC_VECTOR (MEM_ADDR_BUS-1 downto 0);
        imem_address2       : out  STD_LOGIC_VECTOR (MEM_ADDR_BUS-1 downto 0);
        imem_data_in        : in  STD_LOGIC_VECTOR (MEM_DATA_BUS-1 downto 0);
        imem_data2_in       : in  STD_LOGIC_VECTOR (MEM_DATA_BUS-1 downto 0);
        dmem_data_in        : in  STD_LOGIC_VECTOR (MEM_DATA_BUS-1 downto 0);
        dmem_address        : out  STD_LOGIC_VECTOR (MEM_ADDR_BUS-1 downto 0);
        dmem_address_wr     : out  STD_LOGIC_VECTOR (MEM_ADDR_BUS-1 downto 0);
        dmem_data_out       : out  STD_LOGIC_VECTOR (MEM_DATA_BUS-1 downto 0);
        dmem_write_enable   : out  STD_LOGIC
    );
end PROCESSOR;

architecture Behavioral of PROCESSOR is

    --component declarations
    
    --the controlmodule for the secound path with multiplier. 
    component Vliw_multipliercontrol is
    Port ( IFID_funct : in  STD_LOGIC_VECTOR (5 downto 0);
           LOHI_write : out  STD_LOGIC
           );
    end component Vliw_multipliercontrol;
    
    --general purpose shiftregister, used for storing the 2 latest branch conditions (taken or not taken)
    component shift_register is
    Port (
              data_in            : in  STD_LOGIC;
              data_out           : out  STD_LOGIC_VECTOR (1 downto 0);--2 bits index
              clock              : in  STD_LOGIC;
              reset              : in  STD_LOGIC;
              write_enable       : in  STD_LOGIC
              );
    end component shift_register;

    --mux with 4 inputs, used for chosing what writedata is being used. See the port mapping for more information
    component QuadputMux is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           C : in  STD_LOGIC_VECTOR (31 downto 0);
           D : in  STD_LOGIC_VECTOR (31 downto 0);
           R : out  STD_LOGIC_VECTOR (31 downto 0);
           control : in  STD_LOGIC_VECTOR (1 downto 0));
    end component QuadputMux;
    
    --This is the unit responsible for detecting hazards related to load operations. It also ensures that the PC register can be written to when the processorenable is set from the-
    -- com-module.
    component Hazarddetection is
    Port (    IDEXCONTROL           : in  STD_LOGIC_VECTOR(9 downto 0);
              IDEXregisterRT        : in  STD_LOGIC_VECTOR(4 downto 0);
              IFIDregisterRS        : in  STD_LOGIC_VECTOR(4 downto 0);
              IFIDregisterRT        : in  STD_LOGIC_VECTOR(4 downto 0);
              IFIDInstructionType   : in  STD_LOGIC_VECTOR (5 downto 0);
              PCWrite               : out  STD_LOGIC;
              IFIDwrite             : out STD_LOGIC;
              processor_enable      : in std_logic;
              Controlenable         : out  STD_LOGIC
              );
    end component Hazarddetection;
    
    
    --This unit is responcible for everything related to branch-control hazards. It is also responcible for doing branch-predictions and everything related to it.
    component branchprediction is
    Port (
                IDEXInstructionType           : in std_logic_vector(5 downto 0);
              IFIDreset                       : out STD_LOGIC;--syncronous reset for ifid register. Must be done when a branch prediction fails in order to prevent the wrong instructions to be executed
              IDEXreset                       : out std_logic; --resets idex register syncronously
              State                           : out std_logic_vector(1 downto 0); --the incremented state to be written back to the local branch prediction buffer (ID stage).
              State_in                        : in std_logic_vector(1 downto 0);-- the information from the local branch prediction buffer. (IF stage)
              IDEX_state_in                   : in std_logic_vector(1 downto 0);   --the information from the local branch prediction buffer.(ID stage)
              buffer_write                    : out std_logic;  --signal that allow writes to all the prediction buffers
              branch_ok                       : out std_logic; --signal to allow the calculated branch address to the PC register
              revert                          : out std_logic;-- signal that allows reverting a faulty branchprediction
				  IDEXbranch_taken					 : in std_logic;
              branch_taken                    : out std_logic;--signals the a mux wheter a branchprediction should be taken or not. Signal is determined in IF stage
              branched1                       : in std_logic; --tells wheter a branch (not the prediction) is actually taken or not
              predicted_address               : in std_logic_vector(31 downto 0);--this is the predicted address, it must be tested if its the actual right branchaddress
              branch_address                  : in std_logic_vector(31 downto 0)--this is the actual branch address
              );
end component branchprediction;
    
    --this is a "registerfile" used for storing predicted branch-addresses. If a branch is predicted to be taken, an entry(a calculated branchaddress) 
    --from this register (indexed by the pc) will be loaded into the PC-register
        component predictorbuffer is
    generic (N :NATURAL :=16; M:NATURAL:=32; K:NATURAL:=4);
    port(
            CLK             :   in  STD_LOGIC;              
            RESET           :   in  STD_LOGIC;              
            RW              :   in  STD_LOGIC;
            Read_address    :   in  STD_LOGIC_VECTOR (K downto 0);
            Write_address   :   in  STD_LOGIC_VECTOR (K downto 0);
            WRITE_DATA      :   in  STD_LOGIC_VECTOR (N-1 downto 0);
            Data_out        :   out STD_LOGIC_VECTOR (N-1 downto 0)
            );
    end component predictorbuffer;

    --this is the aluOP-module. It is used for calculating aluoperations and other signals (memtoregs) that are dependent on the "funct-field" of an issued instruction. 
    component ALUOperation is
    Port ( ALUOp0          : in  STD_LOGIC;
           ALUOp1          : in  STD_LOGIC;
           funct           : in  STD_LOGIC_VECTOR (5 downto 0);
           operation       : out  STD_LOGIC_VECTOR (4 downto 0);
           memtoreg2       : out std_logic;
           memtoreg        : out std_logic
              );
    end component ALUOperation;
    
    --This is a generic adder. It is made 2 instances of this. 1 for incrementing the PC, and 1 for calculating branchaddress. 
    component adder is
    generic (N :NATURAL :=32);
    port(
            X   : in    STD_LOGIC_VECTOR(N-1 downto 0);
            Y   : in    STD_LOGIC_VECTOR(N-1 downto 0);
            COUT: out   STD_LOGIC;
            R   : out   STD_LOGIC_VECTOR(N-1 downto 0)
            );
    end component adder;

    --this is the registerfile which is used to store data. See it's file for more information
    component REGISTER_FILE is
    port(
            CLK             :   in  STD_LOGIC;              
            RESET           :   in  STD_LOGIC;              
            RW              :   in  STD_LOGIC;              
            RS_ADDR         :   in  STD_LOGIC_VECTOR (RADDR_BUS-1 downto 0); 
            RT_ADDR         :   in  STD_LOGIC_VECTOR (RADDR_BUS-1 downto 0); 
            RD_ADDR         :   in  STD_LOGIC_VECTOR (RADDR_BUS-1 downto 0);
            WRITE_DATA  :   in  STD_LOGIC_VECTOR (31 downto 0); 
            RS              :   out STD_LOGIC_VECTOR (31 downto 0);
            RT              :   out STD_LOGIC_VECTOR (31 downto 0);
            RS_ADDR2    :   in  STD_LOGIC_VECTOR (RADDR_BUS-1 downto 0);--RS address for the multiply-issue path
            RT_ADDR2        :   in  STD_LOGIC_VECTOR (RADDR_BUS-1 downto 0);--RT address for the multiply-issue path
            RS2         :   out STD_LOGIC_VECTOR (31 downto 0); --readdata1(rs) for multiply-issued path
            RT2         :   out STD_LOGIC_VECTOR (31 downto 0)  --readdata2(rt) for multiply-issued path
    );
    end component REGISTER_FILE;
    
    --this is a general purpose, generic register with syncronous reset and writenable. It is used for many applications like pipelineregisters
    component Regi is
    generic(N : natural :=32);
   port ( Data_in         : in  STD_LOGIC_VECTOR (N-1 downto 0);
           data_out       : out  STD_LOGIC_VECTOR (N-1 downto 0);
           clock          : in  STD_LOGIC;
           reset          : in  STD_LOGIC;
           write_enable   : in  STD_LOGIC);
    end component regi;

    --the primary alu
    component alu is
                generic (N :NATURAL :=DDATA_BUS);
        port(
            X           : in STD_LOGIC_VECTOR(N-1 downto 0);
            Y           : in STD_LOGIC_VECTOR(N-1 downto 0);
            ALU_IN      : in ALU_INPUT;
            R           : out STD_LOGIC_VECTOR(N-1 downto 0);
            FLAGS       : out ALU_FLAGS
        );
    end component alu;

    --ALU2/the multiplier module
    component Vliw_alu is
    generic (N :NATURAL :=32);
        port(
                X                        : in STD_LOGIC_VECTOR(N-1 downto 0);
                Y                        : in STD_LOGIC_VECTOR(N-1 downto 0);
                R_LO                     : out STD_LOGIC_VECTOR(N-1 downto 0);
                R_HI                     : out std_logic_vector(N-1 downto 0)
        );
    end component Vliw_alu;

    --PC-register
    component PC is
        Port (
           Data_in     : in  STD_LOGIC_VECTOR (31 downto 0);
           data_out    : out  STD_LOGIC_VECTOR (31 downto 0);
           clock       : in  STD_LOGIC;
           reset       : in  STD_LOGIC;
           write_enable: in  STD_LOGIC);
    end component PC;

    --generic simple multiplexer
    component simple_multiplexer is
    generic (N :NATURAL :=32);
        Port (
             a              : in  STD_LOGIC_VECTOR (N-1 downto 0);
             b              : in  STD_LOGIC_VECTOR (N-1 downto 0);
             control_signal : in  STD_LOGIC;
             output         : out  STD_LOGIC_VECTOR (N-1 downto 0)
             );
    end component simple_multiplexer;

    --control unit
    component control is
    Port (    control_input : in  STD_LOGIC_VECTOR (5 downto 0);
              Ops           : out STD_LOGIC_VECTOR (9 downto 0);
              clk           : in std_logic;
              reset         : in std_logic
              );
    end component control;

    --the forwarding unit
    component Forwarding is
    Port ( ExmemregisterRD : in  STD_LOGIC_VECTOR (4 downto 0);
           MEMWbregisterRD : in  STD_LOGIC_VECTOR (4 downto 0);
			  MEMWBregwrite: in std_logic;
			  EXMEMregwrite: in std_logic;
			  WB2regwrite: in std_logic;
           IDEX_RS : in  STD_LOGIC_VECTOR (4 downto 0);
           IDEX_RT : in  STD_LOGIC_VECTOR (4 downto 0);
           forwardA : out  STD_LOGIC_VECTOR (1 downto 0);
           forwardB  : out  STD_LOGIC_VECTOR (1 downto 0);
			  Wb2registerRD: in std_logic_vector(4 downto 0)
			  );
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
	 signal forwardrs: std_logic;
    
    --output from forwardB mux
    signal ForwardBout: std_logic_vector(31 downto 0);
	 signal forwardrt: std_logic;
    -- From MUX, Between Instruction Memory and Register File (input for Write Register)
    signal ChosenWriteReg : STD_LOGIC_VECTOR (4 downto 0);

    -- From MUX Between Register File/Sign Extend and ALU (ALU Input 2)
    signal ChosenALUInput : STD_LOGIC_VECTOR (31 downto 0);

    -- From MUX Between ALU/Data Memory and Instruction Memory (input for Write Data)
    signal ChosenWriteData : STD_LOGIC_VECTOR (31 downto 0);
    
    --input to PC register
    signal FinalPCAddress : STD_LOGIC_VECTOR (31 downto 0);
    
        -- From Concat
    signal Concat : STD_LOGIC_VECTOR (31 downto 0); -- Data output from Concat
    --incremented PC signal to MUX
    signal incremented : STD_LOGIC_VECTOR (31 downto 0);
    --output from branchtakenmux
    signal mux1out: STD_LOGIC_VECTOR (31 downto 0);
	 --output from revert mux
    signal mux2out: STD_LOGIC_VECTOR (31 downto 0);
	 --output from branchmux
    signal branchcalc: STD_LOGIC_VECTOR (31 downto 0);
    
    signal address_shift: STD_LOGIC_VECTOR(31 downto 0);
    
    signal operation: std_logic_vector(4 downto 0);
    --branchadder
    signal BranchAdder : STD_LOGIC_VECTOR (31 downto 0);
    
    
    --signals for the pipeline register
    
    --IF/ID in
    signal IFID_in: std_logic_vector(121 downto 0); 
    --IF/ID out
    signal IFIDs: std_logic_vector(121 downto 0);
    --ID/EX in
    signal IDEX_in: std_logic_vector(287 downto 0); 
    --ID/EX out
    signal IDEXs: std_logic_vector(287 downto 0);
    
    --EX/MEM in
    signal EXMEM_in: std_logic_vector(204 downto 0);    
    --EX/MEM out
    signal EXMEMs: std_logic_vector(204 downto 0);
    
    --mem/wb in
    signal MEMWB_in: std_logic_vector(71 downto 0);
    --mem/wb output
    signal MEMWBs: std_logic_vector(71 downto 0);
	 
	 --wb2 output
	 signal WB2s: std_logic_vector(37 downto 0);
	 --wb2 input
	 signal wb2_in:std_logic_vector(37 downto 0);
    
    --mux controlinputs
    
    --this signal is 1 if branch equal
    signal branch_ok: std_logic;
    --revert signal
    signal revert: std_logic;
    --indicates if prediction is taken
    signal branch_taken: std_logic;
    -- Output signals from the controller.
	 -- They are divided into each signal to make the overview easier
    --signal jump : std_logic;
    --signal memwrite : std_logic;
    --signal regwrite : std_logic;
    --signal alusrc : std_logic;
    --signal branch(1)/BEQ : std_logic;
    --signal regdest : std_logic;
    --signal ALUOp : std_logic_vector(1 downto 0);
    --signal branch(0)/BNE : std_logic;
    signal Ops : std_logic_vector (9 downto 0);
	 --signals for memtoreg_mux
    signal memtoreg : std_logic;--was originally a part of ops vector, but took it out for simplicity reasons
	 signal memtoreg2: std_logic;
	 
    signal QuadputMux_control: std_logic_vector(1 downto 0);  
        --chosen operation from the controloutputmux
    signal chosen_OP: std_logic_vector(9 downto 0);
    --enables output from controlunit through a mux.
        --Chosen_OP in IDEX pipelinestage
    signal IDEX_chosen_OP: std_logic_vector(9 downto 0);
    
    --enables controlsignals from the controlunit
    signal control_enable: std_logic;
    
    

    
    --flushsignals/resets
    signal IFIDreset: std_logic;
    signal IDEXreset: std_logic;
    --write controls
    signal IFIDwrite:std_logic;
    signal enablepcwrite: std_logic;
    --signal to write to the dynamic branchpred registers
    signal buffer_write: std_logic;
     
    --signals for the branch predictor buffers
    signal prediction_address: std_logic_vector(15 downto 0);
	 signal branch_taken_address: std_logic_vector(31 downto 0);
	 --prediction_address input for use in the branchpredictionunit(EX stage)
	 signal predicted_address_in: std_logic_vector(31 downto 0);
    signal prediction_readaddress:std_logic_vector(6 downto 0);
    signal prediction_writeaddress:std_logic_vector(6 downto 0);
    signal global_prediction_out: std_logic_vector(1 downto 0);
        --output/input for state in branchpredictor
    signal state_writeback:std_logic_vector(1 downto 0);
    signal stateread:std_logic_vector(1 downto 0);
    --signal generated from branch conditions(taken or not taken)
    signal branched1: std_logic;
    
    --for wliv/multiplier datapath
    
    signal Signextended2 : STD_LOGIC_VECTOR (31 downto 0); -- Data output from Signextend2. Not used,was planned for use in immidiate opperations
        
    signal Read_Data_vliw1 : STD_LOGIC_VECTOR (31 downto 0); -- Read data 1 from Register_File
    signal Read_Data_vliw2 : STD_LOGIC_VECTOR (31 downto 0); -- Read data 2 from Register_File
    
    --input to LO register
    signal LO_IN : std_logic_vector(31 downto 0);
    --input to HI register
    signal HI_IN: std_logic_vector(31 downto 0);
   
    signal LO_out: std_logic_vector(31 downto 0);
    signal HI_out: std_logic_vector(31 downto 0);
    signal LOHI_write: std_logic;   


    begin

        --checking branchcondition for any type of branchinstruction is done here.
        --if and only if branch is taken, the "branched1" signal is set to 1
        branched1 <= '1' when ((ForwardAout=ForwardBout) and idexs(149)='1')--(chosen_OP(5)='1'))--test for BEQ
    else '1' when (idexs(285)='1') and not (ForwardAout=ForwardBout)--Test for BNE, idexs(285)=chosen_OP(9)
    else '0';
    --assign control signals
    --jump         <= Ops(0);
    --memwrite     <= Ops(1);
    --regwrite     <= Ops(2);
    --Ops(3) is currently unconnected/reserved;
    --alusrc       <= Ops(4);
    --branch equal <= Ops(5);
    --regdest      <= Ops(6);
    --ALUOp(0)     <= Ops(7);
    --ALUOp(1)     <= Ops(8);
    --bne          <= Ops(9);


    --perform signextension
    Signextended(15 downto 0) <=IFIDs(103 downto 88);
    Signextended(31 downto 16) <= (31 downto 16 => IFIDs(103));

    --signextended 2 is for the secound/multiply datapath but is not currently used. Uncomment this if used
    --Signextended2(15 downto 0) <=IFIDs(71 downto 56);
    --Signextended2(31 downto 16) <= (31 downto 16 => IFIDs(71));
	 Signextended2<=zero32b;

    --assignments for alu controlsignals
    ALUControl.op0<=operation(0 );
    ALUControl.op1<=operation(1 );
    ALUControl.op2<=operation(2 );
    ALUControl.op3<=operation(3 );
    --if more alufunctions are needed, add more signals when needed

    --mapping out of processor
    imem_address     <=PC_OUTPUT;
    imem_address2    <=(PC_OUTPUT+1);--using adder built into library
    dmem_address     <=EXMEMs(68 downto 37);--aluresult
    dmem_address_wr  <=EXMEMs(68 downto 37);
    dmem_data_out    <=EXMEMs(36 downto 5);--read_data2;
    dmem_write_enable<=EXMEMs(135);--memwrite;
              
    ALUOpModule : ALUOPERATION
    Port map (
                aluop0     =>IDEXs(151),--ALUOp(0)
                aluop1     =>IDEXs(152),--ALUOp(1),
                funct      =>IDEXs(15 downto 10),--6 signals in
                operation  =>operation,
                memtoreg2  =>memtoreg2,
                memtoreg   =>memtoreg
              );


    ALUTD : ALU generic map ( N=>32)
    port map(
              X         => ForwardAout,
              Y         => ChosenALUInput,
              ALU_IN    => ALUControl,
              R         => ALU_Result,
              FLAGS     => ZERO
              );
    
        PATH2_ALU: Vliw_alu
    port map(
             X           =>IDEXs(258 downto 227),
             Y           =>IDEXs(226 downto 195),
             R_LO        =>LO_IN ,--output signal to LO register
             R_HI        =>HI_IN--output signal to HI register
        );

    --dual port register/memory
    REGISTER_F: REGISTER_FILE
    port map(
              CLK        => clk,
              RESET      => reset,
              RS         => read_data1,--RS data for the main datapath/instruction issue
              RT         => read_data2,--RT data for the main datapath/instruction issue
              RW         =>  MEMWBs(69),--registerwrite signal
              RS_ADDR    => IFIDs(113 downto 109), --addresses for the register datas
              RT_ADDR    => IFIDs(108 downto 104), --addresses for the register datas
              RD_ADDR    => MEMWBs(4 downto 0),--output from mux1/regdest
              RS2        => Read_Data_vliw1,--RS-data for the multiplier/secound-issue path
              RT2        => Read_Data_vliw2,--RT-data for the multiplier/secound-issue path
              RS_ADDR2   => IFIDs(81 downto 77),--RS-address for the multiplier/secound-issue path
              RT_ADDR2   => IFIDs(76 downto 72),--RT-address for the multiplier/secound-issue path
              WRITE_DATA => ChosenWriteData --output from the quadputmux in the WB-stage
              );

        --LO register tied to the multiplier
        LO: regi generic map ( N=>32)
        port map(
                 Data_in     =>EXMEMs(170 downto 139),--least significant 32 bits from the multiply-result
                 data_out    => LO_out,
                 clock       => clk,
                 reset       => reset,
                 write_enable=>EXMEMs(172) --LOHI_write signal
              );
        --HI register tied to the multiplier
        HI: regi generic map ( N=>32)
        port map(
                 Data_in     =>EXMEMs(204 downto 173),--most significant 32 bits(exept the COUT) from the multiply-result
                 data_out    => HI_out,
                 clock       => clk,
                 reset       => reset,
                 write_enable=>EXMEMs(172)  --LOHI_write signal
             );

        --simple control unit for the multiplier path
        Vliwcore2: Vliw_multipliercontrol
        Port map(
                  IFID_funct =>IFIDs(61 downto 56),
                  LOHI_write =>LOHI_write
              );


        COUNTER: PC
        port map(
                   data_in => FinalPCAddress,
                   data_out => PC_Output,
                   clock => clk,
                   reset => reset,
                   write_enable =>enablepcwrite
              );

              --IFID register mapping relations
    --pc_output(4 downto 0)										->IFIDs(37 downto 33)
    --global_prediction_out										->IFIDS(121 downto 120)
    --imemdata_in														->IFIDs(119 downto 88)
    --imemdata_in2													->IFIDs(87 downto 56)
    --stateread														->IFIDs(55 downto 54)
    --prediction_address											->IFIDs(53 downto 38)
    --pc_output(5 downto 1)										->IFIDs(37 downto 33)
    --branch_taken													->IFIDs(32)
    --incremented														->IFIDs(31 downto 0)
    IFID_in<=global_prediction_out&imem_data_in&imem_data2_in& stateread& prediction_address&pc_output(5 downto 1)&branch_taken&incremented;
        --pipeline register IFID
        IFID: regi generic map ( N=>122)
        port map(
                   data_in      =>IFID_in,
                   data_out     => IFIDs,
                   clock        => clk,
                   reset        => IFIDreset,
                   write_enable =>IFIDwrite
             );

          --IDEX register mapping relations
	 --RD_address/IFIDs(103 downto 99)		 					->IDEXs(4 downto 0)
	 --RT_address/IFIDs(108 downto 104)							->IDEXs(9 downto 5)
    --signextended													->IDEXs(41 downto 10)
    --read_data2														->IDEXs(73 downto 42)
    --read_data1														->IDEXs(105 downto 74)
    --incremented														->idexs(137 downto 106)
    --IFID_instructiontype											->idexs(143 downto 138)
    --chosen_OP(8 downto 4)&memtoreg&chosen_OP(2 downto 0)->IDEXs(152 downto 144)
    --IFID_RS_address												->IDEXs(157 downto 153)
    --IFIDs(71 downto 67)/Imemaddress2(16 downto 11)		->IDEXs(162 downto 158)--unused
    --signextended2													->IDEXs(194 downto 163)
    --Read_Data_vliw2												->IDEXs(226 downto 195) --Rt data from secound issue instruction
    --Read_Data_vliw1												->IDEX(258 downto 227) --RS data from secound issue isntruction
    --LOHI_write														->IDEXs(259)
    --'0'																->IDEXs(260) --currently only padding because of removed signal. In an eventual expansion of the implementation, this bit can be reused for that purpose
    --IFIDs(37 downto 33)/pc_output								->idexs(265 downto 261)
    --IFID_state in(1 downto 0)									->idexs(267 downto 266)
    --IFID_branchtaken												->idexs(268)
    --IFID_predicted address(15 downto 0)						->idexs(284 downto 269)
    --ifid_branch(BNE)												->idexs(285)
    --global_prediction_out										->idexs(287 downto 286)
    IDEX_in<=IFIDs(121 downto 120)&chosen_OP(9)&IFIDs(53 downto 38)&IFIDs(32)&IFIDs(55 downto 54)&IFIDs(37 downto 33)&'0'&LOHI_write&Read_Data_vliw1&Read_Data_vliw2&signextended2&IFIDs(71 downto 67)&IFIDs(113 downto 109)&chosen_OP(8 downto 4)&memtoreg&chosen_OP(2 downto 0)&IFIDs(119 downto 114)&IFIDs(31 downto 0)&read_data1&read_data2&Signextended&IFIDs(108 downto 104)&IFIDs(103 downto 99);
            --pipeline register IDEX
        IDEX: regi generic map (N=>288)
        port map(
                   data_in     =>IDEX_in,
                   data_out    => IDEXs,
                   clock       => clk,
                   reset       => IDEXreset,
                   write_enable=>'1'
             );
              --EXMEM register mapping relations
    --ChosenWriteReg											->EXMEMs(4 downto 0)
    --ForwardBout												->EXMEMs(36 downto 5)
    --ALU_Result												->EXMEMs(68 downto 37)
    --'0'														->EXMEMs(69) /was the zero flag from the ALU which was in earlier implementation used for branch. This can now be considered a "reserved" bit
    --branchadder												->EXMEMs(101 downto 70)
    --Concat													->EXMems(133 downto 102) --no longer in use (was used for jump early in development)
    --Chosen_OP(2 downto 0)/IDEXs(146 downto 144)	->EXMEMs(136 downto 134)
    --memtoreg													->EXMEMs(137)
    --regdest/IDEX(149)										->EXMEMs(138)
    --LO_IN														->EXMEMs(170 downto 139)
    --memtoreg2												->EXMEMs(171)
    --LOHI_write/IDEXs(259)								->EXMEMs(172)
    --HI_IN														->EXMEMs(204 downto 173)

    EXMEM_in<=HI_IN&IDEXs(259)&memtoreg2&LO_IN &IDEXs(149)&memtoreg&IDEXs(146 downto 144)&concat&branchadder&'0'&ALU_Result&ForwardBout&ChosenWriteReg;
           --pipeline register EXMEM
    EXMEM: regi generic map (N=>205)
    port map(
                data_in     => EXMEM_in,
                data_out    => EXMEMs,
                clock       => clk,
                reset       => reset,
                write_enable=>'1'
                );
					 
              --MEMWB register mapping relations
    --chosenWriteReg/EXMEMs(4 downto 0)	->MEMWBs(4 downto 0)
	 --Alu_result/EXMEMs(68 downto 37)		->MEMWBs(36 downto 5)
	 --Dmem_data_in								->MEMWBs(68 downto 37)
	 --regwrite/EXMEMs(136)						->MEMWBs(69)
	 --Memtoreg/EXMEMs(137)						->MEMWBs(70)
	 --memtoreg2/EXMEMs(171)					->MEMWBs(71)
    MEMWB_in<=EXMEMs(171)& EXMEMs(137)&EXMEMs(136)&dmem_data_in&EXMEMs(68 downto 37)&EXMEMs(4 downto 0);
           --pipeline register MEMWB
    MEMWB: regi generic map (N=>72)
    port map(
                data_in     =>MEMWB_in,
                data_out    => MEMWBs,
                clock       => clk,
                reset       => reset,
                write_enable=>'1'
                );
		              --WB2 register mapping relations
    --cchosenwritedata								->WB2s(31 downto 0)
	 --chosenWriteReg/MEMWBs(4 downto 0)		->WB2s(36 downto 32)
	 --regwrite/MEMWBs(69)							->MEMWBs(68 downto 37)			 
					 
	WB2_in<=MEMWBs(69)&MEMWBs(4 downto 0)&chosenwritedata;
	 WB2: regi generic map (N=>38)
    port map(
                data_in     =>WB2_in,
                data_out    => WB2s,
                clock       => clk,
                reset       => reset,
                write_enable=>'1'
                );
    --forwarding unit mapping. Following the naming conventions given in our book
    Forwardunit: Forwarding
    Port map (
                 ExmemregisterRD =>EXMEMs(4 downto 0),
                 MEMWbregisterRD =>MEMWBs(4 downto 0),
					  Wb2registerRD	=>wb2s(36 downto 32),
					  WB2regwrite		=>WB2s(37),
                 MEMWBregwrite   =>MEMWBs(69),
                 EXMEMregwrite   =>EXMEMs(136),
                 IDEX_RS         =>IDEXs(157 downto 153),--IDEX_RS1 signal
                 IDEX_RT         =>IDEXs(9 downto 5),    --IDEX_RT1 signal
                 forwardA        =>ctForwardA,--output signal to control the forwardA mux
                 forwardB        =>ctForwardB --output signal to control the forwardB mux
					  
                 );
    --mappings for the control unit. the controlunit controls most of muxes
    --related to the instructions/opcodes
    CONTROL_UNIT: CONTROL
    Port map(
                  control_input =>IFIDS(119 downto 114),
                  Ops           => Ops,
                  clk           => clk,
                  reset         => reset
                  );
    --the hazarddetection unit is responcible of controlling pcwrite and
    --to insert stalls when there are hazards related to load instruction(LW).
    IDEX_chosen_OP<=idexs(285)&IDEXs(152 downto 148)&memtoreg&IDEXs(146 downto 144);
    DETECTION_UNIT: Hazarddetection
    Port map (
                    IDEXCONTROL          =>IDEX_chosen_OP,--figures out if operation in idex register is read
                    IDEXregisterRT       =>IDEXs(9 downto 5),
                    IFIDregisterRS       =>IFIDs(113 downto 109),
                    IFIDregisterRT       =>IFIDs(108 downto 104),
                    IFIDInstructionType  =>IFIDs(119 downto 114),
                    PCWrite              =>enablepcwrite,--enable PC write
                    IFIDwrite            =>IFIDwrite,
                    Controlenable        =>control_enable,
                    processor_enable     => processor_enable
              );
    --Branchprediction unit, responsible for controlling branching and branch prediction.
    --See the component declaration and the corresponding vhdl file for more information
    --about the branchprediction unit, and what it is for.
	 predicted_address_in<=idexs(137 downto 122)&idexs(284 downto 269);
    Branch_predicition_unit: branchprediction
    port map(
                IDEXInstructionType          =>idexs(143 downto 138),
                buffer_write                 =>buffer_write,
                State_in                     =>stateread,
                IDEX_state_in                =>idexs(267 downto 266),--branch information data read from the prediction buffer(IF stage, sent through pipeline to IDEX)
                State                        =>State_writeback,--branch information data to be written back to the prediction buffer(EX stage)
                IFIDreset                    =>IFIDreset,
                IDEXreset                    =>IDEXreset,
                branch_ok                    =>branch_ok,
                IDEXbranch_taken             =>idexs(268), 
                branch_taken                 =>branch_taken,
                revert                       =>revert,
                branch_address               => BranchAdder,--output from branch address adder. Need to check that the predicted address and the actual branch target are the same
                predicted_address            =>predicted_address_in,-- the predicted address concated with the incremented PC_counter (EX stage)
                branched1                    =>branched1

                );
              
        --concatination used for jump instruction. The address field is shifted by
        -- 1 bit to the left to make sure that the data allways is "aligned" after
        --the jump (the accessed address must allways be even if the first instructionaddress is 0).
    Concat <= IFIDs(31 downto 27)&IFIDs(113 downto 88)&'0';

    -- Incrementer increases input from PC with 2 bits.
    Addressincrementer: adder
    port map(
                        x => pc_output,
                        y => "00000000000000000000000000000010",
                        R => incremented
                        );
    
    
    --The branch address is shifted 1 to the left for the same reason as above (concat signal)
    address_shift<=IDEXs(40 downto 10)&'0';
	 --the branchaddress is calculated and placed into the branchadder signal
	 branchadder<=address_shift+IDEXs(137 downto 106);
 
    --The branch target buffer stores the branch target addresses of previous branches. It is indexed by
    --the outputs from the PC only.
	 --4 branch predictions/predictors shares each branch address.
    BRANCH_TARGET_BUFFER: predictorbuffer
    port map(
            CLK             =>clk,              
            RESET           =>reset, --not currently used               
            RW              =>buffer_write,     -- set this with the prediction output
            Read_address    =>pc_output(5 downto 1), --we shift pc_output one to the left in order to use all the bits
            Write_address   =>IDEXs(265 downto 261), --PC_output in IDEX stage
            WRITE_DATA      =>BranchAdder(15 downto 0),--this address might fail in some occations
            Data_out        =>prediction_address
    );

        prediction_readaddress<=global_prediction_out&pc_output(5 downto 1);
        prediction_writeaddress<=idexs(287 downto 286)&idexs(265 downto 261); --the write address is "global_prediction_out&pc_output(4 downto 0)" in IDEX stage.-
		  --this is the register file where the branch prediction-counters are stored. The input signals are assigned here above the port map of the register.
        --need to ensure that the entry to be updated is on the same address as where the branching is done.
        BRANCH_PREDICTION_BUFFER: predictorbuffer
       generic map (N =>2, M=>128, K=>6)
    port map(
            CLK            	=>clk,              
            RESET          	=>reset,--not currently used
            RW              	=>buffer_write,
            Read_address		=>prediction_readaddress, --we shift pc_output one to the left(earlier when inputed to pipeline registers) in order to use all the addresses
            Write_address		=>prediction_writeaddress,
            WRITE_DATA  		=>state_writeback,
            Data_out        	=>stateread--outputs 1 branchpredictor/prediction
    );


			--shift register used for the global branch information for the corrolating branch predictor
        global_prediction: shift_register 
   Port map( 
			  data_in 		=>branched1,--inputs the resolved branch condition (taken or not taken)
           data_out 		=>global_prediction_out,--2 bits index showing the result from last 2 branches
           clock 			=>clk,
           reset			=>reset,--not currently used
           write_enable	=>buffer_write
			  );
    
	 --Forwarding mux1. Forwards values on "RS data"-path
    ForwardmuxA: quadputmux
    Port map( 
			  A 			=>IDEXs(105 downto 74),--read_data1
           B 			=>EXMEMs(68 downto 37),--aluresult
           C 			=>ChosenWriteData,
			  D			=>wb2s(31 downto 0),
           R 			=>ForwardAout,
           control 	=>ctForwardA --signal from forwarding unit
			  );
			  


    --Forwarding mux2. Forwards values on "RT data"-path          
    ForwardmuxB: quadputmux 
    Port map( 
			  A 			=>IDEXs(73 downto 42),--Read_data2
           B 			=>EXMEMs(68 downto 37),--aluresult
           C 			=>ChosenWriteData,
			  D			=>wb2s(31 downto 0),
           R 			=>ForwardBout,
           control 	=>ctForwardB
			  );
			  
     --mux for chosing write register
    WRITEREG_MUX: simple_multiplexer generic map ( N=>5) 
	 port map(
           a 					=> IDEXs(9 downto 5),
           b		 			=> IDEXs(4 downto 0),
           control_signal 	=> IDEXs(150),--regdest,
           output 			=> ChosenWriteReg
			  );
              
     --mux for chosing alu input
    ALU_INPUT_MUX: simple_multiplexer 
	 port map( 
           a 					=> ForwardBout,
           b 					=> IDEXs(41 downto 10),
           control_signal 	=> IDEXs(148),--alusrc,
           output 			=> ChosenALUInput
			  );
			  
            --mux for chosing input from DMEM
            QuadputMux_control<=MEMWBs(70)&MEMWBs(71);
    Regdest_MUX: QuadputMux 
	 port map(   
              a 				=>MEMWBs(36 downto 5),--ALU_Result,
				  b 				=>MEMWBs(68 downto 37),--dmem_data_in, 
              c 				=>LO_out,--output from LO register
              d				=>HI_out,--output from HI register
				  control 		=>QuadputMux_control,--memtoreg and memtoreg2,
				  R 				=>ChosenWriteData
				  );

    -- First multiplexor. It is used to choose between regular incremented PC value or PC value based on branching
    Branch_MUX: simple_multiplexer 
	 port map( 
				a 					=> mux2out,
				b 					=> BranchAdder,
				control_signal => branch_ok,
				output 			=> branchcalc
				);
			
			--concating prediction_address and incremented. This might give wrong target address in some situations(for instance because of signed bits), 
			--but this is handled in the branchprediction unit.
        branch_taken_address<=incremented(31 downto 16)&prediction_address;
        --outputs pc counter if branch is taken and revert back to the old address if not taken
    BranchTAKEN_MUX: simple_multiplexer 
	 port map( 
        a 					=>incremented,--incremented pcaddress
        b 					=> branch_taken_address,--the predicted branch destination
		  control_signal 	=>branch_Taken,--from predictionunit
        output 			=>mux1out
    );
    --output the result address from branchprediction
    REVERT_PREDICTION_MUX:  
	 simple_multiplexer 
	 port map( 
      a 					=>mux1out,
      b 					=> idexs(137 downto 106),--incremented address
      control_signal =>revert,
      output 			=>mux2out
    );
    --jumpmux
    JUMP_MUX: simple_multiplexer 
	 port map( 
        a 					=>branchcalc,
		  b 					=> Concat,
		  control_signal 	=>chosen_OP(0),
        output 			=>FinalPCAddress
    );
    --mux that enables or disables output from controlunit
    CONTROL_OUTPUT: simple_multiplexer generic map ( N=>10) 
	 port map( 
		  a 					=>"0000000000",
		  b 					=> OPs,
		  control_signal 	=>control_enable,
		  output 			=>chosen_OP
    );
end Behavioral;
