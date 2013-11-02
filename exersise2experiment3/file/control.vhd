library IEEE;
use WORK.MIPS_CONSTANT_PKG.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity control is

    Port ( control_input : in  STD_LOGIC_VECTOR (5 downto 0);
           Ops : out STD_LOGIC_VECTOR (9 downto 0);
              clk: in std_logic;
              reset: in std_logic
              );
end control;

architecture Behavioral of control is

    signal state : std_logic_vector(1 downto 0);
    
    -- Output signals from the control unit:

    signal jump : std_logic;
    signal memwrite : std_logic;
    signal regwrite : std_logic;
   -- signal memtoreg : std_logic;
    signal alusrc : std_logic;
    signal branch : std_logic_vector(1 downto 0);
    signal regdest : std_logic;
    
    signal ALUOp0 : std_logic;
    signal ALUOp1 : std_logic;
    
    -- Constants for known inputs to the control unit:
    constant R_TYPE  : std_logic_vector(5 downto 0 ) := "000000";
    constant LW  : std_logic_vector(5 downto 0 ) := "100011";
    constant SW  : std_logic_vector(5 downto 0 ) := "101011";
    constant LUI  : std_logic_vector(5 downto 0 ) := "001111";
    constant BEQ  : std_logic_vector(5 downto 0 ) := "000100";
	 constant BNE  : std_logic_vector(5 downto 0 ) := "000101";
    constant JMP  : std_logic_vector(5 downto 0 ) := "000010";
    

begin
    --dont really need control_input on sensitivity list in order to make this function
    asserting_output_signals : process(control_input)
    begin

        -- At certain points, don't cares are forced in order to prevent the synthesizer to generate latches.
        -- this can also be done combinatorial instead of using behavioural descriptions
            -- Instruction: R-type
            if(control_input=R_TYPE)then
                jump<='0';
                memwrite<='0';
                regwrite<='1';
              --  memtoreg<='0';
                alusrc<='0';
                branch<="00";
                regdest<='1';
                ALUOp1 <= '1';
                ALUOp0 <= '0';
                
            -- Instruction: Jump    
            elsif(control_input=JMP) then
                jump<='1';
                memwrite<='0';
                regwrite<='0';
                alusrc<='-'; -- Don't care
                branch<="00";
                regdest<='-'; -- Don't care
              --  memtoreg<='-'; -- Don't care
                ALUOp0 <= '0';
                ALUOp1 <= '0';
                
            -- Instruction: Load Upper Immediate    
            elsif(control_input=LUI)then
                jump<='0';
                memwrite<='0';
                regwrite<='1';
            --    memtoreg<='0';
                alusrc<='1';
                branch<="00";
                regdest<='0';
                ALUOp0 <= '1';
                ALUOp1 <= '1';
                
            -- Instruction: Branch On Equal 
            elsif(control_input=BEQ)then
                jump<='0';
                memwrite<='0';
                regwrite<='0';
                alusrc<='0';
                branch<="10";
                regdest<='-'; -- Don't care
            --    memtoreg<='-'; -- Don't care
                ALUOp1 <= '0';              
                ALUOp0 <= '1';
					 
				elsif(control_input=BNE)then
                jump<='0';
                memwrite<='0';
                regwrite<='0';
                alusrc<='0';
                branch<="01";
                regdest<='-'; -- Don't care
            --    memtoreg<='-'; -- Don't care
                ALUOp1 <= '0';              
                ALUOp0 <= '1';
                
            -- Instruction: Store Word  
            elsif(control_input=SW) then
                jump<='0';
                memwrite<='1';
                regwrite<='0';
                alusrc<='1';
                branch<="00";
                regdest<='-'; -- Don't care
             --   memtoreg<='-'; -- Don't care
                ALUOp0 <= '0';
                ALUOp1 <= '0';
                
            -- Instruction: Load Word   
            elsif(control_input=LW) then
                jump<='0';
                memwrite<='0';
                regwrite<='1';
               -- memtoreg<='1';
                alusrc<='1';
                branch<="00";
                regdest<='0';
                ALUOp0 <= '0';
                ALUOp1 <= '0';
            
            -- Not implemented instruction
            else
                jump<='0';
                memwrite<='0';
                alusrc<='-'; -- Don't care
                regwrite<='0';
                branch<="00";
                regdest<='-'; -- Don't care
               -- memtoreg<='-'; -- Don't care
                ALUOp0 <= '0';
                ALUOp1 <= '0';
            end if;

    end process;

    -- Mapping output signals to 9-bit bus called "Ops"
    Ops(0) <= jump;
    Ops(1) <= memwrite;
    Ops(2) <= regwrite;
    --Ops(3) <= memtoreg;
    Ops(4) <= alusrc;
    Ops(5) <= branch(1);
    Ops(6) <= regdest;
    Ops(7) <= ALUOp0;
    Ops(8) <= ALUOp1;
	 Ops(9) <= branch(0);
    --only really need clk and reset in this sensitivity list

end Behavioral;

