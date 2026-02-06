library ieee;
use ieee.std_logic_1164.all;

entity controller is
    port(
        clk     : in  std_logic;
        rst     : in  std_logic;
        start   : in  std_logic;
        done_dp : in  std_logic;
        load    : out std_logic;
        step    : out std_logic
    );
end controller;

architecture rtl of controller is
    type state_t is (IDLE, RUN, FINISH);
    signal state : state_t;
begin
    process(clk, rst)
    begin
        if rst = '1' then
            state <= IDLE;
        elsif rising_edge(clk) then
            case state is
                when IDLE =>
                    if start = '1' then
                        state <= RUN;
                    end if;

                when RUN =>
                    if done_dp = '1' then
                        state <= FINISH;   -- 完了で必ず止める
                    end if;

                when FINISH =>
                    if start = '0' then
                        state <= IDLE;     -- 次の計算待ち
                    end if;
            end case;
        end if;
    end process;

    load <= '1' when (state = IDLE and start = '1') else '0';
    step <= '1' when (state = RUN) else '0';
end rtl;








