entity prac1 is
	port( 
		A, B, C : in bit;
		F	: out bit
		);
end entity;

architecture systemAND3_arch of prac1 is
	begin
		F <= A and B and C;
end architecture;