library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity bcd_4adder is
    port(
        A   : in  std_logic_vector(15 downto 0);  -- 4桁のBCD入力
        B   : in  std_logic_vector(15 downto 0);
        SUM : out std_logic_vector(19 downto 0)   -- 5桁のBCD出力
    );
end bcd_4adder;

architecture structural of bcd_4adder is

    component bcd_fulladder
        port(
            A   : in  std_logic_vector(3 downto 0);
            B   : in  std_logic_vector(3 downto 0);
            ci  : in  std_logic;
            sum : out std_logic_vector(3 downto 0);
            co  : out std_logic
        );
    end component;

    signal c1, c2, c3, c4 : std_logic;
    signal s0, s1, s2, s3 : std_logic_vector(3 downto 0);

begin

    -- 1桁目（最下位）
    FA0: bcd_fulladder port map(
            A(3 downto 0), B(3 downto 0), '0', s0, c1);

    -- 2桁目
    FA1: bcd_fulladder port map(
            A(7 downto 4), B(7 downto 4), c1, s1, c2);

    -- 3桁目
    FA2: bcd_fulladder port map(
            A(11 downto 8), B(11 downto 8), c2, s2, c3);

    -- 4桁目（最上位）
    FA3: bcd_fulladder port map(
            A(15 downto 12), B(15 downto 12), c3, s3, c4);

    -- 出力（5桁分）
    SUM <= ("000" & c4) & s3 & s2 & s1 & s0;

end structural;
