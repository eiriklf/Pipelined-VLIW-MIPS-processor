----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:58:43 09/28/2013 
-- Design Name: 
-- Module Name:    ALUop - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALUoperation is
    Port ( aluop0 : in  STD_LOGIC;
           aluop1 : in  STD_LOGIC;
           funct : in  STD_LOGIC_VECTOR (3 downto 0);
           operation : out  STD_LOGIC_VECTOR (3 downto 0));
end ALUoperation;

architecture Behavioral of ALUoperation is

begin
aluoperations: process(aluop0,aluop1,funct) 
begin
if((aluop1='0' and aluop0='0') or (aluop0='0' and funct="0000"))
then
operation<="0010";
elsif(aluop1='1' and aluop0='1')--we dont know if this is actually right, but it make sense since we cant use a funct field for this operation
then
operation<="1000";
elsif((aluop0='1' and aluop1='0')or(aluop1='1' and funct="0010"))
then
operation<="0110";
elsif(aluop1='1' and aluop0='0' and funct="0100")
then
operation<="0000";
elsif(aluop1='1' and aluop0='0' and funct="0101")
then
operation<="0001";
elsif(aluop1='0' and funct="1010")
then
operation<="0111";
else
operation<="1111";
end if;
end process;

end Behavioral;

