----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:42:52 09/27/2013 
-- Design Name: 
-- Module Name:    control - Behavioral 
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
use WORK.MIPS_CONSTANT_PKG.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- * BEQ: 000100
-- * LW:  100011 (We might also need more loads than Load Word)
-- * SW:  101011
-- * LUI: 001111
-- * JMP: 000010

--regdest(0)
--branch(1)
--Jump(2)
--MemtoReg(3)
--memwrite(4)
--alusrc(5)
--regwrite(6)
--memread?

entity control is

    Port ( procon : in  STD_LOGIC_VECTOR (5 downto 0);
           Ops : out ProOP;
			  clk: in std_logic;
			  processor_enable: in std_logic;
			  increment: out std_logic;
			  reset: in std_logic
			  );
end control;

architecture Behavioral of control is
--todo find out dont care
signal state : std_logic_vector(1 downto 0);
constant JMP  : std_logic_vector(5 downto 0 ) := "000010";
constant LW  : std_logic_vector(5 downto 0 ) := "100011";
constant SW  : std_logic_vector(5 downto 0 ) := "101011";
constant LUI  : std_logic_vector(5 downto 0 ) := "001111";
constant BEQ  : std_logic_vector(5 downto 0 ) := "000100";
constant ALUOP  : std_logic_vector(5 downto 0 ) := "000000";
begin

asserting_output_signals : process(procon, reset)  
begin

if (reset = '0') then
if(procon=JMP) then
Ops.jump<='1';
Ops.memwrite<='0';
Ops.regwrite<='0';
Ops.memtoreg<='0';
Ops.alusrc<='0';
Ops.branch<='0';
Ops.regdest<='0';
 ops.ALUOp0 <= '0';
 ops.ALUOp1 <= '0';
elsif(procon=SW) then
Ops.jump<='0';
Ops.memwrite<='1';
Ops.regwrite<='0';
Ops.memtoreg<='0';
Ops.alusrc<='1';
Ops.branch<='0';
Ops.regdest<='0';
 ops.ALUOp0 <= '0';
 ops.ALUOp1 <= '0';
elsif(procon=LW) then
Ops.jump<='0';
Ops.memwrite<='0';
Ops.regwrite<='1';
Ops.memtoreg<='1';
Ops.alusrc<='1';
Ops.branch<='0';
Ops.regdest<='0';
 ops.ALUOp0 <= '0';
 ops.ALUOp1 <= '0';
elsif(procon=LUI)then--!!!
Ops.jump<='0';
Ops.memwrite<='0';
Ops.regwrite<='0';
Ops.memtoreg<='0';
Ops.alusrc<='1';
Ops.branch<='0';
Ops.regdest<='0';
 ops.ALUOp0 <= '0';
 ops.ALUOp1 <= '0';
elsif(procon=BEQ)then
Ops.jump<='0';
Ops.memwrite<='0';
Ops.regwrite<='0';
Ops.memtoreg<='0';
Ops.alusrc<='0';
Ops.branch<='1';
Ops.regdest<='0';
 ops.ALUOp1 <= '0';              
ops.ALUOp0 <= '1';
elsif(procon=ALUOP)then
Ops.jump<='0';
Ops.memwrite<='0';
Ops.regwrite<='1';
Ops.memtoreg<='0';
Ops.alusrc<='0';
Ops.branch<='0';
Ops.regdest<='1';
 ops.ALUOp1 <= '1';
 ops.ALUOp0 <= '0';
end if;
else
Ops.jump<='0';
Ops.memwrite<='0';
Ops.regwrite<='0';
Ops.memtoreg<='0';
Ops.alusrc<='0';
Ops.branch<='0';
Ops.regdest<='0';
 ops.ALUOp0 <= '0';
  ops.ALUOp1 <= '0';
end if;
end process ;



  STATE_MACHINE : process(clk, reset, procon,processor_enable)--press reset in order to start the first state which I have decided to be "Fetch"
  constant WIDTH: integer := 2;
  constant STALL : std_logic_vector(0 to WIDTH-1) := "00";
  constant EXECUTE : std_logic_vector(0 to WIDTH-1) := "01";
  constant FETCH  : std_logic_vector(0 to WIDTH-1) := "10";
  begin
  
  if(rising_edge(clk))then --could implement processor enable inside the statemachine also
  	if(reset='1') then
  		state<=FETCH;
  		else
  		case state is 
  			when FETCH=> state<=EXECUTE;
			 increment<='1'; --increment address by 1 unit. initiate when execute or stall is done
			 when STALL => if(processor_enable='1')then  state<=FETCH; end if;--. (after 1 cycle, go to fetch) stall means that we wont increment the adress. Make sure that this is a NOP-instruction
  			when EXECUTE=>increment<='0'; if(procon=LW or procon=SW  or procon=BEQ or procon=JMP)then state<=STALL; 
			else state<=FETCH; -- initiate after fetch, if instruction is store, load or branch, go to stall, else go to fetch.  After 1 cycle, go to fetch or stall.
			
  				end if;
			when others=>state<=STALL;
			increment<='0';
		end case;
  	end if;
  end if;
  end process;
end Behavioral;

