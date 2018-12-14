library ieee;
use ieee.std_logic_1164.all;
library work;
use work.alu_1;
use work.sll_32;
use work.mux_8_1;
use work.mux_8_1_32;
use work.mux_32;
use work.and_tree_32;
use work.xor_gate;
use work.not_gate_32;

Entity alu_32 is
	port (
		A : in std_logic_vector(31 downto 0);
		B : in std_logic_vector(31 downto 0);
		control : in std_logic_vector(3 downto 0);
		carryout : out std_logic;
		overflow : out std_logic;
		zero : out std_logic;
		result : out std_logic_vector(31 downto 0)
	);
end alu_32;

-- add : 0000
-- sub : 0001
-- and : 0100
-- xor : 0101
-- or : 0110
-- sll : 0111
-- slt  : 0010
-- sltu : 0011

Architecture structural of alu_32 is
	signal invert : std_logic;
	signal B_neg, B_out : std_logic_vector(31 downto 0);
	signal tmp_carryout : std_logic_vector(31 downto 0);
	signal tmp_alu, tmp_slt, tmp_sltu, tmp_sll : std_logic_vector(31 downto 0);
	signal neg_tmp_alu : std_logic_vector(31 downto 0);
begin
	g0 : entity mux_8_1(structural)
		port map(control(2 downto 0), '0', '1', '1', '1', '0', '0', '0', '0', invert);
	g1 : entity not_gate_32(dataflow)
		port map(B, B_neg);
	g2 : entity mux_32(structural)
		port map(invert, B, B_neg, B_out);

	a0 : entity alu_1(structural)
		port map(A(0), B_out(0), invert, control(2 downto 0), tmp_carryout(0), tmp_alu(0));
	a1 : entity alu_1(structural)
		port map(A(1), B_out(1), tmp_carryout(0), control(2 downto 0), tmp_carryout(1), tmp_alu(1));
	a2 : entity alu_1(structural)
		port map(A(2), B_out(2), tmp_carryout(1), control(2 downto 0), tmp_carryout(2), tmp_alu(2));
	a3 : entity alu_1(structural)
		port map(A(3), B_out(3), tmp_carryout(2), control(2 downto 0), tmp_carryout(3), tmp_alu(3));
	a4 : entity alu_1(structural)
		port map(A(4), B_out(4), tmp_carryout(3), control(2 downto 0), tmp_carryout(4), tmp_alu(4));
	a5 : entity alu_1(structural)
		port map(A(5), B_out(5), tmp_carryout(4), control(2 downto 0), tmp_carryout(5), tmp_alu(5));
	a6 : entity alu_1(structural)
		port map(A(6), B_out(6), tmp_carryout(5), control(2 downto 0), tmp_carryout(6), tmp_alu(6));
	a7 : entity alu_1(structural)
		port map(A(7), B_out(7), tmp_carryout(6), control(2 downto 0), tmp_carryout(7), tmp_alu(7));
	a8 : entity alu_1(structural)
		port map(A(8), B_out(8), tmp_carryout(7), control(2 downto 0), tmp_carryout(8), tmp_alu(8));
	a9 : entity alu_1(structural)
		port map(A(9), B_out(9), tmp_carryout(8), control(2 downto 0), tmp_carryout(9), tmp_alu(9));
	a10 : entity alu_1(structural)
		port map(A(10), B_out(10), tmp_carryout(9), control(2 downto 0), tmp_carryout(10), tmp_alu(10));
	a11 : entity alu_1(structural)
		port map(A(11), B_out(11), tmp_carryout(10), control(2 downto 0), tmp_carryout(11), tmp_alu(11));
	a12 : entity alu_1(structural)
		port map(A(12), B_out(12), tmp_carryout(11), control(2 downto 0), tmp_carryout(12), tmp_alu(12));
	a13 : entity alu_1(structural)
		port map(A(13), B_out(13), tmp_carryout(12), control(2 downto 0), tmp_carryout(13), tmp_alu(13));
	a14 : entity alu_1(structural)
		port map(A(14), B_out(14), tmp_carryout(13), control(2 downto 0), tmp_carryout(14), tmp_alu(14));
	a15 : entity alu_1(structural)
		port map(A(15), B_out(15), tmp_carryout(14), control(2 downto 0), tmp_carryout(15), tmp_alu(15));
	a16 : entity alu_1(structural)
		port map(A(16), B_out(16), tmp_carryout(15), control(2 downto 0), tmp_carryout(16), tmp_alu(16));
	a17 : entity alu_1(structural)
		port map(A(17), B_out(17), tmp_carryout(16), control(2 downto 0), tmp_carryout(17), tmp_alu(17));
	a18 : entity alu_1(structural)
		port map(A(18), B_out(18), tmp_carryout(17), control(2 downto 0), tmp_carryout(18), tmp_alu(18));
	a19 : entity alu_1(structural)
		port map(A(19), B_out(19), tmp_carryout(18), control(2 downto 0), tmp_carryout(19), tmp_alu(19));
	a20 : entity alu_1(structural)
		port map(A(20), B_out(20), tmp_carryout(19), control(2 downto 0), tmp_carryout(20), tmp_alu(20));
	a21 : entity alu_1(structural)
		port map(A(21), B_out(21), tmp_carryout(20), control(2 downto 0), tmp_carryout(21), tmp_alu(21));
	a22 : entity alu_1(structural)
		port map(A(22), B_out(22), tmp_carryout(21), control(2 downto 0), tmp_carryout(22), tmp_alu(22));
	a23 : entity alu_1(structural)
		port map(A(23), B_out(23), tmp_carryout(22), control(2 downto 0), tmp_carryout(23), tmp_alu(23));
	a24 : entity alu_1(structural)
		port map(A(24), B_out(24), tmp_carryout(23), control(2 downto 0), tmp_carryout(24), tmp_alu(24));
	a25 : entity alu_1(structural)
		port map(A(25), B_out(25), tmp_carryout(24), control(2 downto 0), tmp_carryout(25), tmp_alu(25));
	a26 : entity alu_1(structural)
		port map(A(26), B_out(26), tmp_carryout(25), control(2 downto 0), tmp_carryout(26), tmp_alu(26));
	a27 : entity alu_1(structural)
		port map(A(27), B_out(27), tmp_carryout(26), control(2 downto 0), tmp_carryout(27), tmp_alu(27));
	a28 : entity alu_1(structural)
		port map(A(28), B_out(28), tmp_carryout(27), control(2 downto 0), tmp_carryout(28), tmp_alu(28));
	a29 : entity alu_1(structural)
		port map(A(29), B_out(29), tmp_carryout(28), control(2 downto 0), tmp_carryout(29), tmp_alu(29));
	a30 : entity alu_1(structural)
		port map(A(30), B_out(30), tmp_carryout(29), control(2 downto 0), tmp_carryout(30), tmp_alu(30));
	a31 : entity alu_1(structural)
		port map(A(31), B_out(31), tmp_carryout(30), control(2 downto 0), tmp_carryout(31), tmp_alu(31));
	g3 : entity not_gate_32(dataflow)
		port map(tmp_alu, neg_tmp_alu);
	g4 : entity and_tree_32(structural)
		port map(neg_tmp_alu, zero);
	g5 : entity xor_gate(dataflow)
		port map(tmp_carryout(31), tmp_carryout(30), overflow);

	carryout <= tmp_carryout(31);

	tmp_slt(0) <= tmp_alu(31);
	tmp_slt(31 downto 1) <= "0000000000000000000000000000000";
	tmp_sltu(0) <= not tmp_carryout(31);
	tmp_sltu(31 downto 1) <= "0000000000000000000000000000000";

	g6 : entity sll_32(structural)
		port map(A, B(4 downto 0), tmp_sll);
	g7 : entity mux_8_1_32(structural)
		port map(control(2 downto 0), tmp_alu, tmp_alu, tmp_slt, tmp_sltu, tmp_alu, tmp_alu, tmp_alu, tmp_sll, result);
	

end architecture structural;
		
		
