
-- The controlpath.vhd file consists of all components in the processor that is used
-- when deciding the next value for the PC.
-- This is regular incrementation, branch-operation and jump-operation

-- Components: 
--	* incrementer-adder 
--	* adder for branch operations,
-- * 2 multiplexors used for deciding the next value for the PC

-- Input signals:
-- * the current output from the PC, which is to be incremente
-- * bits 25-0 from the current instruction, known as Instr_Mem_Concat
-- * Signextended input which is the second input to the adder used for branch operations
-- * Control signals: jump, branch, zero. Jump is used in the 2nd multiplexor and is active on Jump-insruction, 
--							branch and zero are joined in an AND-operation and the result is used in the 1st multiplexor.
--							branch is active on branch operations, zero is active when ALU-output in the processor is zero

-- Output signal: FinalPCAdress, which is the chosen next value for the PC


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use WORK.MIPS_CONSTANT_PKG.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;


entity controlpath is
    Port ( PC_OUTPUT : in  STD_LOGIC_VECTOR (31 downto 0);
           Signextended : in  STD_LOGIC_VECTOR (31 downto 0);
           Instr_Mem_Concat : in  STD_LOGIC_VECTOR (25 downto 0);
           BranchAdder : out  STD_LOGIC_VECTOR (31 downto 0);
           jump, branch, zero : in  STD_LOGIC);
end controlpath;

architecture Behavioral of controlpath is
	
	component simple_multiplexer is
	generic (N :NATURAL :=DDATA_BUS);
	    Port ( 	a : in  STD_LOGIC_VECTOR (N-1 downto 0);
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
			R	: out	STD_LOGIC_VECTOR(N-1 downto 0));
	end component adder;


	-- From BranchAdder
	--signal BranchAdder : STD_LOGIC_VECTOR (31 downto 0); -- Data output signal from Branch Adder
	-- From Concat


begin

	--	Concat is not a component like the schedule in the assignment shows
	--	Merging together the 6 most significant bits from the incremented PC-value
	-- with the signal Instr_Mem_Concatis sufficient
	-- The signal name concat is still based on the schedule

	

	
end Behavioral;

