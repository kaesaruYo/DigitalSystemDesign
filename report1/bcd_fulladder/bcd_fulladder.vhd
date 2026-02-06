library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity bcd_fulladder is
    port(
        A   : in  std_logic_vector(3 downto 0);
        B   : in  std_logic_vector(3 downto 0);
        ci  : in  std_logic;
        sum : out std_logic_vector(3 downto 0);
        co  : out std_logic
    );
end bcd_fulladder;

architecture example of bcd_fulladder is
    signal tmp, sub : std_logic_vector(4 downto 0);
begin

    tmp <= ("0" & A) + ("0" & B) + ("0000" & ci);
    sub <= tmp - "01010";

    sum <= sub(3 downto 0) when sub(4) = '0'
           else tmp(3 downto 0);

    co  <= not sub(4);

end example;




