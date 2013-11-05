----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:01:28 10/29/2013 
-- Design Name: 
-- Module Name:    Vliw_alu - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;


library WORK;
use WORK.MIPS_CONSTANT_PKG.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Vliw_alu is
	generic (N: NATURAL);
        port(
                X                        : in STD_LOGIC_VECTOR(N-1 downto 0);
                Y                        : in STD_LOGIC_VECTOR(N-1 downto 0);
                R_LO                     : out STD_LOGIC_VECTOR(N-1 downto 0);
                R_HI                     : out std_logic_vector(N-1 downto 0)
        );
end Vliw_alu;

architecture Behavioral of Vliw_alu is

signal result: std_logic_vector(63 downto 0);

begin

			result<=X*Y;
			R_LO<=result(31 downto 0);
			R_HI<=result(63 downto 32);
end Behavioral;

