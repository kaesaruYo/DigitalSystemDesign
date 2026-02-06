library ieee;
use ieee.std_logic_1164.all;

entity test_bcd_4adder is
end test_bcd_4adder;

architecture test of test_bcd_4adder is

    component bcd_4adder
        port(
            A   : in  std_logic_vector(15 downto 0);
            B   : in  std_logic_vector(15 downto 0);
            SUM : out std_logic_vector(19 downto 0)
        );
    end component;

    signal A   : std_logic_vector(15 downto 0);
    signal B   : std_logic_vector(15 downto 0);
    signal SUM : std_logic_vector(19 downto 0);

begin

    U0: bcd_4adder port map(A, B, SUM);

    process
    begin

        -- 12 + 34 = 46
        A <= "0000" & "0010" & "0001" & "0010"; -- 12
        B <= "0000" & "0000" & "0011" & "0100"; -- 34
        wait for 100 ns;

        -- 99 + 99 = 198
        A <= "0000" & "0000" & "1001" & "1001"; -- 99
        B <= "0000" & "0000" & "1001" & "1001"; -- 99
        wait for 100 ns;

        -- 1234 + 5678 = 6912
        A <= "0001" & "0010" & "0011" & "0100"; -- 1234
        B <= "0101" & "0110" & "0111" & "1000"; -- 5678
        wait for 100 ns;

        -- 9999 + 9999 = 19998
        A <= "1001" & "1001" & "1001" & "1001";
        B <= "1001" & "1001" & "1001" & "1001";
        wait for 100 ns;

        wait;
    end process;

end test;

configuration cfg_test_bcd_4adder of test_bcd_4adder is
    for test
        for U0 : bcd_4adder
            use entity work.bcd_4adder(structural);
        end for;
    end for;
end cfg_test_bcd_4adder;
