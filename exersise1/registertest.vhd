--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:03:57 09/28/2013
-- Design Name:   
-- Module Name:   C:/Users/eiriklf/exersise1/registertest.vhd
-- Project Name:  exersise1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: register_file
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
 
ENTITY registertest IS
END registertest;
 
ARCHITECTURE behavior OF registertest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT register_file
    PORT(
         CLK : IN  std_logic;
         RESET : IN  std_logic;
         RW : IN  std_logic;
         RS_ADDR : IN  std_logic_vector(4 downto 0);
         RT_ADDR : IN  std_logic_vector(4 downto 0);
         RD_ADDR : IN  std_logic_vector(4 downto 0);
         WRITE_DATA : IN  std_logic_vector(31 downto 0);
         RS : OUT  std_logic_vector(31 downto 0);
         RT : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RESET : std_logic := '0';
   signal RW : std_logic := '0';
   signal RS_ADDR : std_logic_vector(4 downto 0) := (others => '0');
   signal RT_ADDR : std_logic_vector(4 downto 0) := (others => '0');
   signal RD_ADDR : std_logic_vector(4 downto 0) := (others => '0');
   signal WRITE_DATA : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal RS : std_logic_vector(31 downto 0);
   signal RT : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: register_file PORT MAP (
          CLK => CLK,
          RESET => RESET,
          RW => RW,
          RS_ADDR => RS_ADDR,
          RT_ADDR => RT_ADDR,
          RD_ADDR => RD_ADDR,
          WRITE_DATA => WRITE_DATA,
          RS => RS,
          RT => RT
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
	reset<='1';
      -- hold reset state for 100 ns.
      wait for 100 ns;	
reset<='0';
rw<='1';
RD_ADDR<="00100";
WRITE_DATA<="01010000000010001100000100111111";
wait for 20 ns;
rw<='0';
RS_ADDR<="00100";
      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
