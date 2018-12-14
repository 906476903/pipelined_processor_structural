library ieee;
use ieee.std_logic_1164.all;
library work;
use work.eecs361_gates.all;
use work.shift_left_2;
use work.add_32;
use work.alu_32;
use work.mux_32;
use work.unsigned_ext;
use work.signed_ext;
--use work.aluctr_decoder;
use work.mux_n;


Entity ex_stage is
	port (
		pc_4_in : in std_logic_vector(31 downto 0);
		imm_16_in : in std_logic_vector(15 downto 0);
		busa_in : in std_logic_vector(31 downto 0);
		busb_in : in std_logic_vector(31 downto 0);
		rt_in : in std_logic_vector(4 downto 0);
		rd_in : in std_logic_vector(4 downto 0);
		extop : in std_logic;
		regdst : in std_logic;
		alusrc : in std_logic;
		aluop : in std_logic_vector(3 downto 0);
		--target : out std_logic_vector(31 downto 0);
		zero : out std_logic;
		aluout : out std_logic_vector(31 downto 0);
		busb_out : out std_logic_vector(31 downto 0);
		rt_rd_out : out std_logic_vector(4 downto 0);
		shamt_in : in std_logic_vector(4 downto 0)-----------shamt
	);
end ex_stage;

Architecture structural of ex_stage is
	signal unsigned_ext_out : std_logic_vector(31 downto 0);
	signal signed_ext_out : std_logic_vector(31 downto 0);
	signal ext_out : std_logic_vector(31 downto 0);
	--signal shift_left_2_out : std_logic_vector(31 downto 0);
	--signal aluctr : std_logic_vector(3 downto 0);
	signal alusrc_mux_32_out : std_logic_vector(31 downto 0);
	signal sa_32bit: std_logic_vector(31 downto 0);            -------------
	signal alu_in_b: std_logic_vector(31 downto 0);            -------------
	signal sll_select: std_logic;                              -------------

	
begin
----------------sll_select
sll_select <= (not aluop(3)) and aluop(2) and aluop(1) and aluop(0);
sa_32bit(31 downto 5) <= B"000000000000000000000000000";
sa_32bit(4 downto 0) <= shamt_in(4 downto 0);
--------------------

	--g0 : entity shift_left_2(structural)
		--port map(ext_out, shift_left_2_out);
	--g1 : entity add_32(structural)
		--port map(shift_left_2_out, pc_4_in, target);
	g2 : entity alu_32(structural)
		port map(busa_in, alu_in_b, aluop, open, open, zero, aluout);  ------------------
	g3 : entity mux_32(structural)
		port map(alusrc, busb_in, ext_out, alusrc_mux_32_out);
	s0 : entity mux_32(structural)
		port map(sll_select, alusrc_mux_32_out, sa_32bit, alu_in_b);---------------------
	g4 : entity unsigned_ext(structural)
		port map(imm_16_in, unsigned_ext_out);
	g5 : entity signed_ext(structural)
		port map(imm_16_in, signed_ext_out);
	g6 : entity mux_32(structural)
		port map(extop, unsigned_ext_out, signed_ext_out, ext_out);
	--g7 : entity aluctr_decoder(structural)
		--port map(aluop, aluctr);
	g8 : entity mux_n generic map(5)
		port map(regdst, rt_in, rd_in, rt_rd_out);
	busb_out <= busb_in;
end architecture structural;
