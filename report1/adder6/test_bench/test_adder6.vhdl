library ieee;
use ieee.std_logic_1164.all;

entity test_adder6 is
end test_adder6;

architecture tb of test_adder6 is

    component adder6
        port(
            x0, x1, x2, x3, x4, x5 : in  std_logic_vector(3 downto 0);
            sum : out std_logic_vector(7 downto 0)
        );
    end component;

    signal x0, x1, x2, x3, x4, x5 : std_logic_vector(3 downto 0) := (others => '0');
    signal sum : std_logic_vector(7 downto 0);

begin

    U0 : adder6
        port map(
            x0 => x0, x1 => x1, x2 => x2,
            x3 => x3, x4 => x4, x5 => x5,
            sum => sum
        );

    stim_proc : process
    begin
        ----------------------------------------
        -- 0+0+0+0+0+0 = 0 
        ----------------------------------------
        x0 <= "0000"; x1 <= "0000"; x2 <= "0000";
        x3 <= "0000"; x4 <= "0000"; x5 <= "0000";
        wait for 50 ns;

        ----------------------------------------
        -- 1+2+3+4+5+6 = 21 → 0010 0001
        ----------------------------------------
        x0 <= "0001"; x1 <= "0010"; x2 <= "0011";
        x3 <= "0100"; x4 <= "0101"; x5 <= "0110";
        wait for 50 ns;

        ----------------------------------------
        -- 9+9+9+9+9+9 = 54 → 0101 0100
        ----------------------------------------
        x0 <= "1001"; x1 <= "1001"; x2 <= "1001";
        x3 <= "1001"; x4 <= "1001"; x5 <= "1001";
        wait for 50 ns;

        ----------------------------------------
        -- 7+0+2+9+1+3 = 22 → 0010 0010
        ----------------------------------------
        x0 <= "0111"; x1 <= "0000"; x2 <= "0010";
        x3 <= "1001"; x4 <= "0001"; x5 <= "0011";
        wait for 50 ns;

        wait;
    end process;

end tb;

configuration cfg_test_adder6 of test_adder6 is
    for tb
        for U0 : adder6
            use entity work.adder6(structural);
        end for;
    end for;
end cfg_test_adder6;


