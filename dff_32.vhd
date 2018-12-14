library ieee;
use ieee.std_logic_1164.all;
library work;
use work.eecs361.all;
use work.and_gate;
use work.or_gate;
use work.not_gate;

Entity dff_32 is
	port (
		A : in std_logic_vector(31 downto 0);
		clk : in std_logic;
		reset : in std_logic;--active high
		wr : in std_logic;
		result : out std_logic_vector(31 downto 0)
	);
end dff_32;

Architecture structural of dff_32 is
	signal tmp_wr : std_logic;
	signal neg_reset : std_logic;
	signal tmp_D : std_logic_vector(31 downto 0);
	signal D : std_logic_vector(31 downto 0);
	signal Q : std_logic_vector(31 downto 0);
begin
	g0 : entity or_gate(dataflow)
		port map(wr, reset, tmp_wr);
	g1 : entity not_gate(dataflow)
		port map(reset, neg_reset);

	dff_loop : for i in 0 to 31 generate
		g2 : entity and_gate(dataflow)
			port map(A(i), neg_reset, tmp_D(i));
		g3 : entity work.mux(structural)
			port map(tmp_wr, Q(i), tmp_D(i), D(i));
		g4 : entity work.dff(behavioral)
			port map(clk, D(i), Q(i));
	end generate dff_loop;

	result <= Q;
end architecture structural;
