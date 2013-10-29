
entity branch_target_buffer is
	port(
			CLK 			:	in	STD_LOGIC;				
			RESET			:	in	STD_LOGIC;				
			RW				:	in	STD_LOGIC;				
			Read_address:	in	STD_LOGIC_VECTOR (4 downto 0); 
			Write_address:	in	STD_LOGIC_VECTOR (4 downto 0);
			WRITE_DATA	:	in	STD_LOGIC_VECTOR (15 downto 0); 
			Data_out		:	out	STD_LOGIC_VECTOR (15 downto 0)
	);

end branch_target_buffer;

architecture Behavioral of branch_target_buffer is

	constant NUM_REG : integer := 32;
	type REGS_T is array (NUM_REG-1 downto 0) of STD_LOGIC_VECTOR(15 downto 0);
	
	signal REGS : REGS_T := (others => (others =>'0'));

begin

	REGISTERS: process(CLK, RESET)
	begin

		if rising_edge(CLK) then
			if  RW='1' then
				REGS(to_integer(unsigned(Write_address)))<=WRITE_DATA;
			end if;
		end if;
	end process  REGISTERS;

	Data_out <= REGS(to_integer(unsigned(RS_ADDR)));

end Behavioral;