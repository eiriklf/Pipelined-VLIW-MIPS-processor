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

--this is a currently simple controlunit who controls access to multiplier unit by either enabling or disabling input to the LO and HI registers 
-- This can in the future also be expanded to using controlsignals to control the "VLIW_alu" unit
entity Vliw_multipliercontrol is
    Port ( IFID_funct : in  STD_LOGIC_VECTOR (5 downto 0);
           LOHI_write : out  STD_LOGIC
           );
end Vliw_multipliercontrol;

architecture Behavioral of Vliw_multipliercontrol is
constant multiply  : std_logic_vector(5 downto 0 ) := "011000";

begin

process(IFID_funct)
begin

if(IFID_funct=multiply) then
LOHI_write<='1';
else
LOHI_write<='0';
end if;

end process;
end Behavioral;

