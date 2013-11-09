----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:37:09 05/03/2012 
-- Design Name: 
-- Module Name:    memory - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

--This is the instruction memory, we changed the memory type from single port access to dual port in order to make it work properly with the VLIW architecture
--The datamemory is not changed 

entity memory is
	generic (N :NATURAL; M :NATURAL);
	port(
		CLK			: in STD_LOGIC;
		RESET			:	in  STD_LOGIC;	
		W_ADDR		:	in  STD_LOGIC_VECTOR (31 downto 0);	-- Address to write data
		WRITE_DATA	:	in  STD_LOGIC_VECTOR (N-1 downto 0);	-- Data to be written
		MemWrite		:	in  STD_LOGIC;									-- Write Signal
		ADDR			:	in  STD_LOGIC_VECTOR (31 downto 0);	-- Address to access data
		ADDR2			:	in  STD_LOGIC_VECTOR (31 downto 0);	-- Address after incremented by pc counter
		READ_DATA	:	out STD_LOGIC_VECTOR (N-1 downto 0);		-- Data read from memory
		READ_DATA2	:	out STD_LOGIC_VECTOR (N-1 downto 0)		-- for secound part of vliw instruction
	);
end memory;

architecture Behavioral of memory is

	constant MEM_SIZE : integer := 2 ** M;
	type MEM_T is array (MEM_SIZE-1 downto 0) of STD_LOGIC_VECTOR (N-1 downto 0);
	
	signal MEM : MEM_T := (others => (others => '0'));
	signal address_reg :	STD_LOGIC_VECTOR (31 downto 0);	-- Address to access data
	signal address_reg2 :	STD_LOGIC_VECTOR (31 downto 0);	-- Address to access data for vliw instruction
begin

	MEM_PROC: process(CLK, RESET, MemWrite, WRITE_DATA, ADDR, W_ADDR, MEM, address_reg,address_reg2,ADDR2)
	begin	
		if falling_edge (CLK) then
      -- RAMs don't have resets. Commented out to make it work as RAM and not 256 32bit-flipflops (which takes up too much space for the FPGA).
			--if (RESET = '1') then 
			--	for i in 0 to M-1 loop
			--		MEM(i) <= (others => '0');
			--	end loop;
			--elsif MemWrite='1' then
      if MemWrite='1' then
				MEM(to_integer(unsigned( W_ADDR((M-1) downto 0) ))) <= WRITE_DATA;
			end if;
			address_reg <= ADDR;
			address_reg2 <= ADDR2;
		end if;

		READ_DATA <= MEM(to_integer(unsigned( address_reg ((M-1) downto 0) )));
		READ_DATA2<= MEM(to_integer(unsigned( address_reg2 ((M-1) downto 0) )));
	end process MEM_PROC;

end Behavioral;

