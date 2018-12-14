library ieee;
use ieee.std_logic_1164.all;
library work;
use work.eecs361_gates.all;
use work.add_1;

entity add_32 is
	port (
		A : in std_logic_vector(31 downto 0);
		B : in std_logic_vector(31 downto 0);
		sum : out std_logic_vector(31 downto 0)
	);
end add_32;

architecture structural of add_32 is
	signal tmp_carry : std_logic_vector(31 downto 0);
begin
	g0 : entity add_1(structural)
		port map(A(0), B(0), '0', sum(0), tmp_carry(0));
	add_loop : for i in 1 to 30 generate
		g1 : entity add_1(structural)
			port map(A(i), B(i), tmp_carry(i-1), sum(i), tmp_carry(i));
	end generate add_loop;
	g2 : entity add_1(structural)
		port map(A(31), B(31), tmp_carry(30), sum(31), open);
end architecture structural;
		
		
