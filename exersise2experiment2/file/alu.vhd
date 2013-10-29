----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:21:04 05/03/2012 
-- Design Name: 
-- Module Name:    alu - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;



library WORK;
use WORK.MIPS_CONSTANT_PKG.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu is
	generic (N: NATURAL);
	port(
		X			: in STD_LOGIC_VECTOR(N-1 downto 0);
		Y			: in STD_LOGIC_VECTOR(N-1 downto 0);
		ALU_IN	: in ALU_INPUT;
		R			: out STD_LOGIC_VECTOR(N-1 downto 0);
		FLAGS		: out ALU_FLAGS
	);
end alu;

architecture Behavioral of alu is

	component ALU_1BIT is 
	port(
			X	: in STD_LOGIC_vector(3 downto 0);
			Y	: in STD_LOGIC_vector(3 downto 0);
			LESS	: in STD_LOGIC;
			BINVERT : in STD_LOGIC;
			CIN	: in STD_LOGIC;
			OP1	: in STD_LOGIC;
			OP0	: in STD_LOGIC;
			RES	: out STD_LOGIC_vector(3 downto 0);
			COUT	: out STD_LOGIC_vector(3 downto 0);
			SET	: out STD_LOGIC;
			G		: out std_logic;
			P		: out std_logic
	);
	end component ALU_1BIT;

	signal LESS_AUX : STD_LOGIC; 
	signal COUT_AUX : STD_LOGIC_VECTOR(7 downto 0);
	signal R_AUX	: STD_LOGIC_VECTOR(N-1 downto 0);
	signal Generates: std_logic_vector(7 downto 0);
	signal Propagates: std_logic_vector(7 downto 0);
	signal FULL_COUT: STD_LOGIC_VECTOR(N-1 downto 0);
	signal multiplied: std_logic_vector(63 downto 0);
	
	
begin

	BEGIN_ALU1B:
		ALU_1BIT port map (
				X	=> X(3 downto 0),
				Y	=> Y(3 downto 0),
				LESS	=> LESS_AUX,
				BINVERT => ALU_IN.Op2,
				CIN	=> ALU_IN.Op2,
				OP1	=> ALU_IN.Op1,
				OP0	=> ALU_IN.Op0,					
				RES	=> R_AUX(3 downto 0),
				COUT	=> FULL_COUT(3 downto 0),
				G=>generates(0),
				P=>propagates(0)
		);
	cout_aux(0)<=generates(0) or (propagates(0) and ALU_IN.Op2);							
								
	GEN_ALU:
		for i in 2 to (N/4)-1 generate
			NEXT_ALU1B:
				ALU_1BIT port map (
					X	=> X(((i*4)-1) downto ((i*4)-4)),
					Y	=> Y((i*4)-1 downto (i*4)-4),
					LESS	=> '0',
					BINVERT => ALU_IN.Op2,
					CIN	=> COUT_AUX(i-2),
					OP1	=> ALU_IN.Op1,
					OP0	=> ALU_IN.Op0,
					RES	=> R_AUX((i*4)-1 downto (i*4)-4),
					COUT	=> FULL_COUT((i*4)-1 downto (i*4)-4),
					G=>generates(i-1),
					P=>propagates(i-1)
				);
				cout_aux(i-1)<=generates(i-1) or (propagates(i-1) and cout_aux(i-2));
		end generate;

	LAST_ALU1B:
		ALU_1BIT port map (
			X	=> X(N-1 downto n-4),
			Y	=> Y(N-1 downto n-4),
			LESS	=> '0',
			BINVERT => ALU_IN.Op2,
			CIN	=> COUT_AUX(6),
			OP1	=> ALU_IN.Op1,
			OP0	=> ALU_IN.Op0,
			RES	=> R_AUX(N-1 downto n-4),
			COUT	=> FULL_COUT(N-1 downto n-4),
			SET	=> LESS_AUX,
			G=>generates(7),
			P=>propagates(7)
		);
		cout_aux(7)<=generates(7) or (propagates(7) and cout_aux(6));
			
	FLAGS.Carry <= COUT_AUX(7);
	FLAGS.Overflow <= COUT_AUX(7) xor FULL_COUT(N-2) ;
	FLAGS.Negative <= '1' when R_AUX(N-1)='1' else '0';
	FLAGS.Zero <= '1' when R_AUX= ZERO32b else '0';
		
		
			ALU_RES: process(ALU_IN.Op3,R_AUX,alu_in.op4,X,multiplied,y)
		begin
			if(alu_in.op4='1') then
			multiplied<=X*Y;
			R<=multiplied(31 downto 0);
			elsif  ALU_IN.Op3='1' then
				R <= Y( ((N/2)-1) downto 0) & ZERO16b;
				multiplied<="0000000000000000000000000000000000000000000000000000000000000000";
			else
				R <= R_AUX;
			multiplied<="0000000000000000000000000000000000000000000000000000000000000000";
			end if;
		end process;

end Behavioral;

