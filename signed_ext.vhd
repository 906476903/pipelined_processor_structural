library ieee;
use ieee.std_logic_1164.all;
library work;
use work.eecs361.all;

Entity signed_ext is
	port (
		A : in std_logic_vector(15 downto 0);
		result : out std_logic_vector(31 downto 0)
	);
end signed_ext;

Architecture structural of signed_ext is
	signal extend : std_logic;
begin
	g0 : entity work.or_gate(dataflow)
		port map(A(15), '0', extend);

	buf_loop : for i in 16 to 31 generate
		g1 : entity work.or_gate(dataflow)
			port map(extend, '0', result(i));
	end generate buf_loop;

	result(15 downto 0) <= A(15 downto 0);
end architecture structural;
