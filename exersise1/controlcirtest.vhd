--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:12:38 09/28/2013
-- Design Name:   
-- Module Name:   C:/Users/eiriklf/exersise1/controlcirtest.vhd
-- Project Name:  exersise1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: controlpath
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY controlcirtest IS
END controlcirtest;
 
ARCHITECTURE behavior OF controlcirtest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT controlpath
    PORT(
         PC_OUTPUT : IN  std_logic_vector(31 downto 0);
         InstrMem_Signext : IN  std_logic_vector(15 downto 0);
         Instr_Mem_Concat : IN  std_logic_vector(25 downto 0);
         FinalPCAddress : OUT  std_logic_vector(31 downto 0);
         jump : IN  std_logic
        );
    END COMPONENT;
	 
    

   --Inputs
   signal PC_OUTPUT : std_logic_vector(31 downto 0) := (others => '0');
   signal InstrMem_Signext : std_logic_vector(15 downto 0) := (others => '0');
   signal Instr_Mem_Concat : std_logic_vector(25 downto 0) := (others => '0');
   signal jump : std_logic := '0';

 	--Outputs
   signal FinalPCAddress : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: controlpath PORT MAP (
          PC_OUTPUT => PC_OUTPUT,
          InstrMem_Signext => InstrMem_Signext,
          Instr_Mem_Concat => Instr_Mem_Concat,
          FinalPCAddress => FinalPCAddress,
          jump => jump
        );



   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
InstrMem_Signext<="1000001001111001";
Instr_Mem_Concat<="10011100111100011100111110";
wait for 80 ns;
jump<='1';
wait for 20 ns;
jump<='0';
Instr_Mem_Concat<="00000000000000011100111110";
wait for 40 ns;
InstrMem_Signext<="0000000000000000";

      -- insert stimulus here 

      wait;
   end process;

END;
