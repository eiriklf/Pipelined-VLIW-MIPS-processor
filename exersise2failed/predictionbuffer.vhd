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
	port(
			CLK 			:	in	STD_LOGIC;				
			RESET			:	in	STD_LOGIC;				
			RW				:	in	STD_LOGIC;				
			RS_ADDR 		:	in	STD_LOGIC_VECTOR (10 downto 0); 
			RD_ADDR 		:	in	STD_LOGIC_VECTOR (10 downto 0);
			WRITE_DATA	:	in	STD_LOGIC_VECTOR (1 downto 0); 
			RS				:	out	STD_LOGIC_VECTOR (1 downto 0)
	);

end predictorbuffer;

architecture Behavioral of predictorbuffer is

	constant NUM_REG : integer := 32;
	type REGS_T is array (NUM_REG-1 downto 0) of STD_LOGIC_VECTOR(1 downto 0);
	
	signal REGS : REGS_T := (others => (others =>'0'));

begin

	REGISTERS: process(CLK, RESET)
	begin
    -- CF: The reset-functionality commented out to save space (detected as RAM)
    -- and for additional speed (~44 -> ~50 MHz)
    -- If reset-functionality turns out to be needed,
    -- it can be commented back in.
    --if  RESET='1' then
		--		for i in 0 to NUM_REG-1 loop
		--			REGS(i) <= (others => '0');
		--		end loop;
		if rising_edge(CLK) then
			if  RW='1' then
				REGS(to_integer(unsigned(RD_ADDR)))<=WRITE_DATA;
			end if;
				RS <= REGS(to_integer(unsigned(RS_ADDR)));
		end if;
	end process  REGISTERS;



end Behavioral;

