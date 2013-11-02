----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:07:22 10/29/2013 
-- Design Name: 
-- Module Name:    shift_register - Behavioral 
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

--the idea for the code in this file(shift_register) is based on the following page "http://esd.cs.ucr.edu/labs/tutorial/". However it's adapted for this use so i dont consider it "copy-paste"

entity shift_register is
   Port ( data_in : in  STD_LOGIC;
           data_out : out  STD_LOGIC_VECTOR (1 downto 0);
           clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           write_enable : in  STD_LOGIC);--remove this if not needed
end shift_register;

architecture Behavioral of shift_register is
signal data: std_logic_vector(1 downto 0):="00";
begin
    process(clock, write_enable)
    begin

    if rising_edge(clock) then
        if write_enable = '1' then
        data <=data(0)&data_in;
        end if;
    end if;

    end process;

   data_out <=data;

end Behavioral;

