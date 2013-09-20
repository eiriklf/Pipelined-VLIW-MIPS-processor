--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:06:11 09/20/2013
-- Design Name:   
-- Module Name:   C:/Users/fadeev/Documents/dmkonsttdt4255_work/exercise1_mux_work/simple_multiplexer_tb.vhd
-- Project Name:  exercise1_mux_work
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: simple_multiplexer
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
 
ENTITY simple_multiplexer_tb IS
END simple_multiplexer_tb;
 
ARCHITECTURE behavior OF simple_multiplexer_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT simple_multiplexer
    PORT(
         a : IN  std_logic_vector(31 downto 0);
         b : IN  std_logic_vector(31 downto 0);
         control_signal : IN  std_logic;
         output : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(31 downto 0) := (others => '0');
   signal b : std_logic_vector(31 downto 0) := (others => '0');
   signal control_signal : std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: simple_multiplexer PORT MAP (
          a => a,
          b => b,
          control_signal => control_signal,
          output => output
        );

   -- Clock process definitions

 
   c_fluct_process :process
   begin
      control_signal <= '0';
      wait for clk_period*10;
      control_signal <= '1';
      wait for clk_period*10;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      
      wait for clk_period*10;
      a(31 downto 25) <= (others => '1');
      a(12 downto 3) <= (others => '1');
      b(20 downto 10) <= (others => '1');
      
      -- insert stimulus here 

      wait;
   end process;

END;
