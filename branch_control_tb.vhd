library ieee;
use ieee.std_logic_1164.all;
library work;
use work.eecs361.all;
use work.not_gate;
use work.and_gate;
use work.or_gate;

entity branch_control_tb is
	port(branch_tb : out std_logic);
end branch_control_tb;

architecture behavior of branch_control_tb is

component branch_control is
	port (
		zero : in std_logic;
		sign : in std_logic;
		beq : in std_logic;
		bne : in std_logic;
		bgtz : in std_logic;
		branch : out std_logic
	);
end component;

signal zero : std_logic := '0';
signal sign : std_logic := '0';
signal beq : std_logic := '0';
signal bne : std_logic := '0';
signal bgtz : std_logic := '0';

begin

dut:branch_control
	port map(zero =>zero,
	sign => sign,
	beq => beq,
	bne => bne,
	bgtz => bgtz,
	branch => branch_tb);
test_branch_control:process is 
  begin
	wait for 10 ns;
	bne <= '1';
	wait for 10 ns;
	zero <= '1';
	beq <= '1';
	wait for 10 ns;
	beq <= '0';
	bne <= '0';
	bgtz <= '1';
	wait for 10 ns;
	sign <= '1';
	wait;

  end process;
end behavior;