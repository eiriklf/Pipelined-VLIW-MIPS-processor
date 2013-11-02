--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:09:21 10/23/2013
-- Design Name:   
-- Module Name:   C:/Users/torbjlan/dmkonsttdt4255_work/exersise2/TriputMux_tb.vhd
-- Project Name:  exersise2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: TriputMux
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
 
ENTITY TriputMux_tb IS
END TriputMux_tb;
 
ARCHITECTURE behavior OF TriputMux_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TriputMux
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         C : IN  std_logic_vector(31 downto 0);
         R : OUT  std_logic_vector(31 downto 0);
         control : IN  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');
   signal C : std_logic_vector(31 downto 0) := (others => '0');
   signal control : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal R : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TriputMux PORT MAP (
          A => A,
          B => B,
          C => C,
          R => R,
          control => control
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	


      -- insert stimulus here 
		
		-- Setting inputs
		A <= "00000000000000001111111111111111";
		B <= "11111111111111110000000000000000";
		C <= "11111111111111111111111111111111";
		
		control <= "00";		
		
		wait for 40 ns;
		
		-- Input A is set as output when control signal is 11 or 00
		-- Control already at 00, setting to 11
		control <= "11";
		
		wait for 40 ns;
		
		-- Changes to A should change output when A is set to output
		A <= "00001111000011110000111100001111";
		
		wait for 40 ns;
		
		-- Changes to B and C should not change output when A is set to output
		B <= "11110000111100001111000011110000";
		C <= "00000000111111111111111100000000";
		
		wait for 40 ns;
		
		-- Setting B to output by setting control to 10
		control <= "10";
		
		wait for 40 ns;
		
		-- Changes to B should change output when A is set to output
		B <= "00000000000000000000111111111111";
		
		wait for 40 ns;
		
		-- Changes to A and C should not change output when B is set to output
		A <= "11111111000000000000000000000000";
		C <= "11110000000000000000000000001111";
		
		wait for 40 ns;
		
		-- Setting C to output by setting control to 01
		control <= "01";
		
		wait for 40 ns;
		
		-- Changes to C should change output when A is set to output
		C <= "11111111111111111111111111111111";
		
		wait for 40 ns;
		
		-- Changes to A and B should not change output when C is set to output
		A <= "00000000000000000000000000000000";
		B <= "11110000000000011111110000001111";

      wait;
   end process;

END;
