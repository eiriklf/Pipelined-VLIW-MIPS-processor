----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:19:11 05/03/2012 
-- Design Name: 
-- Module Name:    full_adder - Behavioral 
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu_full_adder is
	port(
		X	: in	std_logic_vector(3 downto 0);
		Y	: in	std_logic_vector(3 downto 0);
		CIN	: in	std_logic;
		COUT	: out	STD_LOGIC_vector(3 downto 0);
		G: out std_logic;
		P: out std_logic;
		R : out	std_logic_vector(3 downto 0)
	);
end alu_full_adder;

architecture Behavioral of alu_full_adder is

signal G0,g1,g2,g3,P0,p1,p2,p3,C1,C2,C3, K : std_logic;

begin
	G0 <= X(0) and Y(0);
	G1 <= X(1) and Y(1);
	G2 <= X(2) and Y(2);
	G3 <= X(3) and Y(3);
				
	P0 <= X(0) or Y(0);
	p1<=X(1) or y(1);
	p2<=x(2) or y(2);
	p3<=x(3) or y(3);
	
	c1<=((cin and P0) or g0);
	c2<=(cin and p0 and p1) or (g0 and p1) or g1;
	c3<=(cin and p0 and p1 and p2) or (g0 and p1 and p2) or (g1 and p2) or g2;
	
	COUT(3) <=(cin and p0 and p1 and p2 and p3) or  (g0 and p1 and p2 and p3) or (g1 and p2 and p3) or (g2 and p3) or g3;
	cout(2 downto 0)<=c3&c2&c1;
	P<=p0 and p1 and p2 and p3;
	g<=(g0 and p1 and p2 and p3) or (g1 and p2 and p3) or (g2 and p3) or g3;
	R(0) <= x(0) xor y(0) xor CIN; 
	R(1)<=x(1) xor y(1) xor C1;
	r(2)<=x(2) xor y(2) xor C2;
	r(3)<=x(3) xor y(3) xor C3;
end Behavioral;

