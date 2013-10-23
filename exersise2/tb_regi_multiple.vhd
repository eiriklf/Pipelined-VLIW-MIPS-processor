--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:45:48 10/23/2013
-- Design Name:   
-- Module Name:   C:/Users/torbjlan/dmkonsttdt4255_work/exersise2/tb_regi_multiple.vhd
-- Project Name:  exersise2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: regi
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
 
ENTITY tb_regi_multiple IS
END tb_regi_multiple;
 
ARCHITECTURE behavior OF tb_regi_multiple IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT regi
    PORT(
         data_in : IN  std_logic_vector(31 downto 0);
         data_out : OUT  std_logic_vector(31 downto 0);
         clock : IN  std_logic;
         reset : IN  std_logic;
         write_enable : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal data_in : std_logic_vector(31 downto 0) := (others => '0');
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';
   signal write_enable : std_logic := '0';

 	--Outputs
   signal data_out : std_logic_vector(31 downto 0);
	
	--Signals between the 3 pipeline registers
	signal data_transfer1 : std_logic_vector(31 downto 0);
	signal data_transfer2 : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test 1 (UUT1)
   uut1: regi PORT MAP (
          data_in => data_in,
          data_out => data_transfer1,
          clock => clock,
          reset => reset,
          write_enable => write_enable
        );
		  
	-- Instantiate the Unit Under Test 2 (UUT2)
   uut2: regi PORT MAP (
          data_in => data_transfer1,
          data_out => data_transfer2,
          clock => clock,
          reset => reset,
          write_enable => write_enable
        );

	-- Instantiate the Unit Under Test 3 (UUT3)
   uut3: regi PORT MAP (
          data_in => data_transfer2,
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
		
		-- Every input and use of control signals are the same as in tb_regi2.vhd, except that 
		-- there are 3 pipeline registers to be tested instead of one.
		
		-- For every input, the output is updated at next rising edge, not current clock cycle,
		-- so that pipeline behaviour can be verified
		-- Expected output is same as input, but at next rising edge.
		
		write_enable <= '1';
		
		data_in <= "00001111000011110000111100001111";
		
		wait for 40 ns;
		
		-- Changing input
		data_in <= "11111111111111111111111111111111";
		
		wait for 37 ns;
		
		-- Changing input asynchronous to rising_edge
		data_in <= "11110000111100001111000011110000";
		
		wait for 48 ns;
		
		-- Changing input at excact moment of rising_edge
		data_in <= "11111111111111111111000011110000";
		
		wait for 35 ns;
		
		-- When write_enable is zero, there should be no update to register
		-- This is a stall-situation
		
		write_enable <='0';
		data_in <= "11110000000111111111111111111111";
		
		wait for 40 ns; --(Setting input at lowering edge)
		
		-- Doing another change to input to illustrate still no change in register
		data_in <= "11110000000111111111111000111111";
		
		wait for 40 ns;
		
		-- Reenabling write_enable, output should now be updated
		write_enable <= '1';
		
		wait for 40 ns;
		
		-- Enabling reset to flush output. This is a flush-situation
		reset <='1';
		
		wait for 40 ns;
		
		
		-- Unabling reset. Output should be set back to current input
		-- Input is usually changed at such a flush situation
		data_in <= "10000111000000111111111000111111";
		
		reset <='0';
		
		-- COMMENT: In this test only one register is tested, but in the processor
		-- a flush will reset multiple pipelnie registers, causing several inputs to be changed as well
		-- This will be explored in tb_multiple_regi.

      wait;
   end process;

END;
