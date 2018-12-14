library ieee;
use ieee.std_logic_1164.all;
library work;
use work.eecs361_gates.all;
use work.control_signal;
use work.instruction_decoder;

entity id_ctr_stage_tb is
	port(
		instruction_out : out std_logic_vector(31 downto 0);
		beq : out std_logic;
		bne : out std_logic;
		bgtz : out std_logic;
		extop_out : out std_logic;
		alusrc_out : out std_logic;
		aluop_out : out std_logic_vector(3 downto 0);
		regdst_out : out std_logic;
		memwr_out : out std_logic;
		memtoreg_out : out std_logic;
		regwr_out : out std_logic	
	);
end id_ctr_stage_tb;

architecture behavior of id_ctr_stage_tb is

component id_ctr_stage is
	port (
		instruction_in : in std_logic_vector(31 downto 0);
		instruction_out : out std_logic_vector(31 downto 0);
		beq : out std_logic;
		bne : out std_logic;
		bgtz : out std_logic;
		extop_out : out std_logic;
		alusrc_out : out std_logic;
		aluop_out : out std_logic_vector(3 downto 0);
		regdst_out : out std_logic;
		memwr_out : out std_logic;
		memtoreg_out : out std_logic;
		regwr_out : out std_logic		
	);
end component;

signal instruction_in : std_logic_vector(31 downto 0);


begin
dut:id_ctr_stage
	port map(instruction_in,instruction_out,beq,bne,bgtz,extop_out,alusrc_out,aluop_out,regdst_out,memwr_out,memtoreg_out,regwr_out);

test_id_ctr:process is
  begin
	instruction_in <= X"00000000";
	wait for 10 ns;
	instruction_in <= X"20C60028";
	wait for 10 ns;
	instruction_in <= X"8CE40000";
	wait for 10 ns;
	instruction_in <= X"ACE50000";
	wait for 10 ns;
	instruction_in <= X"00E73C00";
	wait;
  end process;
end behavior;



















