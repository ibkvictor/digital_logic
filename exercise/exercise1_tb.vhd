entity ProficientEx_tb is
    --tesbed does not have ports
end entity;

architecture system of ProficientEx_tb is
    component ProficientEx is
        port (
            X, Y, Z : in bit;
            F       : out bit
        );
    end component;

    --  Specifies which entity is bound with the component.
    for prac_0: ProficientEx use entity work.ProficientEx;
    signal X, Y, Z, F : bit;
    begin
    --  Component instantiation.
    prac_0: ProficientEx port map (X => X, Y => X, Z => X,
                            F => F);

    --  This process does the real job.
    process
    type pattern_type is record
        --  The inputs of the adder.
        X, Y, Z : bit;
        --  The expected outputs of the adder.
        F : bit;
    end record;
    --  The patterns to apply.
    type pattern_array is array (natural range <>) of pattern_type;
    constant patterns : pattern_array :=
        (('0', '0', '0', '0'),
        ('0', '0', '1', '1'),
        ('0', '1', '0', '0'),
        ('0', '1', '1', '0'),
        ('1', '0', '0', '0'),
        ('1', '0', '1', '1'),
        ('1', '1', '0', '0'),
        ('1', '1', '1', '1'));
    begin
    --  Check each pattern.
    for i in patterns'range loop
        --  Set the inputs.
        X <= patterns(i).X;
        Y <= patterns(i).Y;
        Z <= patterns(i).Z;
        --  Wait for the results.
        wait for 1 ns;
        --  Check the outputs.
        assert F = patterns(i).F
            report "bad sum value" severity error;
    end loop;
    assert false report "end of test" severity note;
    --  Wait forever; this will finish the simulation.
    wait;
    end process;

end architecture;