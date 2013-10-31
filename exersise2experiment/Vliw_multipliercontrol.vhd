----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:55:11 10/30/2013 
-- Design Name: 
-- Module Name:    Vliw_multipliercontrol - Behavioral 
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

entity Vliw_multipliercontrol is
    Port ( IFID_funct : in  STD_LOGIC_VECTOR (5 downto 0);
           LO_write : out  STD_LOGIC;
           Vliw_aluOP: out std_logic
           );
end Vliw_multipliercontrol;

architecture Behavioral of Vliw_multipliercontrol is
  constant multiply  : std_logic_vector(5 downto 0 ) := "011000";
  constant divide  : std_logic_vector(5 downto 0 ) := "011010";

begin
process(IFID_funct)
begin

if(IFID_funct=multiply) then
LO_write<='1';
Vliw_aluOP<='0';
elsif(IFID_funct=divide) then
LO_write<='1';
Vliw_aluOP<='1';
else
LO_write<='0';
Vliw_aluOP<='-';

end if;
end process;
end Behavioral;

