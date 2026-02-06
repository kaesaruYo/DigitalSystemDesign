library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter54 is
    port(
        c0, c1, c2, c3, c4 : in std_logic;
        y : out std_logic_vector(3 downto 0)
    );
end counter54;

architecture rtl of counter54 is
    signal cnt : integer range 0 to 5;
begin
    process(c0,c1,c2,c3,c4)
        variable v : integer := 0;
    begin
        v := 0;
        if c0 = '1' then v := v + 1; end if;
        if c1 = '1' then v := v + 1; end if;
        if c2 = '1' then v := v + 1; end if;
        if c3 = '1' then v := v + 1; end if;
        if c4 = '1' then v := v + 1; end if;

        cnt <= v;
        y <= std_logic_vector(to_unsigned(v,4));
    end process;
end rtl;

