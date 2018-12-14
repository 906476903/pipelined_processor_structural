library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.eecs361.all;
use work.reg_n;
use work.not_gate;

entity mem_wr_reg is
  port (
	dout_in : in std_logic_vector(31 downto 0);
	aluout_in : in std_logic_vector(31 downto 0);
	rt_rd_in : in std_logic_vector(4 downto 0);
	clk : in std_logic;
	dout_out : out std_logic_vector(31 downto 0);
	aluout_out : out std_logic_vector(31 downto 0);
	rt_rd_out : out std_logic_vector(4 downto 0)
  );
end mem_wr_reg;

architecture structural of mem_wr_reg is

begin

	g0 : entity reg_n(structural) generic map(32)
		port map(dout_in, '1', clk, dout_out);
	g1 : entity reg_n(structural) generic map(32)
		port map(aluout_in, '1', clk, aluout_out);
	g2 : entity reg_n(structural) generic map(5)
		port map(rt_rd_in, '1', clk, rt_rd_out);
end structural;
