----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:43:23 05/03/2012 
-- Design Name: 
-- Module Name:    register_file - Behavioral 
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

library WORK;
use WORK.MIPS_CONSTANT_PKG.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity predictorbuffer is
    generic (N :NATURAL; M:NATURAL; K:NATURAL);
	port(
			CLK 			:	in	STD_LOGIC;				
			RESET			:	in	STD_LOGIC;				
			RW				:	in	STD_LOGIC;				
			Read_address:	in	STD_LOGIC_VECTOR (K downto 0); 
			Write_address:	in	STD_LOGIC_VECTOR (K downto 0);
			WRITE_DATA	:	in	STD_LOGIC_VECTOR (N-1 downto 0); 
			Data_out		:	out STD_LOGIC_VECTOR (N-1 downto 0)
	);
end predictorbuffer;

architecture Behavioral of predictorbuffer is


	--constant NUM_REG : integer := M;--32
	type REGS_T is array (M-1 downto 0) of STD_LOGIC_VECTOR(N-1 downto 0);
	
	signal REGS : REGS_T := (others => (others =>'0'));

begin

	REGISTERS: process(CLK, RESET)
	begin

		if rising_edge(CLK) then
			if  RW='1' then
				REGS(to_integer(unsigned(Write_address)))<=WRITE_DATA;
			end if;

		end if;
	end process  REGISTERS;
				Data_out <= REGS(to_integer(unsigned(Read_address)));

end Behavioral;

