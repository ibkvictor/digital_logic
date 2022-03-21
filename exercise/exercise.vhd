entity ProficientEx is
    port (
        X, Y, Z : in bit;
        F       : out bit
    );
end entity;

architecture sys of ProficientEx is
    begin
        F <= (((not X) and (not Y) and Z) or (X and (not Y) and Z) or (X and Y and Z));
end architecture;