
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity simple_multiplexer is
--defined to be generic in order to be able to reuse this with custom input and output length
    generic (N :NATURAL);
   Port ( a : in  STD_LOGIC_VECTOR (N-1 downto 0);
                b : in  STD_LOGIC_VECTOR (N-1 downto 0);
                control_signal : in  STD_LOGIC;
                output : out  STD_LOGIC_VECTOR (N-1 downto 0));
end simple_multiplexer;

architecture Behavioral of simple_multiplexer is

begin
    output <= b when control_signal = '1' else
                a;

end Behavioral;
