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

--This is the multiplier unit. We believe that as it is now, it may be the most critical delay path in our implementation.
--The delay may be reduced by adding latency to the multiply operation. However we have not done that because we did not have time for it,
--and because we also believe that the forwarding unit also might be a bottleneck that limits the clock frequency to a value close to this.
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

