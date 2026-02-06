library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder6 is
    port(
        x0, x1, x2, x3, x4, x5 : in  std_logic_vector(3 downto 0);
        sum : out std_logic_vector(7 downto 0)
    );
end adder6;

architecture structural of adder6 is

    component bcd_fulladder
        port(
            A   : in  std_logic_vector(3 downto 0);
            B   : in  std_logic_vector(3 downto 0);
            ci  : in  std_logic;
            sum : out std_logic_vector(3 downto 0);
            co  : out std_logic
        );
    end component;

    component counter54
        port(
            c0, c1, c2, c3, c4 : in std_logic;
            y : out std_logic_vector(3 downto 0)
        );
    end component;

    signal s0, s1, s2, s3, s4 : std_logic_vector(3 downto 0);
    signal c1, c2, c3, c4, c5 : std_logic;
    signal carry_count : std_logic_vector(3 downto 0);

begin

    -- 一の位：BCD 加算器を５つ直列
    FA0: bcd_fulladder port map(x0, x1, '0', s0, c1);
    FA1: bcd_fulladder port map(s0, x2, '0', s1, c2);
    FA2: bcd_fulladder port map(s1, x3, '0', s2, c3);
    FA3: bcd_fulladder port map(s2, x4, '0', s3, c4);
    FA4: bcd_fulladder port map(s3, x5, '0', s4, c5);

    -- 5-4 カウンタ（十の位の基）
    CNT: counter54 port map(c1, c2, c3, c4, c5, carry_count);

    -- 十の位 BCD = carry_count をそのままBCD化
    sum(7 downto 4) <= carry_count;
    sum(3 downto 0) <= s4;

end structural;

