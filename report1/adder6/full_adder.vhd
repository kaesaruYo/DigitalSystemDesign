library ieee;
use ieee.std_logic_1164.all;

entity full_adder is --FA本体(5-4 Counter用)
    port(
        a, b, cin : in  std_logic;
        c, s      : out std_logic
    );
end full_adder;

architecture structural of full_adder is

    component half_adder
        port(
            a, b : in  std_logic;
            c, s : out std_logic
        );
    end component;

    signal c1, s1, c2 : std_logic;

begin
    HA1 : half_adder
        port map (
            a => a,
            b => b,
            s => s1,
            c => c1
        );

    HA2 : half_adder
        port map (
            a => s1,
            b => cin,
            s => s,
            c => c2
        );

    c <= c1 or c2;

end structural;
