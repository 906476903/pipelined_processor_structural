library ieee;
use ieee.std_logic_1164.all;
library work;
use work.eecs361_gates.all;
use work.control_signal;
use work.instruction_decoder;


Entity id_ctr_stage is
	port (
		instruction_in : in std_logic_vector(31 downto 0);
		instruction_out : out std_logic_vector(31 downto 0);
		beq : out std_logic;
		bne : out std_logic;
		bgtz : out std_logic;
		extop_out : out std_logic;
		alusrc_out : out std_logic;
		aluop_out : out std_logic_vector(3 downto 0);
		regdst_out : out std_logic;
		memwr_out : out std_logic;
		memtoreg_out : out std_logic;
		regwr_out : out std_logic		
	);
end id_ctr_stage;

Architecture structural of id_ctr_stage is
	signal op_out : std_logic_vector(5 downto 0);
	signal funct_out : std_logic_vector(5 downto 0);

	
begin
	g0 : entity instruction_decoder(structural)
		port map(instruction_in, op_out, open, open, open, open, funct_out, open);
	g1 : entity control_signal(struc)
		port map(op_out, funct_out, aluop_out, regdst_out, alusrc_out, memtoreg_out, regwr_out, open, memwr_out, beq, bne, bgtz, extop_out);
	instruction_out <= instruction_in;
end architecture structural;
