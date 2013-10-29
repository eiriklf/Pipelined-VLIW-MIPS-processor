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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Hazarddetection is
    Port ( IDEXCONTROL : in  STD_LOGIC_VECTOR(8 downto 0);
           IDEXregisterRT : in  STD_LOGIC_VECTOR(31 downto 0);
           InstructionType : in  STD_LOGIC_VECTOR (5 downto 0);
			  IFIDInstructionType: in  STD_LOGIC_VECTOR (5 downto 0);
           PCWrite : out  STD_LOGIC;
			  IFIDwrite: out STD_LOGIC;
			  IFIDreset: out STD_LOGIC;--syncronous reset for god's sake
			  processor_enable: in std_logic;
           Controlenable : out  STD_LOGIC;
			  State: out std_logic_vector(1 downto 0);
			  State_in: in std_logic_vector(1 downto 0);
			  buffer_write: out std_logic;
			  branch_ok:out std_logic;
			  branch_taken: in std_logic);
end Hazarddetection;

architecture Behavioral of Hazarddetection is
constant BEQ  : std_logic_vector(5 downto 0 ) := "000100";
begin
process(processor_enable,instructiontype,branch_taken,IFIDInstructionType)
begin
        if(processor_enable='1') then 
            PCWrite<='1';
				Controlenable<='1';
				IFIDwrite<='1'; --move!
				if(instructiontype=BEQ) then
				branch_ok<='1';
				buffer_write<='1';
				--insert behaviour of branch_ok for the states here
				else
				branch_ok<='0';
				buffer_write<='0';
				end if;
				if(branch_taken='0' and IFIDInstructionType=BEQ ) then
				IFIDreset<='1';
				else
				IFIDreset<='0';
			   end if;
				else
				IFIDwrite<='0';
				buffer_write<='0';
				branch_ok<='0';
				IFIDreset<='0';
				PCWrite<='0';
				Controlenable<='0';
				end if;
				end process;
				
				
STATEMACHINE: process(instructiontype,State_in)
constant taken0: std_logic_vector(1 downto 0):="00";
constant taken1: std_logic_vector(1 downto 0):="01";
constant nottaken0: std_logic_vector(1 downto 0):="10";
constant nottaken1: std_logic_vector(1 downto 0):="11";
begin
				
				case State_in is
					when taken0 =>
					if(instructiontype=BEQ) then
					state<=taken0;
					else
					state<=taken1;
					end if;
					
					when taken1 =>
					if(instructiontype=BEQ) then
					state<=taken0;
					else
					state<=nottaken0;
					end if;
					when nottaken0 =>
					if(instructiontype=BEQ) then
					state<=taken1;
					else
					state<=nottaken1;		
					end if;
					when nottaken1 =>
					if(instructiontype=BEQ) then
					state<=nottaken0;
					else
					state<=nottaken1;
					end if;
					when others=>
					state<="00";
			 end case;
end process;
end Behavioral;

