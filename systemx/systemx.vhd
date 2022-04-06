library IEEE;
use ieee.std_logic_1164.all;

entity systemx is
    port (A, B, C : in std_logic;
        F : out std_logic);
end entity;

architecture systemx_arch of systemx is

    begin
        -- naming process cmb1
        cmb1 : process (A, B, C)
            
            begin
                if   (A = '0' and B = '1' and C = '0') then F <= '1';
                elsif   (A = '1' and B = '0' and C = '0') then F <= '1';
                elsif   (A = '1' and B = '1' and C = '1') then F <= '1';
                else    F <= '0';
                end if;
        end process;

end architecture;