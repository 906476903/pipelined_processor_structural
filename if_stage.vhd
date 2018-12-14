library ieee;
use ieee.std_logic_1164.all;
library work;
use work.eecs361_gates.all;
use work.and_gate;
use work.not_gate;
use work.mux_32;
use work.add_32;
use work.pc;
use work.instruction_memory;

Entity if_stage is
	port (
		stall : in std_logic;
		branch : in std_logic;
		target_mem_stage : in std_logic_vector(31 downto 0);
		reset : in std_logic;
		clk : in std_logic;
		pc_4 : out std_logic_vector(31 downto 0);
		instruction : out std_logic_vector(31 downto 0)
	);
end if_stage;

Architecture structural of if_stage is
	signal stall_neg : std_logic;
	signal branch_not_stall : std_logic;
	signal pc_in : std_logic_vector(31 downto 0);
	signal pc_out, stall_out : std_logic_vector(31 downto 0);
	signal instruction0, add_32_out : std_logic_vector(31 downto 0);--------------
	signal clk_not : std_logic;
	
begin
	clk_not <= not(clk);
	g0 : entity work.not_gate(dataflow)
		port map(stall, stall_neg);
	g1 : entity work.and_gate(dataflow)
		port map(branch, stall_neg, branch_not_stall);
	g2 : entity pc(structural)
		port map(pc_in, reset, clk_not, pc_out);
	g3 : entity add_32(structural)
		port map(pc_out, "00000000000000000000000000000100", add_32_out);
	g4 : entity work.mux_32(structural)
		port map(stall, add_32_out, pc_out, stall_out);
	g5 : entity work.mux_32(structural)
		port map(branch_not_stall, stall_out, target_mem_stage, pc_in);
	g6 : entity work.instruction_memory(structural)
		port map('1', '1', '0', pc_out, X"00000000", instruction0);
	g7 : entity work.mux_32(structural)		port map(stall, instruction0, X"00000000", instruction);
	pc_4 <= stall_out;
end architecture structural;
