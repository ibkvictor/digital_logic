entity systemAND3 is
	port( 
		A, B, C : in bit;
		F	: out bit);
end entity;

architecture systemAND3_arch of systemAND3 is
	begin
		F <= A and B and C;
end architecture;