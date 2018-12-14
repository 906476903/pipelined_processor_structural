library ieee;
use ieee.std_logic_1164.all;
library work;
use work.eecs361_gates.all;
use work.mux_8_1_32;

Entity aluctr_decoder is
	port (
		A : in std_logic_vector(2 downto 0);
		result : out std_logic_vector(3 downto 0)
	);
end aluctr_decoder;

-- add: 010
-- sub : 110
-- and : 000
-- or : 001
-- slt : 111
-- sll : 101


-- add : 0000
-- sub : 0001
-- and : 0100
-- xor : 0101
-- or : 0110
-- sll : 0111
-- slt  : 0010
-- sltu : 0011



Architecture structural of aluctr_decoder is
	signal tmp_result : std_logic_vector(31 downto 0);
begin
	g0 : entity mux_8_1_32(structural)
		port map(A, "00000000000000000000000000000100", "00000000000000000000000000000110", "00000000000000000000000000000000", "00000000000000000000000000000111", "00000000000000000000000000000011", "00000000000000000000000000000111", "00000000000000000000000000000001", "00000000000000000000000000000010", tmp_result);
	result <= tmp_result(3 downto 0);
end architecture structural;
