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
           Ops : out ProOP);
end control;

architecture Behavioral of control is
type ProOP is (jump,memwrite,regwrite,memtoreg,alusrc,branch,regdest);
begin

process 

constant JMP  : std_logic_vector(5 downto 0 ) := "000010";
constant LW  : std_logic_vector(5 downto 0 ) := "100011";
constant SW  : std_logic_vector(5 downto 0 ) := "101011";
constant LUI  : std_logic_vector(5 downto 0 ) := "001111";
constant BEQ  : std_logic_vector(5 downto 0 ) := "000100";
constant ALUOP  : std_logic_vector(5 downto 0 ) := "000000";
begin

if(procon=JMP) then
Ops.jump<='1';
Ops.memwrite<='0';
Ops.regwrite<='0';
Ops.memtoreg<='0';
Ops.alusrc<='0';
Ops.branch<='0';
Ops.regdest<='0';
elsif(procon=SW) then
Ops.jump<='0';
Ops.memwrite<='1';
Ops.regwrite<='0';
Ops.memtoreg<='0';
Ops.alusrc<='0';
Ops.branch<='0';
Ops.regdest<='0';
elsif(procon=LW) then
Ops.jump<='0';
Ops.memwrite<='0';
Ops.regwrite<='1';
Ops.memtoreg<='1';
Ops.alusrc<='0';
Ops.branch<='0';
Ops.regdest<='0';
elsif(procon=LUI)then
Ops.jump<='0';
Ops.memwrite<='0';
Ops.regwrite<='0';
Ops.memtoreg<='0';
Ops.alusrc<='1';
Ops.branch<='0';
Ops.regdest<='0';
elsif(procon=BEQ)then
Ops.jump<='0';
Ops.memwrite<='0';
Ops.regwrite<='0';
Ops.memtoreg<='0';
Ops.alusrc<='0';
Ops.branch<='1';
Ops.regdest<='0';
elsif(procon=ALUOP)then
Ops.jump<='0';
Ops.memwrite<='0';
Ops.regwrite<='0';
Ops.memtoreg<='0';
Ops.alusrc<='0';
Ops.branch<='0';
Ops.regdest<='1';

else
Ops.jump<='0';
Ops.memwrite<='0';
Ops.regwrite<='0';
Ops.memtoreg<='0';
Ops.alusrc<='0';
Ops.branch<='0';
Ops.regdest<='0';
end if;
end process;

end Behavioral;

