library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity datapath is
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
end datapath;

architecture rtl of datapath is
    signal rq       : unsigned(7 downto 0);
    signal rr       : unsigned(7 downto 0);
    signal dd       : unsigned(7 downto 0);
    signal done_reg : std_logic;
begin
    q <= std_logic_vector(rq);
    r <= std_logic_vector(rr);
    done_dp <= done_reg;

    process(clk, rst)
    begin
        if rst = '1' then
            rq <= (others => '0');
            rr <= (others => '0');
            dd <= (others => '0');
            done_reg <= '0';

        elsif rising_edge(clk) then
            if load = '1' then
                rq <= (others => '0');
                rr <= unsigned(z);
                dd <= unsigned(d);
                done_reg <= '0';

            elsif step = '1' and done_reg = '0' then
                if rr >= dd then
                    rr <= rr - dd;
                    rq <= rq + 1;
                else
                    done_reg <= '1';  -- 完了で保持
                end if;
            end if;
        end if;
    end process;
end rtl;















