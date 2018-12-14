library ieee;
use ieee.std_logic_1164.all;
library work;
use work.mux_32;

Entity mux_8_1_32 is
	port (
		sel : in std_logic_vector(2 downto 0);
		i0, i1, i2, i3, i4, i5, i6, i7 : in std_logic_vector(31 downto 0);
		z : out std_logic_vector(31 downto 0)
	);
end mux_8_1_32;

-- add : 000
-- sub : 001
-- and : 100
-- xor : 101
-- or : 110
-- sll : 111
-- slt  : 010
-- sltu : 011

Architecture structural of mux_8_1_32 is
	signal w0, w1, w2, w3, w4, w5 : std_logic_vector(31 downto 0);
begin
	g0 : entity mux_32(structural)
		port map(sel(0), i6, i7, w5);
	g1 : entity mux_32(structural)
		port map(sel(0), i4, i5, w4);
	g2 : entity mux_32(structural)
		port map(sel(0), i2, i3, w3);
	g3 : entity mux_32(structural)
		port map(sel(0), i0, i1, w2);
	g4 : entity mux_32(structural)
		port map(sel(1), w4, w5, w1);
	g5 : entity mux_32(structural)
		port map(sel(1), w2, w3, w0);
	g6 : entity mux_32(structural)
		port map(sel(2), w0, w1, z);
end architecture structural;
		
		
