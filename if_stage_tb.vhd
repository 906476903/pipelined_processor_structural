library ieee;
use ieee.std_logic_1164.all;
library work;
use work.eecs361_gates.all;
use work.mux_32;
use work.add_32;
use work.pc;
use work.instruction_memory;

entity if_stage_tb is
	port(pc_4 : out std_logic_vector(31 downto 0);
	instruction : out std_logic_vector(31 downto 0));
end if_stage_tb;

architecture behavior of if_stage_tb is

component if_stage is
	port (
		branch : in std_logic;
		target_mem_stage : in std_logic_vector(31 downto 0);
		reset : in std_logic;
		clk : in std_logic;
		pc_4 : out std_logic_vector(31 downto 0);
		instruction : out std_logic_vector(31 downto 0)
	);
end component;

signal branch : std_logic := '0';
signal target_mem_stage: std_logic_vector(31 downto 0) := X"00000000";
signal reset : std_logic := '0';
signal clk : std_logic := '0';

begin
dut:if_stage
	port map(branch,target_mem_stage,reset,clk,pc_4,instruction);

test_if_stage:process is
 begin
	wait for 10 ns;
	reset <= '1';
	wait for 10 ns;
	reset <= '0';
	wait for 10 ns;
	clk <= '1';
	wait for 5 ns;
	clk <= '0';
	wait for 5 ns;
	clk <= '1';
	wait for 5 ns;
	clk <= '0';
	wait for 10 ns;
	target_mem_stage <= X"00400040";
	wait for 5 ns;
	branch <= '1';
	wait for 5 ns;
	clk <= '1';
	wait for 5 ns;
	clk <= '0';
	branch <= '0';
	wait for 5 ns;
	clk <= '1';
	wait for 5 ns;
	clk <= '0';
	wait;
 end process;
end behavior;







