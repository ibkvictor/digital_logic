entity adder is
    port(
        i0  : in bit;
        i1  : in bit;
        ci  : in bit;
        s   : out bit;
        co  : out bit
    );
end entity;

architecture rtl of adder is
    begin
        s <= i0 xnor i1 xnor ci;
        co <= (i0 and i1) or (i0 and ci) or (i1 and ci);
end architecture;