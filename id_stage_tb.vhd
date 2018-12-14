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

entity id_stage_tb is
	port(
		target_out : out std_logic_vector(31 downto 0);
		branch_out : out std_logic;
		instruction_out : out std_logic_vector(31 downto 0);
		pc_4_out : out std_logic_vector(31 downto 0);
		imm_16_out : out std_logic_vector(15 downto 0);
		busa_out : out std_logic_vector(31 downto 0);
		busb_out : out std_logic_vector(31 downto 0);
		rt_out : out std_logic_vector(4 downto 0);
		rd_out : out std_logic_vector(4 downto 0);
		shamt : out std_logic_vector(4 downto 0));--------------shamt
end id_stage_tb;

architecture behavior of id_stage_tb is

component id_stage is
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
end component;

signal beq,bne,bgtz:std_logic := '0';
signal regwr:std_logic := '0';
signal pc_4_in:std_logic_vector(31 downto 0) := X"00000000";
signal i_in:std_logic_vector(31 downto 0) := X"00000000";
signal rt_rd_wr_stage:std_logic_vector(4 downto 0) := "00000";
signal din_wr_stage:std_logic_vector(31 downto 0) := X"00000000";
signal reset:std_logic := '0';
signal clk:std_logic := '0';

begin
dut:id_stage port map(beq,bne,bgtz,regwr,pc_4_in,i_in,rt_rd_wr_stage,din_wr_stage,reset,clk,
		target_out,branch_out,instruction_out,pc_4_out,imm_16_out,busa_out,busb_out,rt_out,rd_out,shamt);

test_id_stage:process is
  begin
	wait for 10 ns;
	reset<='1';
	wait for 10 ns;
	reset<='0';
	wait for 5 ns;
	regwr<='1';
	din_wr_stage<=X"00000002";
	rt_rd_wr_stage<="00001";
	wait for 5 ns;
	clk<='1';
	wait for 5 ns;
	clk<='0';
	wait for 5 ns;
	din_wr_stage<=X"00000002";
	rt_rd_wr_stage<="00011";
	wait for 5 ns;
	regwr<='1';
	din_wr_stage<=X"00000002";
	rt_rd_wr_stage<="00101";
	wait for 5 ns;
	clk<='1';
	wait for 5 ns;
	clk<='0';
	wait for 5 ns;
	din_wr_stage<=X"00000002";
	rt_rd_wr_stage<="00010";
	clk<='1';
	wait for 5 ns;
	clk<='0';
	wait for 5 ns;
	regwr<='0';
	wait for 10 ns;
	i_in <= "00000000001000100000000000000001";
	wait for 10 ns;
	i_in <= "00000000011001010000000000000001";
	wait for 10 ns;
	pc_4_in <= X"00000004";
	beq <='1';
	wait for 5 ns;
	clk <= '1';
	wait for 5 ns;
	clk <= '0';
	wait;
  end process;
end behavior;
	

















