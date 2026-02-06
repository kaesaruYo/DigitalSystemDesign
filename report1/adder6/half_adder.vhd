library ieee;
use ieee.std_logic_1164.all;

entity half_adder is --FA用の半加算器本体
    port(
        a, b : in  std_logic;
        c, s : out std_logic
    );
end half_adder;

architecture structural of half_adder is
begin
    s <= a xor b;  -- sum
    c <= a and b;  -- carry
end structural;
