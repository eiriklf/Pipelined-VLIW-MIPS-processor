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

entity register_file is
	port(
			CLK 			:	in	STD_LOGIC;				
			RESET			:	in	STD_LOGIC;				
			RW				:	in	STD_LOGIC;				
			RS_ADDR 		:	in	STD_LOGIC_VECTOR (RADDR_BUS-1 downto 0); 
			RT_ADDR 		:	in	STD_LOGIC_VECTOR (RADDR_BUS-1 downto 0); 
			RD_ADDR 		:	in	STD_LOGIC_VECTOR (RADDR_BUS-1 downto 0);
			WRITE_DATA	:	in	STD_LOGIC_VECTOR (31 downto 0); 
			RS				:	out	STD_LOGIC_VECTOR (31 downto 0);
			RT				:	out	STD_LOGIC_VECTOR (31 downto 0);
			RS_ADDR2 		:	in	STD_LOGIC_VECTOR (RADDR_BUS-1 downto 0); 
			RT_ADDR2		:	in	STD_LOGIC_VECTOR (RADDR_BUS-1 downto 0); 
			RS2			:	out	STD_LOGIC_VECTOR (31 downto 0);
			RT2				:	out	STD_LOGIC_VECTOR (31 downto 0)
	);

end register_file;

architecture Behavioral of register_file is

	constant NUM_REG : integer := 2 ** RADDR_BUS;
	type REGS_T is array (NUM_REG-1 downto 0) of STD_LOGIC_VECTOR(32-1 downto 0);
	
	signal REGS : REGS_T := (others => (others =>'0'));

begin

	REGISTERS: process(CLK, RESET)
	begin
--the register updates itself on falling edge to avoid RAW hazards while data is being written. see the report
		if falling_edge(CLK) then
			if  RW='1' then
				REGS(to_integer(unsigned(RD_ADDR)))<=WRITE_DATA;
				end if;
		end if;
	end process  REGISTERS;

	RS <= (others=>'0') when RS_ADDR="00000"
         else REGS(to_integer(unsigned(RS_ADDR)));
			
	RT <= (others=>'0') when RT_ADDR="00000"
         else REGS(to_integer(unsigned(RT_ADDR)));
			
	RS2 <= (others=>'0') when RS_ADDR2="00000"
         else REGS(to_integer(unsigned(RS_ADDR2)));
			
	RT2 <= (others=>'0') when RT_ADDR2="00000"
         else REGS(to_integer(unsigned(RT_ADDR2)));
			
--	RS2 <= (others=>'0') when RS_ADDR2="00000"
   --      else REGS(to_integer(unsigned(RS_ADDR2)));
			
	--RT2 <= (others=>'0') when RT_ADDR2="00000"
  --       else REGS(to_integer(unsigned(RT_ADDR2)));

end Behavioral;

