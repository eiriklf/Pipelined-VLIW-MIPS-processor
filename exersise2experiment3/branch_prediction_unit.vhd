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
--TODO FIX THE BRANCH_address-compare predicted_address issue
entity branchprediction is
    Port (
                IFIDInstructionType           : in std_logic_vector(5 downto 0);
              IFIDreset                       : out STD_LOGIC;--syncronous reset for ifid register. Must be done when a branch prediction fails in order to prevent the wrong instructions to be executed
              IDEXreset                       : out std_logic; --resets idex register syncronously
              State                           : out std_logic_vector(1 downto 0); --the incremented state to be written back to the local branch prediction buffer (ID stage).
              State_in                        : in std_logic_vector(1 downto 0);-- the information from the local branch prediction buffer. (IF stage)
              IFID_state_in                   : in std_logic_vector(1 downto 0);   --the information from the local branch prediction buffer.(ID stage)
              buffer_write                    : out std_logic;  --signal that allow writes to all the prediction buffers
              branch_ok                       : out std_logic; --signal to allow the calculated branch address to the PC register
              revert                          : out std_logic;-- signal that allows reverting a faulty branchprediction
              IFIDbranch_taken                : in std_logic;--branch_taken signal in the ID stage
              branch_taken                    : out std_logic;--signals the a mux wheter a branchprediction should be taken or not. Signal is determined in IF stage
              branched1                       : in std_logic; --tells wheter a branch (not the prediction) is actually taken or not
              predicted_address               : in std_logic_vector(31 downto 0);--this is the predicted address, it must be tested if its the actual right branchaddress
              branch_address                  : in std_logic_vector(31 downto 0)--this is the actual branch address
              );
end branchprediction;



architecture Behavioral of branchprediction is
constant BEQ  : std_logic_vector(5 downto 0 ) := "000100";
constant BNE  : std_logic_vector(5 downto 0 ) := "000101";
constant taken0: std_logic_vector(1 downto 0):="11";
constant taken1: std_logic_vector(1 downto 0):="01";
constant nottaken1: std_logic_vector(1 downto 0):="00";--initialize to this
constant nottaken0: std_logic_vector(1 downto 0):="10";

begin
    

process(IFIDbranch_taken,state_in,branched1,branch_address,predicted_address,IFIDInstructionType)
begin


                
                
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
                IDEXreset<='1';
                IFIDreset<='1';
                branch_ok<='0';--mishap, no branch
                buffer_write<='1';--must decrease state
                
                elsif(IFIDbranch_taken='1' and not (branch_address=predicted_address) )then--revert if a new program has been loaded, or if the predicted address is a miss
                revert<='1';
                IFIDreset<='1';
                IDEXreset<='1';
                branch_ok<='0';--mishap, no branch
                buffer_write<='1';
                
                elsif(IFIDbranch_taken='0' and branched1='1') then--predicted to not taken when its taken, normal delay branch scenario, increase state towards taken
                revert<='0';--no need for reverting if branch is not taken
                --set in delay
                IFIDreset<='1';
                IDEXreset<='1';
                branch_ok<='1';
                buffer_write<='1';
                elsif(IFIDbranch_taken='1' and branched1='1')then--branch predicted to taken and taken, check if its a right prediction and the predicted address is right, decrease state towards taken
                --check if the predicted address is actually correct, do this later
                revert<='0';
                IFIDreset<='0';
                IDEXreset<='0';
                branch_ok<='0';--the branching is already done
                buffer_write<='1';
                
                elsif(IFIDbranch_taken='0' and branched1='0')then--not taken predicted right
                IFIDreset<='0';
                IDEXreset<='0';
                revert<='0';
                branch_ok<='0';--the branching is never going to happen
                if(IFIDInstructionType=BEQ  or IFIDInstructionType=BNE) then--see if this can be fixex
                buffer_write<='1';
                else
                buffer_write<='0';
                end if;
                else
                branch_ok<='0';
                revert<='0';--no need for reverting if branch is not taken
                --set in delay
                IFIDreset<='0';
                IDEXreset<='0';
					 buffer_write<='0';
               end if;

                --buffer_write<='0';
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

