----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:48:59 10/16/2013 
-- Design Name: 
-- Module Name:    Forwarding - Behavioral 
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

entity Forwarding is
    Port ( ExmemregisterRD : in  STD_LOGIC_VECTOR (4 downto 0);
           MEMWbregisterRD : in  STD_LOGIC_VECTOR (4 downto 0);
			  MEMWBregwrite: in std_logic;
			  EXMEMregwrite: in std_logic;
           RS : in  STD_LOGIC_VECTOR (4 downto 0);
           RT : in  STD_LOGIC_VECTOR (4 downto 0);
           forwardA : out  STD_LOGIC_VECTOR (1 downto 0);
           forwardB  : out  STD_LOGIC_VECTOR (1 downto 0));
end Forwarding;

architecture Behavioral of Forwarding is

begin

	process(MEMWBregwrite,  EXMEMregwrite, RS,RT, MEMWbregisterRD, ExmemregisterRD)
	begin
	--EX hazard
	if( (EXMEMregwrite='1')and (not (ExmemregisterRD="00000"))) then
	if(EXMEMregisterRD= RS) then
	forwardA<="10";
	end if;
	if(EXMEMregisterRD= RT)then
	forwardB<="10";
	end if;
	elsif((MEMWBregwrite='1') and not(MEMWBregisterRD="00000") and not((EXMEMregwrite='1') and not(EXMEMregisterRD="00000"))) then --and not (EXMEMregisterRD=RS))
	if(not (EXMEMregisterRD=RS) and (MEMWBregisterRD=RS)) then
	forwardA<="01";
	elsif(not (EXMEMregisterRD=RS) and (MEMWBregisterRD=RS))then
	forwardB<="01";
	end if;
	else
	forwardA<="00";
	forwardB<="00";
	end if;
	
	
	
	end process;

end Behavioral;

