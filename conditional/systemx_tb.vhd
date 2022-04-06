library IEEE;
use ieee.std_logic_1164.all; -- contains std_logic data types
use IEEE.numeric_std.all; -- contains function like "to_unsigned"

entity systemx_tb is
    -- empty for testbenches
end entity;

architecture systemx_arch_tb of systemx_tb is
    component systemx is
        port (A, B, C : in std_logic;
            F : out std_logic);
    end component;

    signal signal_a, signal_b, signal_c, signal_f : std_logic;
    constant n : integer:= 3;

    begin
        comp : systemx port map (
            A => signal_a,
            B => signal_b,
            C => signal_c,
            F => signal_f
        );
    process
        variable i : integer;
        begin
            for i in 0 to 7 loop
                (signal_a,signal_b,signal_c) <= std_logic_vector(to_unsigned(i, n));
                report "signal_a: " & std_logic'image(signal_a);
                report "signal_b: " & std_logic'image(signal_b);
                report "signal_c: " & std_logic'image(signal_c);
                wait for 1 ns;
                report "nothing";
                report "signal_f: " & std_logic'image(signal_f);
            end loop;
    end process;

end architecture;