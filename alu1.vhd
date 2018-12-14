library ieee;
use ieee.std_logic_1164.all;
library work;
use work.add_1;
use work.eecs361.all;
use work.and_gate;
use work.or_gate;
use work.xor_gate;
use work.mux_8_1;

Entity alu_1 is
	port (
		A : in std_logic;
		B : in std_logic;
		carryin : in std_logic;
		control : in std_logic_vector(2 downto 0);
		carryout : out std_logic;
		result : out std_logic
	);
end alu_1;

-- add : 000
-- sub : 001
-- and : 100
-- xor : 101
-- or : 110
-- sll : 111
-- slt  : 010
-- sltu : 011

Architecture structural of alu_1 is
	signal tmp_carryout, tmp_result, tmp_add, tmp_and, tmp_xor, tmp_or : std_logic;
begin
	g0 : entity add_1(structural)
		port map(A, B, carryin, tmp_add, tmp_carryout);
	g1 : entity and_gate(dataflow)
		port map(A, B, tmp_and);
	g2 : entity xor_gate(dataflow)
		port map(A, B, tmp_xor);
	g3 : entity or_gate(dataflow)
		port map(A, B, tmp_or);
	g4 : entity mux_8_1(structural)
		port map(control, tmp_add, tmp_add, tmp_add, tmp_add, tmp_and, tmp_xor, tmp_or, '0', result);
	g5 : entity mux_8_1(structural)
		port map(control, tmp_carryout, tmp_carryout, tmp_carryout, tmp_carryout, '0', '0', '0', '0', carryout);
end architecture structural;
		
		
