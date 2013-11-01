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
                R_LO                        : out STD_LOGIC_VECTOR(N-1 downto 0);
					 R_HI								: out std_logic_vector(N-1 downto 0);
                vliw_aluOP                : in std_logic
        );
end Vliw_alu;

architecture Behavioral of Vliw_alu is

	signal result: std_logic_vector(63 downto 0);
	 --variable count : Integer:=0;
	 			--function  divide  (a : UNSIGNED; b : UNSIGNED) return UNSIGNED is



begin

process(vliw_aluOP,X,Y)
variable a1 : std_logic_vector(x'length-1 downto 0):=X;
variable b1 : std_logic_vector(y'length-1 downto 0):=Y;
variable p1 : std_logic_vector(y'length-1 downto 0):= (others => '0');
variable i : integer:=0;
begin

		--	if(vliw_aluOP='0') then
			result<=X*Y;
		--	p1:="0000000000000000000000000000000000000000000000000000000000000000";
		--	a1:="0000000000000000000000000000000000000000000000000000000000000000";
		--	b1:="0000000000000000000000000000000000000000000000000000000000000000";
		--	else
--the idea for this algorithm (division) is from http://vhdlguru.blogspot.no/2010/03/vhdl-function-for-division-two-signed.html. I had made an own algorithm, but it made the clockspeed way too slow 			
--In other words we used this in order to get the processor run at a decent speed
--for i in 0 to (y'length-1) loop
--p1 := p1-b1;
--p1(b'length-1 downto 1) := p1(b'length-2 downto 0);
--p1(0) := a1(a'length-1);
--a1(x'length-1 downto 1) := a1(x'length-2 downto 0);

--if(p1<0) then
--a1(0) :='0';
--p1 := p1+b1;
--else
--a1(0) :='1';
--end if;
--b1(y'length-2 downto 0):=b1(y'length-1 downto 1);
--b1(y'length-1):='0';
--end loop;
--result<="00000000000000000000000000000000"&a1;
--end if;
end process;

			R_LO<=result(31 downto 0);
			R_HI<=result(63 downto 32);
end Behavioral;

