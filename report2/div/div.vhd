library ieee;
use ieee.std_logic_1164.all;

entity div is
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
end div;

architecture rtl of div is
    signal load_s  : std_logic;
    signal step_s  : std_logic;
    signal done_dp : std_logic;

    component controller
        port(
            clk     : in  std_logic;
            rst     : in  std_logic;
            start   : in  std_logic;
            done_dp : in  std_logic;
            load    : out std_logic;
            step    : out std_logic
        );
    end component;

    component datapath
        port(
            clk     : in  std_logic;
            rst     : in  std_logic;
            load    : in  std_logic;
            step    : in  std_logic;
            z       : in  std_logic_vector(7 downto 0);
            d       : in  std_logic_vector(7 downto 0);
            q       : out std_logic_vector(7 downto 0);
            r       : out std_logic_vector(7 downto 0);
            done_dp : out std_logic
        );
    end component;
begin
    U_CTRL : controller
        port map(
            clk     => clk,
            rst     => rst,
            start   => start,
            done_dp => done_dp,
            load    => load_s,
            step    => step_s
        );

    U_DP : datapath
        port map(
            clk     => clk,
            rst     => rst,
            load    => load_s,
            step    => step_s,
            z       => z,
            d       => d,
            q       => q,
            r       => r,
            done_dp => done_dp
        );

    done <= done_dp;  -- 直結させる
end rtl;







