--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:00:39 09/28/2013
-- Design Name:   
-- Module Name:   C:/Users/eiriklf/exersise1/testcontrol.vhd
-- Project Name:  exersise1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: control
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
use WORK.MIPS_CONSTANT_PKG.ALL;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testcontrol IS
END testcontrol;
 
ARCHITECTURE behavior OF testcontrol IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT control
    PORT(
         procon : IN  std_logic_vector(5 downto 0);
         Ops : OUT  ProOP;
			reset: in std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal procon : std_logic_vector(5 downto 0) := (others => '0');
	signal reset :std_logic;

 	--Outputs
   signal Ops : ProOP;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 signal clk: std_logic;
   constant period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: control PORT MAP (
          procon => procon,
          Ops => Ops,
			 reset=> reset
        );

   -- Clock process definitions
   cprocess :process
   begin
		clk <= '0';
		wait for period/2;
		clk <= '1';
		wait for period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
	reset<='1';
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		reset<='0';
	procon<="000000";
      wait for period*10;
	procon<="100001";
      -- insert stimulus here 

      wait;
   end process;

END;
