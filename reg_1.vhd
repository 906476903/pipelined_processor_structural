library ieee;
use ieee.std_logic_1164.all;
library work;
use work.eecs361.all;
use work.mux;
use work.dffr;

Entity reg_1 is
	port (
		A : in std_logic;
		wr : in std_logic;
		clk : in std_logic;
		result : out std_logic
	);
end reg_1;

Architecture structural of reg_1 is
	signal mux_out, dummy_out : std_logic;
begin
	g0 : entity work.mux(structural)
		port map(wr, dummy_out, A, mux_out);
	g1 : entity work.dffr(behavioral)
		port map(clk, mux_out, dummy_out);
	result <= dummy_out;
	
end architecture structural;
		
		
