library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.eecs361.all;
use work.reg_n;
use work.not_gate;

entity id_ex_reg is
  port (
	pc_4_in : in std_logic_vector(31 downto 0);
	imm_16_in : in std_logic_vector(15 downto 0);
	busa_in : in std_logic_vector(31 downto 0);
	busb_in : in std_logic_vector(31 downto 0);
	rt_in : in std_logic_vector(4 downto 0);
	rd_in : in std_logic_vector(4 downto 0);
	clk : in std_logic;
	shamt_in: in std_logic_vector(4 downto 0);---------------shamt
	pc_4_out : out std_logic_vector(31 downto 0);
	imm_16_out : out std_logic_vector(15 downto 0);
	busa_out : out std_logic_vector(31 downto 0);
	busb_out : out std_logic_vector(31 downto 0);
	rt_out : out std_logic_vector(4 downto 0);
	rd_out : out std_logic_vector(4 downto 0);
	shamt_out : out std_logic_vector(4 downto 0)--------------shamt
  );
end id_ex_reg;

architecture structural of id_ex_reg is

begin

	g0 : entity reg_n(structural) generic map(32)
		port map(pc_4_in, '1', clk, pc_4_out);
	g1 : entity reg_n(structural) generic map(16)
		port map(imm_16_in, '1', clk, imm_16_out);
	g2 : entity reg_n(structural) generic map(32)
		port map(busa_in, '1', clk, busa_out);
	g3 : entity reg_n(structural) generic map(32)
		port map(busb_in, '1', clk, busb_out);
	g4 : entity reg_n(structural) generic map(5)
		port map(rt_in, '1', clk, rt_out);
	g5 : entity reg_n(structural) generic map(5)
		port map(rd_in, '1', clk, rd_out);
	shamt : entity reg_n(structural) generic map(5)
		port map(shamt_in, '1', clk, shamt_out);----------------shamt
end structural;
