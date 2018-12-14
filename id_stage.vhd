library ieee;
use ieee.std_logic_1164.all;
library work;
use work.eecs361_gates.all;
use work.instruction_decoder;
use work.reg_32;
use work.signed_ext;
use work.add_32;
use work.alu_32;
use work.mux_32;
use work.or_gate;
use work.branch_control;
use work.shift_left_2;
use work.not_gate;

Entity id_stage is
	port (
		beq : in std_logic;
		bne : in std_logic;
		bgtz : in std_logic;
		regwr : in std_logic;
		pc_4_in : in std_logic_vector(31 downto 0);
		instruction_in : in std_logic_vector(31 downto 0);
		rt_rd_wr_stage : in std_logic_vector(4 downto 0);
		din_wr_stage : in std_logic_vector(31 downto 0);
		reset : in std_logic;
		clk : in std_logic;
		target_out : out std_logic_vector(31 downto 0);
		branch_out : out std_logic;
		instruction_out : out std_logic_vector(31 downto 0);
		pc_4_out : out std_logic_vector(31 downto 0);
		imm_16_out : out std_logic_vector(15 downto 0);
		busa_out : out std_logic_vector(31 downto 0);
		busb_out : out std_logic_vector(31 downto 0);
		rt_out : out std_logic_vector(4 downto 0);
		rd_out : out std_logic_vector(4 downto 0);
		shamt : out std_logic_vector(4 downto 0)--------------shamt
	);
end id_stage;

Architecture structural of id_stage is
	signal imm_16_dec : std_logic_vector(15 downto 0);
	signal rs_dec : std_logic_vector(4 downto 0);
	signal rt_dec : std_logic_vector(4 downto 0);
	signal rd_dec : std_logic_vector(4 downto 0);
	signal add_32_out : std_logic_vector(31 downto 0);
	signal signed_ext_out : std_logic_vector(31 downto 0);
	signal signed_ext_out_shift : std_logic_vector(31 downto 0);
	signal alu_out : std_logic_vector(31 downto 0);
	signal alu_zero : std_logic;
	signal busa, busb : std_logic_vector(31 downto 0);
	signal clk_not : std_logic;
	
begin
	clk_not <= not(clk);
	g0 : entity add_32(structural)
		port map(signed_ext_out_shift, pc_4_in, add_32_out);
	shift : entity shift_left_2(structural)
		port map(signed_ext_out, signed_ext_out_shift);
	g1 : entity signed_ext(structural)
		port map(imm_16_dec, signed_ext_out);
	g2 : entity alu_32(structural)
		port map(busa, busb, "0001", open, open, alu_zero, alu_out);
	g3 : entity branch_control(structural)
		port map(alu_zero, alu_out(31), beq, bne, bgtz, branch_out);
	g7 : entity mux_32(structural)
		port map(reset, add_32_out, X"00400024", target_out);
	g8 : entity instruction_decoder(structural)
		port map(instruction_in, open, rs_dec, rt_dec, rd_dec, shamt, open, imm_16_dec);-------------shamt
	g9 : entity reg_32(structural)
		port map(din_wr_stage, clk_not, reset, regwr, rs_dec, rt_dec, rt_rd_wr_stage, busa, busb);
	busa_out <= busa;
	busb_out <= busb;
	pc_4_out <= pc_4_in;
	imm_16_out <= imm_16_dec;
	rt_out <= rt_dec;
	rd_out <= rd_dec;
	instruction_out <= instruction_in;
end architecture structural;
