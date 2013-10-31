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
                R                        : out STD_LOGIC_VECTOR(N-1 downto 0);
                vliw_aluOP                : in std_logic
        );
end Vliw_alu;

architecture Behavioral of Vliw_alu is
	signal a: std_logic_vector(63 downto 0);
	signal b: std_logic_vector(63 downto 0);
	signal result: std_logic_vector(63 downto 0);
	signal remainder : std_logic_vector(63 downto 0);
	 --variable count : Integer:=0;
	 			--function  divide  (a : UNSIGNED; b : UNSIGNED) return UNSIGNED is



begin

process(vliw_aluOP,X,Y,remainder,a,b)
variable a1 : std_logic_vector(a'length-1 downto 0):=a;
variable b1 : std_logic_vector(b'length-1 downto 0):=b;
variable p1 : std_logic_vector(b'length downto 0):= (others => '0');
variable i : integer:=0;
begin

			if(vliw_aluOP='0') then
			result<=X*Y;
			p1:="00000000000000000000000000000000000000000000000000000000000000000";
			a1:="0000000000000000000000000000000000000000000000000000000000000000";
			else
--the idea for this algorithm is from http://vhdlguru.blogspot.no/2010/03/vhdl-function-for-division-two-signed.html. 			
for i in 0 to b'length-1 loop
p1(b'length-1 downto 1) := p1(b'length-2 downto 0);
p1(0) := a1(a'length-1);
a1(a'length-1 downto 1) := a1(a'length-2 downto 0);
p1 := p1-b1;
if(p1(b'length-1) ='1') then
a1(0) :='0';
p1 := p1+b1;
else
a1(0) :='1';
end if;
end loop;
result<=a1;

			--quotient<=X&"00000000000000000000000000000000";
			--divisor<=Y&"00000000000000000000000000000000";
			--for I in 1 to 32 loop
			--remainder<=(remainder -quotient);
			--if(remainder<0) then
			--remainder<=(remainder + quotient);
			--quotient<=quotient(62 downto 0)&'0';
			--else
			--quotient<=quotient(62 downto 0)&'0';
			--end if;
			--divisor<= '0'&divisor(63 downto 1);
			
		--	result<=remainder;
			--			end loop;
			


			end if;
end process;

			R<=result(31 downto 0);
end Behavioral;

