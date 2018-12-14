library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.eecs361.all;
use work.reg_1;
use work.reg_n;
use work.not_gate;

entity ex_mem_reg is
  port (
	--target_in : in std_logic_vector(31 downto 0);
	zero_in : in std_logic;
	aluout_in : in std_logic_vector(31 downto 0);
	busb_in : in std_logic_vector(31 downto 0);
	rt_rd_in : in std_logic_vector(4 downto 0);
	clk : in std_logic;
	--target_out : out std_logic_vector(31 downto 0);
	zero_out : out std_logic;
	aluout_out : out std_logic_vector(31 downto 0);
	busb_out : out std_logic_vector(31 downto 0);
	rt_rd_out : out std_logic_vector(4 downto 0)
  );
end ex_mem_reg;

architecture structural of ex_mem_reg is

begin

	--g0 : entity reg_n(structural) generic map(32)
		--port map(target_in, '1', clk_not, target_out);
	g1 : entity reg_1(structural)
		port map(zero_in, '1', clk, zero_out);
	g2 : entity reg_n(structural) generic map(32)
		port map(aluout_in, '1', clk, aluout_out);
	g3 : entity reg_n(structural) generic map(32)
		port map(busb_in, '1', clk, busb_out);
	g4 : entity reg_n(structural) generic map(5)
		port map(rt_rd_in, '1', clk, rt_rd_out);
end structural;
