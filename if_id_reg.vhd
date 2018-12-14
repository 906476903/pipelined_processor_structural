library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.eecs361.all;
use work.reg_n;
use work.not_gate;

entity if_id_reg is
  port (
	pc_4_in : in std_logic_vector(31 downto 0);
	i_in : in std_logic_vector(31 downto 0);
	clk : in std_logic;
	pc_4_out : out std_logic_vector(31 downto 0);
	i_out : out std_logic_vector(31 downto 0)
  );
end if_id_reg;

architecture structural of if_id_reg is

begin
	g0 : entity reg_n(structural) generic map(32)
		port map(pc_4_in, '1', clk, pc_4_out);
	g1 : entity reg_n(structural) generic map(32)
		port map(i_in, '1', clk, i_out);
end structural;
