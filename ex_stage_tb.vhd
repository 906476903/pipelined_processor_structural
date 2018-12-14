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

entity ex_stage_tb is
	port(
		--target : out std_logic_vector(31 downto 0);
		zero : out std_logic;
		aluout : out std_logic_vector(31 downto 0);
		busb_out : out std_logic_vector(31 downto 0);
		rt_rd_out : out std_logic_vector(4 downto 0)
	);
end ex_stage_tb;

architecture behavior of ex_stage_tb is

component ex_stage is
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
end component;

signal	pc_4_in : std_logic_vector(31 downto 0);
signal	imm_16_in : std_logic_vector(15 downto 0);
signal	busa_in : std_logic_vector(31 downto 0);
signal	busb_in : std_logic_vector(31 downto 0);
signal	rt_in : std_logic_vector(4 downto 0);
signal	rd_in : std_logic_vector(4 downto 0);
signal  regdst : std_logic;
signal	extop : std_logic;
signal  shamt_in : std_logic_vector(4 downto 0);
signal	alusrc : std_logic;
signal	aluop : std_logic_vector(3 downto 0);

begin
dut:ex_stage port map(pc_4_in,imm_16_in,busa_in,busb_in,rt_in,rd_in,extop,regdst,alusrc,aluop,
		zero,aluout,busb_out,rt_rd_out,shamt_in);

test_ex_stage:process is
  begin
	pc_4_in<=X"00000000";
	imm_16_in<=X"0001";
	busa_in<=X"00001000";
	busb_in<=X"00000002";
	rt_in<="00001";
	rd_in<="00010";
	extop<='1';
	shamt_in<="10000";
	alusrc<='0';
	aluop<="0000";
	wait for 10 ns;
	alusrc<='1';
	wait for 10 ns;
	aluop<="0111";
	wait for 10 ns;
	wait;
  end process;
end behavior;
	


























