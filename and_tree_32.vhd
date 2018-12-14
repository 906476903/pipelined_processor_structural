library ieee;
use ieee.std_logic_1164.all;
library work;
use work.and_gate;

Entity and_tree_32 is
	port (
		A : in std_logic_vector(31 downto 0);
		z : out std_logic
	);
end and_tree_32;

Architecture structural of and_tree_32 is
	signal inter0 : std_logic_vector(15 downto 0);
	signal inter1 : std_logic_vector(7 downto 0);
	signal inter2 : std_logic_vector(3 downto 0);
	signal inter3 : std_logic_vector(1 downto 0);
begin
	g0 : entity and_gate(dataflow)
		port map(A(0), A(1), inter0(0));
	g1 : entity and_gate(dataflow)
		port map(A(2), A(3), inter0(1));
	g2 : entity and_gate(dataflow)
		port map(A(4), A(5), inter0(2));
	g3 : entity and_gate(dataflow)
		port map(A(6), A(7), inter0(3));
	g4 : entity and_gate(dataflow)
		port map(A(8), A(9), inter0(4));
	g5 : entity and_gate(dataflow)
		port map(A(10), A(11), inter0(5));
	g6 : entity and_gate(dataflow)
		port map(A(12), A(13), inter0(6));
	g7 : entity and_gate(dataflow)
		port map(A(14), A(15), inter0(7));
	g8 : entity and_gate(dataflow)
		port map(A(16), A(17), inter0(8));
	g9 : entity and_gate(dataflow)
		port map(A(18), A(19), inter0(9));
	g10 : entity and_gate(dataflow)
		port map(A(20), A(21), inter0(10));
	g11 : entity and_gate(dataflow)
		port map(A(22), A(23), inter0(11));
	g12 : entity and_gate(dataflow)
		port map(A(24), A(25), inter0(12));
	g13 : entity and_gate(dataflow)
		port map(A(26), A(27), inter0(13));
	g14 : entity and_gate(dataflow)
		port map(A(28), A(29), inter0(14));
	g15 : entity and_gate(dataflow)
		port map(A(30), A(31), inter0(15));
	g16 : entity and_gate(dataflow)
		port map(inter0(0), inter0(1), inter1(0));
	g17 : entity and_gate(dataflow)
		port map(inter0(2), inter0(3), inter1(1));
	g18 : entity and_gate(dataflow)
		port map(inter0(4), inter0(5), inter1(2));
	g19 : entity and_gate(dataflow)
		port map(inter0(6), inter0(7), inter1(3));
	g20 : entity and_gate(dataflow)
		port map(inter0(8), inter0(9), inter1(4));
	g21 : entity and_gate(dataflow)
		port map(inter0(10), inter0(11), inter1(5));
	g22 : entity and_gate(dataflow)
		port map(inter0(12), inter0(13), inter1(6));
	g23 : entity and_gate(dataflow)
		port map(inter0(14), inter0(15), inter1(7));
	g24 : entity and_gate(dataflow)
		port map(inter1(0), inter1(1), inter2(0));
	g25 : entity and_gate(dataflow)
		port map(inter1(2), inter1(3), inter2(1));
	g26 : entity and_gate(dataflow)
		port map(inter1(4), inter1(5), inter2(2));
	g27 : entity and_gate(dataflow)
		port map(inter1(6), inter1(7), inter2(3));
	g28 : entity and_gate(dataflow)
		port map(inter2(0), inter2(1), inter3(0));
	g29 : entity and_gate(dataflow)
		port map(inter2(2), inter2(3), inter3(1));
	g30 : entity and_gate(dataflow)
		port map(inter3(0), inter3(1), z);
end architecture structural;

		
		
