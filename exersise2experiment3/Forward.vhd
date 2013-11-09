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

--this unit is responcible for forwarding data to avoid hazards. It works currently on all instructions exept multiply, MFLO and MFHI.
--The reason for this is that we look on the multiplier function as an optional addition to our instructionset. In order to avoid increasing the circut complexity,
--we leave the full hazard responcibillity for these 3 instructions to the compiler. According to the book, it varies on how vliw implementations takes 
--responcibillites for hazards. We also did not have the time to implement forwarding or stalling for the multiply circuts.


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

	Process1: process(MEMWBregwrite,  EXMEMregwrite, RS, MEMWbregisterRD, ExmemregisterRD)
	begin
		if( (EXMEMregwrite='1' )and (not (ExmemregisterRD="00000")) and (EXMEMregisterRD= RS) ) then
			forwardA<="10";
		elsif((MEMWBregwrite='1') and not(MEMWBregisterRD="00000") and not((EXMEMregwrite='1') 
			and not(EXMEMregisterRD="00000")) and (MEMWBregisterRD=RS) ) then --and not (EXMEMregisterRD=RS))
			forwardA<="01";
		else
			forwardA<="00";
	end if;
	 
	
	
	end process;
	
	Process2: process(MEMWBregwrite,  EXMEMregwrite,RT, MEMWbregisterRD, ExmemregisterRD)
	begin
		if( (EXMEMregwrite='1')and (not (ExmemregisterRD="00000")) and (EXMEMregisterRD= RT)) then
			forwardB<="10";
		elsif((MEMWBregwrite='1') and not(MEMWBregisterRD="00000") and not((EXMEMregwrite='1') 
			and not(EXMEMregisterRD="00000"))  and (MEMWBregisterRD=RT) ) then --and not (EXMEMregisterRD=RT))
			forwardB<="01";
		else
			forwardB<="00";
	end if;
	
	
	
	end process;

end Behavioral;

