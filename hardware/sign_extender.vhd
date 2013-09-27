----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:31:41 09/28/2013 
-- Design Name: 
-- Module Name:    sign_extender - Behavioral 
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

entity sign_extender is
   generic (IN_WIDTH: NATURAL := 16;
               OUT_WIDTH: NATURAL := 32);
    Port ( input : in  STD_LOGIC_VECTOR ( IN_WIDTH-1 downto 0);
           output : out  STD_LOGIC_VECTOR (OUT_WIDTH-1 downto 0));
end sign_extender;

architecture Behavioral of sign_extender is
  
begin
   output(IN_WIDTH-1 downto 0) <= input(IN_WIDTH-1 downto 0);
   output(OUT_WIDTH-1 downto IN_WIDTH) <= ( others => input(IN_WIDTH-1));


end Behavioral;

