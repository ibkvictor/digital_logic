entity prac1_tb is
    --test bench has no ports
end prac1_tb;

architecture behavior of prac1_tb is
    component prac1 is
        port (
            A, B, C : in bit;
            F	: out bit
        );
    end component;

    --  Specifies which entity is bound with the component.
    for prac_0: prac1 use entity work.prac1;
    signal A, B, C, F : bit;
 begin
    --  Component instantiation.
    prac_0: prac1 port map (A => A, B => B, C => C,
                            F => F);
 
    --  This process does the real job.
    process
       type pattern_type is record
          --  The inputs of the adder.
          A, B, C : bit;
          --  The expected outputs of the adder.
          F : bit;
       end record;
       --  The patterns to apply.
       type pattern_array is array (natural range <>) of pattern_type;
       constant patterns : pattern_array :=
         (('0', '0', '0', '0'),
          ('0', '0', '1', '0'),
          ('0', '1', '0', '0'),
          ('0', '1', '1', '0'),
          ('1', '0', '0', '0'),
          ('1', '0', '1', '0'),
          ('1', '1', '0', '0'),
          ('1', '1', '1', '1'));
    begin
       --  Check each pattern.
       for i in patterns'range loop
          --  Set the inputs.
          A <= patterns(i).A;
          B <= patterns(i).B;
          C <= patterns(i).C;
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

end architecture; -- the behaviour of the adder
