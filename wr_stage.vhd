library ieee;
use ieee.std_logic_1164.all;
library work;
use work.eecs361_gates.all;
use work.mux_32;

Entity wr_stage is
	port (
		dout_in : in std_logic_vector(31 downto 0);
		aluout_in : in std_logic_vector(31 downto 0);
		memtoreg : in std_logic;
		din_out : out std_logic_vector(31 downto 0)
	);
end wr_stage;

Architecture structural of wr_stage is
	
begin
	g0 : entity mux_32(structural)
		port map(memtoreg, aluout_in, dout_in, din_out);
end architecture structural;
