----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:29:59 09/28/2013 
-- Design Name: 
-- Module Name:    controlpath - Behavioral 
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
use WORK.MIPS_CONSTANT_PKG.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity controlpath is
    Port ( PC_OUTPUT : in  STD_LOGIC_VECTOR (31 downto 0);

           InstrMem_Signext : in  STD_LOGIC_VECTOR (15 downto 0);
           Instr_Mem_Concat : in  STD_LOGIC_VECTOR (25 downto 0);
           FinalPCAddress : out  STD_LOGIC_VECTOR (31 downto 0);
           jump : in  STD_LOGIC);
end controlpath;

architecture Behavioral of controlpath is
	component simple_multiplexer is
	generic (N :NATURAL :=DDATA_BUS);
	    Port ( a : in  STD_LOGIC_VECTOR (N-1 downto 0);
           b : in  STD_LOGIC_VECTOR (N-1 downto 0);
           control_signal : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (N-1 downto 0));
			  end component simple_multiplexer;
			  
			  	component adder is
		generic (N :NATURAL :=DDATA_BUS);  
		port(
			X	: in	STD_LOGIC_VECTOR(N-1 downto 0);
			Y	: in	STD_LOGIC_VECTOR(N-1 downto 0);
			COUT	: out	STD_LOGIC;
			R	: out	STD_LOGIC_VECTOR(N-1 downto 0)
		);
	end component adder;


	-- From BranchAdder
	signal BranchAdder : STD_LOGIC_VECTOR (31 downto 0); -- Data output signal from Branch Adder
	-- From Concat
	signal Concat : STD_LOGIC_VECTOR (31 downto 0); -- Data output from Concat
	-- From Signextend
	signal Signextended : STD_LOGIC_VECTOR (31 downto 0); -- Data output from Signextend

begin
--signextend
Signextended<=InstrMem_Signext&"0000000000000000";
--concat
Concat<=Instr_Mem_Concat&PC_Output(31 downto 26);--this might be wrong
	ADDRESSADDER: adder port map(
			X	=> PC_Output,
			Y	=>Signextended,
			--COUT	=>'0',
			R	=>BranchAdder
	
	);
	MUX5: simple_multiplexer port map( 
			a =>BranchAdder,
           b => concat,
           control_signal =>jump,
           output =>FinalPCAddress);
			  

end Behavioral;

