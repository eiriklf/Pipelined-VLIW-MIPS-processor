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
use IEEE.STD_LOGIC_ARITH.ALL;

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
           jump, branch, zero : in  STD_LOGIC);
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
	signal incremented : STD_LOGIC_VECTOR (31 downto 0);
	signal mux4out: STD_LOGIC_VECTOR (31 downto 0);
	signal branchok: std_logic;

begin
--signextend
--Signextended<=InstrMem_Signext&"0000000000000000"; -- adding 4 to either of the inputs of the branchadder will fix the metastabillity issue
--Signextended <= SXT(InstrMem_Signext, Signextended'LENGTH);
branchok<=(branch and zero);
signextended(1 downto 0)<="00";
Signextended(17 downto 2) <=InstrMem_Signext;
Signextended(31 downto 18) <= (31 downto 18 => InstrMem_Signext(15));

--concat
Concat<=incremented(31 downto 28)&Instr_Mem_Concat&"00";--this might be wrong

	Incrementer: adder port map(
	x=>PC_output,
	y=>"00000000000000000000000000000001",
	R=>incremented
	
	);
	
		ADDRESSADDER: adder port map(
			X	=> incremented,
			Y	=>Signextended,
			--COUT	=>'0',
			R	=>BranchAdder
			);
			
		MUX4: simple_multiplexer port map( 
			a =>incremented,
           b => BranchAdder,
           control_signal =>branchok,
           output =>mux4out);
	MUX5: simple_multiplexer port map( 
			a =>mux4out,
           b => concat,
           control_signal =>jump,
           output =>FinalPCAddress);
			  

end Behavioral;

