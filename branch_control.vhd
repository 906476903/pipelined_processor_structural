
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.eecs361.all;
use work.not_gate;
use work.and_gate;
use work.or_gate;

Entity branch_control is
	port (
		zero : in std_logic;
		sign : in std_logic;
		beq : in std_logic;
		bne : in std_logic;
		bgtz : in std_logic;
		branch : out std_logic
	);
end branch_control;

Architecture structural of branch_control is
	signal zero_neg : std_logic;
	signal beq_out : std_logic;
	signal bne_out : std_logic;
	signal bgtz_out0 : std_logic;
	signal bgtz_out : std_logic;
	signal or0_out : std_logic;
	signal sign_neg : std_logic;
begin
	g0 : entity work.not_gate(dataflow)
		port map(zero, zero_neg);
	s0 : entity work.not_gate(dataflow)
		port map(sign, sign_neg);
	g1 : entity work.and_gate(dataflow)
		port map(beq, zero, beq_out);
	g2 : entity work.and_gate(dataflow)
		port map(bne, zero_neg, bne_out);
	g3 : entity work.and_gate(dataflow)
		port map(bgtz, sign_neg, bgtz_out0);
	g31 : entity work.and_gate(dataflow)
		port map(bgtz_out0, zero_neg, bgtz_out);
	g4 : entity work.or_gate(dataflow)
		port map(beq_out, bne_out, or0_out);
	g5 : entity work.or_gate(dataflow)
		port map(or0_out, bgtz_out, branch);
end structural;