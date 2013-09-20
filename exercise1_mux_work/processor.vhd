----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:50:25 09/20/2013 
-- Design Name: 
-- Module Name:    processor - Behavioral 
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

entity processor is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           processor_enable : in  STD_LOGIC;
           imem_data_in : in  STD_LOGIC_VECTOR (31 downto 0);
           imem_address : out  STD_LOGIC_VECTOR (31 downto 0);
           dmem_data_in : in  STD_LOGIC_VECTOR (31 downto 0);
           dmem_address : out  STD_LOGIC_VECTOR (31 downto 0);
           dmem_address_wr : out  STD_LOGIC_VECTOR (31 downto 0);
           dmem_data_out : out  STD_LOGIC_VECTOR (31 downto 0);
           dmem_write_enable : out  STD_LOGIC);
end processor;

architecture Behavioral of processor is

begin


end Behavioral;

