----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:25:44 10/24/2013 
-- Design Name: 
-- Module Name:    Hazarddetection - Behavioral 
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

--this module is responcible to avoid hazards where a register is read before the loadinstruction is completed(when the 2 instructions also use the same registers).
--for simplicity we also "turn on" the processor in this module, when the processor_enable signal in the control module is set.

entity Hazarddetection is
    Port ( IDEXCONTROL : in  STD_LOGIC_VECTOR(9 downto 0);
           IDEXregisterRT : in  STD_LOGIC_VECTOR(4 downto 0);
			  IFIDregisterRS : in  STD_LOGIC_VECTOR(4 downto 0);
			  IFIDregisterRT : in  STD_LOGIC_VECTOR(4 downto 0);
			  IFIDInstructionType: in  STD_LOGIC_VECTOR (5 downto 0);
           PCWrite : out  STD_LOGIC;
			  IFIDwrite: out STD_LOGIC;
			  processor_enable: in std_logic;
           Controlenable : out  STD_LOGIC

			  );
end Hazarddetection;



architecture Behavioral of Hazarddetection is


begin
	

process(processor_enable,IDEXCONTROL,IDEXregisterRT,IFIDregisterRS,IFIDregisterRT,IFIDInstructionType)
constant LW  : std_logic_vector(9 downto 0 ) := "0000011100";
constant load  : std_logic_vector(5 downto 0 ) := "100011";
begin


        if(processor_enable='1') then  
				
				if(IDEXCONTROL=LW and (IDEXregisterRT = IFIDregisterRS or IDEXregisterRT=IFIDregisterRT) AND NOT (IFIDInstructionType=LOAD)) then
				pcWrite<='0';
				ifidwrite<='0';
				Controlenable<='0';
				else
				pcWrite<='1';
				ifidwrite<='1';
				Controlenable<='1';
				end if;
				else
				PCWrite<='0';
				Controlenable<='0';
				ifidwrite<='1';
				
				end if;
end process;


end Behavioral;

