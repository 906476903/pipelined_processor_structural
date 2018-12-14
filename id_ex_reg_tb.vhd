library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.eecs361.all;
use work.reg_n;

entity id_ex_reg_tb is
	port(	pc_4_out : out std_logic_vector(31 downto 0);
	imm_16_out : out std_logic_vector(15 downto 0);
	busa_out : out std_logic_vector(31 downto 0);
	busb_out : out std_logic_vector(31 downto 0);
	rt_out : out std_logic_vector(4 downto 0);
	rd_out : out std_logic_vector(4 downto 0));
end id_ex_reg_tb;

architecture behavior of id_ex_reg_tb is

component id_ex_reg is
  port (
	pc_4_in : in std_logic_vector(31 downto 0);
	imm_16_in : in std_logic_vector(15 downto 0);
	busa_in : in std_logic_vector(31 downto 0);
	busb_in : in std_logic_vector(31 downto 0);
	rt_in : in std_logic_vector(4 downto 0);
	rd_in : in std_logic_vector(4 downto 0);
	clk : in std_logic;
	pc_4_out : out std_logic_vector(31 downto 0);
	imm_16_out : out std_logic_vector(15 downto 0);
	busa_out : out std_logic_vector(31 downto 0);
	busb_out : out std_logic_vector(31 downto 0);
	rt_out : out std_logic_vector(4 downto 0);
	rd_out : out std_logic_vector(4 downto 0)
  );
end component;

signal pc_4_in : std_logic_vector(31 downto 0):=X"00000000";
signal imm_16_in : std_logic_vector(15 downto 0):=X"0000";
signal busa_in : std_logic_vector(31 downto 0):=X"00000000";
signal busb_in : std_logic_vector(31 downto 0):=X"00000000";
signal rt_in : std_logic_vector(4 downto 0):="00000";
signal rd_in : std_logic_vector(4 downto 0):="00000";
signal clk : std_logic:='0';

begin
dut:id_ex_reg port map(pc_4_in,imm_16_in,busa_in,busb_in,rt_in,rd_in,clk,
		pc_4_out,imm_16_out,busa_out,busb_out,rt_out,rd_out);

test_id_ex_reg:process is
  begin
	wait for 10 ns;
	pc_4_in<=X"00000001";
	wait for 5 ns;
	clk<='1';
	wait for 5 ns;
	clk<='0';
	imm_16_in<=X"0001";
	wait for 5 ns;
	clk<='1';
	wait for 5 ns;
	clk<='0';
	wait for 5 ns;
	busa_in<=X"00000001";
	busb_in<=X"00000010";
	wait for 5 ns;
	clk<='1';
	wait for 5 ns;
	clk<='0';
	rt_in<="00001";
	rd_in<="00010";
	wait for 5 ns;
	clk<='1';
	wait for 5 ns;
	clk<='0';
	wait;
  end process;
end behavior;
















