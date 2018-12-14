library ieee;
use ieee.std_logic_1164.all;
library work;
use work.eecs361.all;

Entity pc is
	port (
		A : in std_logic_vector(31 downto 0);
		reset : in std_logic;
		clk : in std_logic;
		result : out std_logic_vector(31 downto 0)
	);
end pc;

Architecture structural of pc is
	signal start : std_logic_vector(31 downto 0);
begin
	start <= X"00400020";
	buf_loop : for i in 0 to 31 generate
		g1 : entity work.dffr_a(behavioral)
			port map(clk, '0', reset, start(i), A(i), '1', result(i));
	end generate buf_loop;
end architecture structural;
