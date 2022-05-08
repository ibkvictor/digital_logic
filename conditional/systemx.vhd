library IEEE;
use ieee.std_logic_1164.all; -- contains std_logic data types
use IEEE.numeric_std.all; -- contains function like "to_unsigned"

entity systemx is
    port (A, B, C : in std_logic;
        F : out std_logic);
end entity;

architecture systemx_arch of systemx is

    begin
        -- trigger process is assigned
        cmb1 : process (A, B, C) is

            -- define variable here
            variable ABC : std_logic_vector(2 downto 0) := "000";

            begin
                -- concatenate
                ABC := A & B & C;

                case (ABC) is
                    when "010" => F <= '1';
                    when "101" => F <= '1';
                    when "110" => F <= '1';
                    when others => F <= '0';
                end case;


        end process;

end architecture; -- systemx_arch