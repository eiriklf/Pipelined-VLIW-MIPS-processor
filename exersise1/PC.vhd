----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:57:11 09/20/2013 
-- Design Name: 
-- Module Name:    PC - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PC is
    Port ( Data_in : in  STD_LOGIC_VECTOR (31 downto 0);
           data_out : out  STD_LOGIC_VECTOR (31 downto 0);--set to constant instead, 
           clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           write_enable : in  STD_LOGIC);
end PC;

architecture Behavioral of PC is
signal data: STD_LOGIC_VECTOR (31 downto 0);
constant resetstate   : std_logic_vector(0 to 31) := "00000000000000000000000000000000";

begin

 INCREMENTER : process(clock, reset,data)
 begin
 if(rising_edge(clock)) then
 if(reset='1') then
 data<=resetstate;
elsif(write_enable='1')then
data<=data_in;
 end if;
 end if;
 end process;
 
 data_out<=data;


end Behavioral;

