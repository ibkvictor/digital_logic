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
            -- for i in 0 to 7 loop
            --     (signal_a, signal_b, signal_c) <= std_logic_vector(to_unsigned(i, n));
            --     report "signal_a: " & std_logic'image(signal_a);
            --     report "signal_b: " & std_logic'image(signal_b);
            --     report "signal_c: " & std_logic'image(signal_c);
            --     wait for 10 ns;
            --     report "nothing";
            --     report "signal_f: " & std_logic'image(signal_f);
            --     if(signal_a, signal_b, signal_c, signal)
            -- end loop;

            signal_a <= '0'; signal_b <= '0'; signal_c <= '0'; wait for 50 ns;
            report "input pattern 000; signal_f: " & std_logic'image(signal_f) severity NOTE;

            signal_a <= '0'; signal_b <= '0'; signal_c <= '1'; wait for 50 ns;
            report "input pattern 001; signal_f: " & std_logic'image(signal_f) severity NOTE;

            signal_a <= '0'; signal_b <= '1'; signal_c <= '0'; wait for 50 ns;
            report "input pattern 010; signal_f: " & std_logic'image(signal_f) severity NOTE;
            assert (signal_f='1') report "FAILED" severity NOTE;

            signal_a <= '0'; signal_b <= '1'; signal_c <= '1'; wait for 50 ns;
            report "input pattern 011; signal_f: " & std_logic'image(signal_f) severity NOTE;

            signal_a <= '1'; signal_b <= '0'; signal_c <= '0'; wait for 50 ns;
            report "input pattern 100; signal_f: " & std_logic'image(signal_f) severity NOTE;

            signal_a <= '1'; signal_b <= '0'; signal_c <= '1'; wait for 50 ns;
            report "input pattern 101; signal_f: " & std_logic'image(signal_f) severity NOTE;

            signal_a <= '1'; signal_b <= '1'; signal_c <= '0'; wait for 50 ns;
            report "input pattern 110; signal_f: " & std_logic'image(signal_f) severity NOTE;

            signal_a <= '1'; signal_b <= '1'; signal_c <= '1'; wait for 50 ns;
            report "input pattern 111; signal_f: " & std_logic'image(signal_f) severity NOTE;

    end process;

end architecture;