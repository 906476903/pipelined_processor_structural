library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.eecs361.all;
use work.reg_1;
use work.reg_n;
use work.not_gate;

entity id_ex_ctr_reg is
  port (
	instruction_in : in std_logic_vector(31 downto 0);
	extop_in : in std_logic;
	alusrc_in : in std_logic;
	aluop_in : in std_logic_vector(3 downto 0);
	regdst_in : in std_logic;
	memwr_in : in std_logic;
	--branch_in : in std_logic;
	memtoreg_in : in std_logic;
	regwr_in : in std_logic;
	clk : in std_logic;
	instruction_out : out std_logic_vector(31 downto 0);
	extop_out : out std_logic;
	alusrc_out : out std_logic;
	aluop_out : out std_logic_vector(3 downto 0);
	regdst_out : out std_logic;
	memwr_out : out std_logic;
	--branch_out : out std_logic;
	memtoreg_out : out std_logic;
	regwr_out : out std_logic
  );
end id_ex_ctr_reg;

architecture structural of id_ex_ctr_reg is

begin
	
	g0 : entity reg_1(structural)
		port map(extop_in, '1', clk, extop_out);
	g1 : entity reg_1(structural)
		port map(alusrc_in, '1', clk, alusrc_out);
	g2 : entity reg_n(structural) generic map(4)
		port map(aluop_in, '1', clk, aluop_out);
	g3 : entity reg_1(structural)
		port map(regdst_in, '1', clk, regdst_out);
	g4 : entity reg_1(structural)
		port map(memwr_in, '1', clk, memwr_out);
	--g5 : entity reg_1(structural)
		--port map(branch_in, '1', clk, branch_out);
	g6 : entity reg_1(structural)
		port map(memtoreg_in, '1', clk, memtoreg_out);
	g7 : entity reg_1(structural)
		port map(regwr_in, '1', clk, regwr_out);
	g8 : entity reg_n(structural) generic map(32)
		port map(instruction_in, '1', clk, instruction_out);
end structural;
