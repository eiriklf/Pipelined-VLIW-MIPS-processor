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



--this is the global register who keeps track of the most recent branches. There is currently one weakness with this implementation, as mentioned in the report.
--The weakness is that there is a pipeline latency of 3 cycles from the point where the instruction is issued, to the point where the register actually is updated.
--If any branches occurs in the meanwhile, this predictionscheme may not corrolate earlier branches correctly. 

--This module gets updated with 1 bits input, when write_enable/bufferwrite=1. The register then shifts 1 left, while the input is inserted in the least significant bit.

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

