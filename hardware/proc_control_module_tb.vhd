--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   03:04:29 09/28/2013
-- Design Name:   
-- Module Name:   C:/Users/fadeev/Documents/dmkonsttdt4255_work/hardware/proc_control_module_tb.vhd
-- Project Name:  exercise1_mux_work
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: proc_control_module
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
 
ENTITY proc_control_module_tb IS
END proc_control_module_tb;
 
ARCHITECTURE behavior OF proc_control_module_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT proc_control_module
    PORT(
         Opcode : IN  std_logic_vector(5 downto 0);
         clk : IN  std_logic;
         processor_enable : IN  std_logic;
         reset : IN  std_logic;
         RegDst : OUT  std_logic;
         RegWrite : OUT  std_logic;
         ALUSrc : OUT  std_logic;
         MemtoReg : OUT  std_logic;
         MemRead : OUT  std_logic;
         MemWrite : OUT  std_logic;
         ALUOp0 : OUT  std_logic;
         ALUOp1 : OUT  std_logic;
         Branch : OUT  std_logic;
         state_vector : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Opcode : std_logic_vector(5 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal processor_enable : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal RegDst : std_logic := '1';
   signal RegWrite : std_logic := '1';
   signal ALUSrc : std_logic := '1';
   signal MemtoReg : std_logic := '1';
   signal MemRead : std_logic := '1';
   signal MemWrite : std_logic := '1';
   signal ALUOp0 : std_logic := '1';
   signal ALUOp1 : std_logic := '1';
   signal Branch : std_logic := '1';
   signal state_vector : std_logic_vector(1 downto 0) := "11";

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: proc_control_module PORT MAP (
          Opcode => Opcode,
          clk => clk,
          processor_enable => processor_enable,
          reset => reset,
          RegDst => RegDst,
          RegWrite => RegWrite,
          ALUSrc => ALUSrc,
          MemtoReg => MemtoReg,
          MemRead => MemRead,
          MemWrite => MemWrite,
          ALUOp0 => ALUOp0,
          ALUOp1 => ALUOp1,
          Branch => Branch,
          state_vector => state_vector
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
            
      wait for 10 ns;	

      processor_enable <= '1';
      reset <= '1';
      opcode <= "000000";
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      reset <= '0';
      
      wait for clk_period*3;
      Opcode <= "000000";
      wait for clk_period*3;
      Opcode <= "100011";
      wait for clk_period*3;
      Opcode <= "101011";   
      wait for clk_period*3;
      Opcode <= "000100";   
      
      wait for clk_period*3;
      Opcode <= "000000";
      wait for clk_period*3;
      Opcode <= "100011";
      wait for clk_period*3;
      Opcode <= "101011";     
      wait for clk_period*3;
      Opcode <= "000100";  
      
      wait;
   end process;

END;
