--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:45:34 09/28/2013
-- Design Name:   
-- Module Name:   C:/Users/eiriklf/exersise1/testcounter.vhd
-- Project Name:  exersise1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PC
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
 
ENTITY testcounter IS
END testcounter;
 
ARCHITECTURE behavior OF testcounter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PC
    PORT(
         Data_in : IN  std_logic_vector(31 downto 0);
         increment : IN  std_logic;
         data_out : OUT  std_logic_vector(31 downto 0);
         clock : IN  std_logic;
         reset : IN  std_logic;
         write_enable : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Data_in : std_logic_vector(31 downto 0) := (others => '0');
   signal increment : std_logic := '0';
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';
   signal write_enable : std_logic := '0';

 	--Outputs
   signal data_out : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PC PORT MAP (
          Data_in => Data_in,
          increment => increment,
          data_out => data_out,
          clock => clock,
          reset => reset,
          write_enable => write_enable
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clock_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
