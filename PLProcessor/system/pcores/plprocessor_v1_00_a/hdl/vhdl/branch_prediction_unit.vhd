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

--This is the branch prediction unit. It is responcible for everything that has to do with branching, including hazardcontrol/stalling. 
--The scheme that is implemented is a corrolating branchprediction, where it has a buffer with room for 128 predictors mapped to 32 different prediction target addresses (placed in a different buffer).
--We have also taken account for that the predicted address might be wrong, and making proper revertions if that happens.
--This unit also ensures controlsignals of registers and muxes that has something with branching. 
entity branchprediction is
    Port (
              IFIDInstructionType           : in std_logic_vector(5 downto 0);
              IFIDreset                       : out STD_LOGIC;--syncronous reset for ifid register. Must be done when a branch prediction fails in order to prevent the wrong instructions to be executed
              IDEXreset                       : out std_logic; --resets idex register syncronously
              State                           : out std_logic_vector(1 downto 0); --the incremented state to be written back to the local branch prediction buffer (ID stage).
              State_in                        : in std_logic_vector(1 downto 0);-- the information from the local branch prediction buffer. (IF stage)
              IDEX_state_in                    : in std_logic_vector(1 downto 0);   --the information from the local branch prediction buffer.(ID stage)
              buffer_write                    : out std_logic;  --signal that allow writes to all the prediction buffers
              branch_ok                       : out std_logic; --signal to allow the calculated branch address to the PC register
              revert                          : out std_logic;-- signal that allows reverting a faulty branchprediction
				  IDEXbranch_taken					 : in std_logic;
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
constant nottaken1: std_logic_vector(1 downto 0):="00";--we want all predictions to start at this value
constant nottaken0: std_logic_vector(1 downto 0):="10";

begin
    

process(IDEXbranch_taken,state_in,branched1,branch_address,predicted_address,IFIDInstructionType)
begin


                
                --this could be in an own process. The following sentence happens in IF-stage
					 --should the prediction be taken?
                if(state_in=taken0 or state_in=taken1) then
					 --yes?
                branch_taken<='1';
                else
					 --no?
                branch_taken<='0';
                end if;


					 
                if(IDEXbranch_taken='1' and branched1='0') then--signals set here is equivalent with the secound elsif, so the order dont have anything to say
                
                revert<='1';
                IDEXreset<='1';
                IFIDreset<='1';
                branch_ok<='0';--prediction is wrong, no branch
                buffer_write<='1';--must decrease state
               					 
                elsif(IDEXbranch_taken='1' and not (branch_address=predicted_address) and branched1='0' )then--revert and flush, the whole prediction is wrong
                revert<='1';
                IFIDreset<='1';
                IDEXreset<='1';
                branch_ok<='0';--mishap, no branch
                buffer_write<='1';
               					 
					 elsif(IDEXbranch_taken='1' and not (branch_address=predicted_address) and branched1='1' )then--the predicted address is wrong, but the prediction desicion is right. 
					 --The buffer needs to be revritten and the last 2 instructions flushed
                revert<='0';
                IFIDreset<='1';
                IDEXreset<='1';
                branch_ok<='1';
                buffer_write<='1'; 
					 
                elsif(IDEXbranch_taken='0' and branched1='1') then--prediction of the branch not taken, while branch is taken. increase state towards taken
                revert<='0';--no need for reverting if prediction is not taken
                IFIDreset<='1';
                IDEXreset<='1';
                branch_ok<='1';
                buffer_write<='1';

                elsif(IDEXbranch_taken='1' and branched1='1')then--branch predicted to taken and the actual branch taken, check if its a right prediction and the predicted address is right, decrease state towards taken
                --check if the predicted address is actually correct, do this later
                revert<='0';
                IFIDreset<='0';
                IDEXreset<='0';
                branch_ok<='0';--no branching, the predict is already taken
                buffer_write<='1';
                
                elsif(IDEXbranch_taken='0' and branched1='0')then--not taken predicted, and branch is not taken, or the instruction might not be a branch-instruction at all
                IFIDreset<='0';
                IDEXreset<='0';
                revert<='0';
                branch_ok<='0';--dont branch
                if(IFIDInstructionType=BEQ  or IFIDInstructionType=BNE) then
                buffer_write<='1';--write to buffers only if instructiontype is a branch
                else
                buffer_write<='0';
                end if;
                else
                branch_ok<='0';
                revert<='0';
                IFIDreset<='0';
                IDEXreset<='0';
					 buffer_write<='0';
               end if;
                end process;
					 
                STATEMACHINE: process(IDEX_state_in ,branched1,IDEXbranch_taken)
					begin

                case IDEX_state_in  is
                    when taken0 =>
                    if( (IDEXbranch_taken='1' and branched1='1') or (IDEXbranch_taken='0' and branched1='1') ) then--branch taken
                    state<=taken0;
                    elsif((IDEXbranch_taken='0' and branched1='0') or (IDEXbranch_taken='1' and branched1='0'))then--branch not taken
                    state<=taken1;
                    else
                    state<=nottaken1;
                    end if;
                    
                    when taken1 =>
                    if( (IDEXbranch_taken='1' and branched1='1') or (IDEXbranch_taken='0' and branched1='1') ) then--branch taken
                    state<=taken0;
                    elsif((IDEXbranch_taken='0' and branched1='0') or (IDEXbranch_taken='1' and branched1='0'))then--branch not taken
                    state<=nottaken1;
                    else
                    state<=nottaken1;
                    end if;
                    
                    when nottaken0 =>
                    if( (IDEXbranch_taken='1' and branched1='1') or (IDEXbranch_taken='0' and branched1='1') ) then--branch taken
                    state<=nottaken1;
                    elsif((IDEXbranch_taken='0' and branched1='0') or (IDEXbranch_taken='1' and branched1='0'))then--branch not taken
                    state<=nottaken0;       
                    else
                    state<=nottaken1;
                    end if;
                    
                    when nottaken1 =>
                    if( (IDEXbranch_taken='1' and branched1='1') or (IDEXbranch_taken='0' and branched1='1') ) then--branch taken
                    state<=taken1;
                    elsif((IDEXbranch_taken='0' and branched1='0') or (IDEXbranch_taken='1' and branched1='0'))then--branch not taken
                    state<=nottaken0;
                    else
                    state<=nottaken1;
                    end if;
                    when others=>
                    state<=nottaken1;
             end case;

end process;

end Behavioral;

