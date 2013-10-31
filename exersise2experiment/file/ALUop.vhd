-- This is the ALUOp component, which sets the operation for the ALU,
-- based on the two ALUOp signals from the control unit, and on the
-- 6 least significant bits (known as funct field) from R-Type instructions.
-- The 2 most significant bits from the funct field is not used for any of the implemented
-- MIPS instructions, and therefore the current implementation only use funct fields on 4 bits.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--remove branch operation
entity ALUoperation is
    Port ( ALUOp0 : in  STD_LOGIC;
           ALUOp1 : in  STD_LOGIC;
           funct : in  STD_LOGIC_VECTOR (5 downto 0);
           operation : out  STD_LOGIC_VECTOR (4 downto 0);
			  chosenwritedata2: out std_logic;
			  regdest: out std_logic
			  );
end ALUoperation;

architecture Behavioral of ALUoperation is

begin
    aluoperations: process(aluop0,aluop1,funct) 
    begin

        -- checking the other instructions before the R-type can give only the funct field as "sensitive" input to the R type checks.
        -- LW, SW or R-Type: Add
        if((aluop1 = '0' and aluop0 = '0') ) then
            operation <= "00010";
 				 chosenwritedata2<='0';   
 				 regdest<='0';
        -- LUI
        elsif(aluop1 = '1' and aluop0 = '1') --we need to do it this way. It make sense since we cant use a funct field for this operation
        then
            operation <= "01000";
 				 chosenwritedata2<='0'; 
				regdest<='1';
        -- BEQ or R-Type: Subract
        -- Notice that aluop0 and aluop1 have switched places
        elsif((aluop0 = '1' and aluop1 = '0') or (aluop1 = '1' and funct = "100010")) then
            operation <= "00110";
				chosenwritedata2<='0';
				regdest<='1';
        -- R-Type: AND
        --we dont need to check if aluop0='0' or if aluop1='1' down from here (only funct field). ALUOP= "00", "01" and "11" are checked in previous sentences
        --however, removing the checks might not trigger the "else" operation if the ALUOP signal are expanded and this can make it harder to debug eventual mistakes in the ALU or controlunit.
        elsif(aluop1 = '1' and aluop0 = '0' and funct = "100100") then
            operation <= "00000";
				 chosenwritedata2<='0';
				 regdest<='1';
        -- R-Type: OR
        elsif(aluop1 = '1' and aluop0 = '0' and funct = "100101") then
            operation <= "00001";
				 chosenwritedata2<='0';
				 regdest<='1';
				 --add
	 elsif(aluop1 = '1' and aluop0 = '0' and funct = "100000") then
            operation <= "00010";
				 chosenwritedata2<='0';
				 regdest<='1';
				 
        -- R-Type: SLT
        elsif(aluop1 = '1' and aluop0 = '0' and funct = "101010") then
            operation<="00111";
            chosenwritedata2<='0';
            regdest<='1';
			elsif(aluop1 = '1' and aluop0 = '0' and funct = "010000") then
           chosenwritedata2<='1';
           regdest<='1';
            operation<="00000";			  
			elsif(aluop1 = '1' and aluop0 = '0' and funct = "010010") then
           chosenwritedata2<='1';
           regdest<='1';
            operation<="00000";				
       -- elsif(aluop1 = '1' and aluop0 = '0' and funct = "011000") then
			--	operation<="10000";
        -- No output signals in current implementation if none of the previous conditions are met
        else
        regdest<='-';
        chosenwritedata2<='-';
            operation<="00000";
        end if;
    end process;

end Behavioral;

