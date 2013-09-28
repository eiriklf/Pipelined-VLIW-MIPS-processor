----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:50:21 09/23/2013 
-- Design Name: 
-- Module Name:    proc_control_module - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity proc_control_module is
    Port ( Opcode : in  STD_LOGIC_VECTOR (5 downto 0);
           clk : in STD_LOGIC;
           processor_enable : in STD_LOGIC;
           reset : in STD_LOGIC;
           RegDst : out STD_LOGIC;
           RegWrite : out STD_LOGIC;
           ALUSrc : out STD_LOGIC;
           MemtoReg : out STD_LOGIC;
           MemRead : out STD_LOGIC;
           MemWrite : out STD_LOGIC;
           ALUOp0 : out STD_LOGIC; -- this signal and the next one are to be worked on, they are meant to deal with branching
           ALUOp1 : out STD_LOGIC;
           Branch : out STD_LOGIC;
           state_vector : out STD_LOGIC_VECTOR(1 downto 0));
end proc_control_module;

architecture Behavioral of proc_control_module is
-- behavior to be implemented
   signal state : STD_LOGIC_VECTOR(1 downto 0);
begin

   asserting_output_signals : process(Opcode, reset)
   begin
      if (reset = '0') then
         case Opcode is
            when "000000" =>
               RegDst <= '1';
               ALUSrc <= '0';
               MemtoReg <= '0';
               RegWrite <= '1';
               MemRead <= '0';
               MemWrite <= '0';
               Branch <= '0';
               ALUOp1 <= '1';
               ALUOp0 <= '0';
             when "100011" =>
               RegDst <= '0';
               ALUSrc <= '1';
               MemtoReg <= '1';
               RegWrite <= '1';
               MemRead <= '1';
               MemWrite <= '0';
               Branch <= '0';
               ALUOp1 <= '0';
               ALUOp0 <= '0';
              when "101011" =>
               ALUSrc <= '1';
               RegWrite <= '0';
               MemRead <= '0';
               MemWrite <= '1';
               Branch <= '0';
               ALUOp1 <= '0';
               ALUOp0 <= '0';
              when "000100" =>
               ALUSrc <= '0';
               RegWrite <= '0';
               MemRead <= '0';
               MemWrite <= '0';
               Branch <= '1';
               ALUOp1 <= '0';
               ALUOp0 <= '1';
              when others =>
               ALUSrc <= '1';
               RegWrite <= '1';
               MemRead <= '1';
               MemWrite <= '1';
               Branch <= '1';
               ALUOp1 <= '1';
               ALUOp0 <= '1';
               --nothing
           end case;
          else
             RegDst <= '0';
               ALUSrc <= '0';
               MemtoReg <= '0';
               RegWrite <= '0';
               MemRead <= '0';
               MemWrite <= '0';
               Branch <= '0';
               ALUOp1 <= '0';
               ALUOp0 <= '0';
          end if;
            
   end process;

   STATE_MACHINE : process(clk, reset, processor_enable)--press reset in order to start the first state which I have decided to be "Fetch"
     constant WIDTH: integer := 2;
     constant STALL : std_logic_vector(WIDTH-1 downto 0) := "00";
     constant EXECUTE : std_logic_vector(WIDTH-1 downto 0) := "01";
     constant FETCH  : std_logic_vector(WIDTH-1 downto 0) := "10";
     begin
     
     if(rising_edge(clk) and processor_enable='1')then --WILL FIX IT TO TAKE BRANCHING INTO ACCOUNT, FEDOR
         if(reset='1') then
            state<=FETCH;
         else
            case state is 
               when FETCH=> 
                  state<=EXECUTE;
--                increment<='1'; --increment address by 1 unit. initiate when execute or stall is done
               when STALL => 
                  state<=FETCH;--. (after 1 cycle, go to fetch) stall means that we wont increment the adress. Make sure that this is a NOP-instruction
               when EXECUTE=> 
                  state<=STALL;
--                  if(MemWrite='1' or MemRead='1' or branch='1' or jump='1')then 
--                     state<=STALL; 
--                  else 
--                     state<=FETCH; -- initiate after fetch, if instruction is store, load or branch, go to stall, else go to fetch.  After 1 cycle, go to fetch or stall.
--                  end if;
               when others=>
                  state<=STALL;
--                  increment<='0';
            end case;
         end if;
         state_vector <= state;
     end if;
    end process;

end Behavioral;
