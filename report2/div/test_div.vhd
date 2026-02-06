library ieee;
use ieee.std_logic_1164.all;

entity test_div is
end test_div;

architecture sim of test_div is
    component div
        port(
            clk   : in  std_logic;
            rst   : in  std_logic;
            start : in  std_logic;
            z     : in  std_logic_vector(7 downto 0);
            d     : in  std_logic_vector(7 downto 0);
            q     : out std_logic_vector(7 downto 0);
            r     : out std_logic_vector(7 downto 0);
            done  : out std_logic
        );
    end component;

    signal clk   : std_logic := '0';
    signal rst   : std_logic := '0';
    signal start : std_logic := '0';
    signal z     : std_logic_vector(7 downto 0);
    signal d     : std_logic_vector(7 downto 0);
    signal q     : std_logic_vector(7 downto 0);
    signal r     : std_logic_vector(7 downto 0);
    signal done  : std_logic;

    constant Tclk : time := 20 ns;
begin
    clk <= not clk after Tclk/2;

    UUT : div
        port map(
            clk   => clk,
            rst   => rst,
            start => start,
            z     => z,
            d     => d,
            q     => q,
            r     => r,
            done  => done
        );

    process
    begin
        rst <= '1';
        start <= '0';
        z <= (others=>'0');
        d <= (others=>'0');
        wait for Tclk;

        rst <= '0';
        wait for Tclk;

        z <= "01111011"; -- 123
        d <= "00101101"; -- 45

        start <= '1';           -- 計算中ずっと1
        wait until done = '1';  -- 終点
        start <= '0';

        wait for 3*Tclk;
        wait;
    end process;
end sim;

configuration cfg_test_div of test_div is
    for sim
        for UUT : div
            use entity work.div(rtl);
        end for;
    end for;
end cfg_test_div;


