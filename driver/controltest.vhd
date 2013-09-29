--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:57:58 09/28/2013
-- Design Name:   
-- Module Name:   C:/Users/eiriklf/exersise1/controltest.vhd
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
USE ieee.std_logic_1164.ALL;
use WORK.MIPS_CONSTANT_PKG.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY controltest IS
END controltest;
 
ARCHITECTURE behavior OF controltest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT control
    PORT(
         procon : IN  std_logic_vector(5 downto 0);
         Ops : out ProOP;
         clk : IN  std_logic;
         processor_enable : IN  std_logic;
         increment : OUT  std_logic;
         reset : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal procon : std_logic_vector(5 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal processor_enable : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal Ops : ProOP;
   signal increment : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: control PORT MAP (
          procon => procon,
          Ops => Ops,
          clk => clk,
          processor_enable => processor_enable,
          increment => increment,
          reset => reset
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
	reset<='1';
      -- hold reset state for 100 ns.
      wait for 100 ns;	
reset<='0';
processor_enable<='1';
      wait for clk_period*10;
procon<="101011";
wait for 100 ns;
reset<='1';

      -- insert stimulus here 

      wait;
   end process;

END;
