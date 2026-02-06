library ieee;
use ieee.std_logic_1164.all;

entity test_bcd_fa is
end test_bcd_fa;

architecture sim of test_bcd_fa is

    component bcd_fulladder
        port (
            A   : in  std_logic_vector(3 downto 0);
            B   : in  std_logic_vector(3 downto 0);
            ci  : in  std_logic;
            sum : out std_logic_vector(3 downto 0);
            co  : out std_logic
        );
    end component;

    signal A, B : std_logic_vector(3 downto 0);
    signal ci   : std_logic;
    signal sum  : std_logic_vector(3 downto 0);
    signal co   : std_logic;

begin

    UUT : bcd_fulladder
        port map (A => A, B => B, ci => ci, sum => sum, co => co);

    process
    begin
        -- 0 + 0
        A <= "0000"; B <= "0000"; ci <= '0';
        wait for 100 ns;

        -- 5 + 3 = 8
        A <= "0101"; B <= "0011"; ci <= '0';
        wait for 100 ns;

        -- 7 + 9 = 16 → sum = 6, co = 1
        A <= "0111"; B <= "1001"; ci <= '0';
        wait for 100 ns;

        -- 9 + 9 + 1 = 19 → sum = 9, co = 1
        A <= "1001"; B <= "1001"; ci <= '1';
        wait for 100 ns;

        wait; 
    end process;

end sim;


configuration cfg_test_bcd_fa of test_bcd_fa is
    for sim
    end for;
end cfg_test_bcd_fa;
