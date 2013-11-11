
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity regi is
   generic (N :NATURAL := 32);
   Port ( data_in : in  STD_LOGIC_VECTOR (N-1 downto 0);
           data_out : out  STD_LOGIC_VECTOR (N-1 downto 0);
           clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           write_enable : in  STD_LOGIC);--remove this if not needed
	end regi;

architecture Behavioral of regi is
	signal data: STD_LOGIC_VECTOR (N-1 downto 0);
	constant reset_state   : std_logic_vector(N-1 downto 0) := (others => '0');

	begin

	-- For each clock_cycle when write_enable is 1, the contents of the PC, represented by the signal data,
	-- will be updated with output from Incrementation, Branching or Jump
	REGIST : process(clock, reset,write_enable)
	begin

		if(rising_edge(clock)) then
					
				if(reset='1') then
				data<=reset_state;
				elsif(write_enable='1')then
				data<=data_in;
			end if;
		end if;
	 end process;
 
	data_out<=data;


end Behavioral;
