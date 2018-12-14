library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.eecs361.all;
use work.reg_n;

entity if_id_reg_tb is
	port(pc_4_out : out std_logic_vector(31 downto 0);
	i_out : out std_logic_vector(31 downto 0));
end if_id_reg_tb;

architecture behavior of if_id_reg_tb is

component if_id_reg is
  port (
	pc_4_in : in std_logic_vector(31 downto 0);
	i_in : in std_logic_vector(31 downto 0);
	clk : in std_logic;
	pc_4_out : out std_logic_vector(31 downto 0);
	i_out : out std_logic_vector(31 downto 0)
  );
end component;

signal pc_4_in : std_logic_vector(31 downto 0);
signal i_in : std_logic_vector(31 downto 0);
signal clk : std_logic;

begin

dut:if_id_reg
	port map(pc_4_in,
	i_in,
	clk,
	pc_4_out,
	i_out);

test_if_id_reg:process is
  begin
	pc_4_in <= X"00000000";
	i_in <= X"00000000";
	clk <= '0';
	wait for 10 ns;
	pc_4_in <= X"00001000";
	wait for 5 ns;
	clk <= '1';
	wait for 5 ns;
	clk <= '0';
	wait for 10 ns;
	i_in <= X"00000100";
	wait for 5 ns;
	clk <= '1';
	wait for 5 ns;
	clk <= '0';
	wait for 10 ns;
	pc_4_in <= X"00010000";
	wait for 5 ns;
	clk <= '1';
	wait for 5 ns;
	clk <= '0';
	wait;
 end process;
end behavior;








