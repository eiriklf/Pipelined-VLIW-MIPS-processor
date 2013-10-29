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
			  IFIDInstructionType: in  STD_LOGIC_VECTOR (5 downto 0);
           PCWrite : out  STD_LOGIC;
			  IFIDwrite: out STD_LOGIC;
			  IFIDreset: out STD_LOGIC;--syncronous reset for god's sake
			  processor_enable: in std_logic;
           Controlenable : out  STD_LOGIC;
			  State: out std_logic_vector(1 downto 0);
			  State_in: in std_logic_vector(1 downto 0);
			  IFID_state_in: in std_logic_vector(1 downto 0);
			  buffer_write: out std_logic;
			 -- branch: in std_logic_vector(1 downto 0);
			  branch_ok:out std_logic;
			  revert:out std_logic;
			  IFIDbranch_taken: in std_logic;
			  branch_taken: out std_logic;
			  branched1: in std_logic;
			  --equalvals2: in std_logic_vector(31 downto 0);
			  predicted_address: in std_logic_vector(15 downto 0);
			  shift_register_write: out std_logic;
			  branch_address: in std_logic_vector(15 downto 0)
			  );
end Hazarddetection;



architecture Behavioral of Hazarddetection is
constant BEQ  : std_logic_vector(5 downto 0 ) := "000100";
constant BNE  : std_logic_vector(5 downto 0 ) := "000100";
constant taken0: std_logic_vector(1 downto 0):="11";
constant taken1: std_logic_vector(1 downto 0):="01";
constant nottaken1: std_logic_vector(1 downto 0):="00";--initialize to this
constant nottaken0: std_logic_vector(1 downto 0):="10";

begin
	

process(processor_enable,IFIDbranch_taken,state_in,branched1,branch_address,predicted_address,IFIDInstructionType)
begin
        if(processor_enable='1') then 
				Controlenable<='1';
				buffer_write<='1';
				
				
				if(state_in=taken0 or state_in=taken1) then
				--assume branch taken
				branch_taken<='1';
				--insert behaviour of branch_ok for the states here
				else
				branch_taken<='0';
				end if;
				--demorgans law
				
				if(IFIDbranch_taken='1' and branched1='0') then
				
				revert<='1';
				IFIDwrite<='-';
				PCWrite<='1';
				IFIDreset<='1';
				branch_ok<='0';--mishap, no branch
				shift_register_write<='1';--must decrease state
				
				elsif(IFIDbranch_taken='1' and not (branch_address=predicted_address) )then--revert if a new program has been loaded, or if the predicted address is a miss
				revert<='1';
				IFIDwrite<='-';
				PCWrite<='1';
				IFIDreset<='1';
				branch_ok<='0';--mishap, no branch
				shift_register_write<='1';
				
				elsif(IFIDbranch_taken='0' and branched1='1') then--predicted to not taken when its taken, normal delay branch scenario, increase state towards taken
				revert<='0';--no need for reverting if branch is not taken
				--set in delay
				IFIDwrite<='1';--take somewhere else
				  PCWrite<='1';--take somewhere else
				IFIDreset<='0';
				branch_ok<='1';
				shift_register_write<='1';
				elsif(IFIDbranch_taken='1' and branched1='1')then--branch predicted to taken and taken, check if its a right prediction and the predicted address is right, decrease state towards taken
				--check if the predicted address is actually correct, do this later
				revert<='0';
				PCWrite<='1';
				IFIDwrite<='1';
				IFIDreset<='0';
				branch_ok<='0';--the branching is already done
				shift_register_write<='1';
				
				elsif(IFIDbranch_taken='0' and branched1='0')then--not taken predicted right
				IFIDwrite<='1';
				PCWrite<='1';
				IFIDreset<='0';
				revert<='0';
				branch_ok<='0';--the branching is never going to happen
				if(IFIDInstructionType=BEQ  or IFIDInstructionType=BNE) then--see if this can be fixex
				shift_register_write<='1';
				else
				shift_register_write<='0';
				end if;
				else
				branch_ok<='0';
				revert<='0';--no need for reverting if branch is not taken
				--set in delay
				PCWrite<='1';
				IFIDwrite<='1';
				IFIDreset<='0';
				shift_register_write<='0';
			   end if;
				else
				--IFIDwrite<='0';
				--buffer_write<='0';
				--branch_ok<='0';
				--IFIDreset<='0';
				branch_ok<='0';
				buffer_write<='0';
				revert<='0';--no need for reverting if branch is not taken
				--set in delay
				PCWrite<='0';
				IFIDwrite<='0';
				IFIDreset<='1';
				PCWrite<='0';
				Controlenable<='0';
				branch_taken<='0';
				buffer_write<='0';
				shift_register_write<='0';
				end if;
				end process;
				STATEMACHINE: process(IFID_state_in,branched1,ifidbranch_taken)
begin

				case IFID_state_in is
					when taken0 =>
					if( (IFIDbranch_taken='1' and branched1='1') or (IFIDbranch_taken='0' and branched1='1') ) then--predict taken
					state<=taken0;
					elsif((IFIDbranch_taken='0' and branched1='0') or (IFIDbranch_taken='1' and branched1='0'))then--predict not taken
					state<=taken1;
					else
					state<=nottaken1;
					end if;
					
					when taken1 =>
					if( (IFIDbranch_taken='1' and branched1='1') or (IFIDbranch_taken='0' and branched1='1') ) then--predict taken
					state<=taken0;
					elsif((IFIDbranch_taken='0' and branched1='0') or (IFIDbranch_taken='1' and branched1='0'))then--predict not taken
					state<=nottaken1;
					else
					state<=nottaken1;
					end if;
					
					when nottaken0 =>
					if( (IFIDbranch_taken='1' and branched1='1') or (IFIDbranch_taken='0' and branched1='1') ) then--predict taken
					state<=nottaken1;
					elsif((IFIDbranch_taken='0' and branched1='0') or (IFIDbranch_taken='1' and branched1='0'))then--predict not taken
					state<=nottaken0;		
					else
					state<=nottaken1;
					end if;
					
					when nottaken1 =>
					if( (IFIDbranch_taken='1' and branched1='1') or (IFIDbranch_taken='0' and branched1='1') ) then--predict taken
					state<=taken1;
					elsif((IFIDbranch_taken='0' and branched1='0') or (IFIDbranch_taken='1' and branched1='0'))then--predict not taken
					state<=nottaken0;
					else
					state<=nottaken1;
					end if;
					when others=>
					state<=nottaken1;
			 end case;

end process;

end Behavioral;

