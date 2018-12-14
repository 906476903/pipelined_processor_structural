library ieee;
use ieee.std_logic_1164.all;
library work;
use work.eecs361_gates.all;
use work.and_gate;
use work.data_memory;


Entity mem_stage is
	port (
		--branch : in std_logic;
		zero : in std_logic;
		aluout_in : in std_logic_vector(31 downto 0);
		busb_in : in std_logic_vector(31 downto 0);
		rt_rd_in : in std_logic_vector(4 downto 0);
		memwr : in std_logic;
		--branch_out : out std_logic;
		dout : out std_logic_vector(31 downto 0);
		aluout_out : out std_logic_vector(31 downto 0);
		rt_rd_out : out std_logic_vector(4 downto 0)
	);
end mem_stage;

Architecture structural of mem_stage is
	signal memwr_neg : std_logic;

	
begin
	--g0 : entity work.and_gate(dataflow)
		--port map(branch, zero, branch_out);
	g1 : entity work.not_gate(dataflow)
		port map(memwr, memwr_neg);
	g2 : entity data_memory(structural)
		port map('1', memwr_neg, memwr, aluout_in, busb_in, dout);
	aluout_out <= aluout_in;
	rt_rd_out <= rt_rd_in;
end architecture structural;
