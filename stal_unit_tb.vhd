library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity stall_unit_tb is
port (
	stall : out std_logic
);
end stall_unit_tb;

architecture behavior of stall_unit_tb is

component stall_unit is
port (
	rt_id_ex, rd_id_ex, rs_if_id, rt_if_id : in std_logic_vector(4 downto 0);
	memtoreg_id_ex: in std_logic;
	branch_id : in std_logic;
	aluSrc_id : in std_logic;
	regWr_id,regwr_id_ex : in std_logic;
	stall : out std_logic
);
end component;

signal	rt_id_ex, rd_id_ex, rs_if_id, rt_if_id : std_logic_vector(4 downto 0);
signal	memtoreg_id_ex: std_logic;
signal	branch_id : std_logic;
signal	aluSrc_id: std_logic;
signal	regWr_id,regwr_id_ex : std_logic;

begin
dut:stall_unit port map(rt_id_ex, rd_id_ex, rs_if_id, rt_if_id,memtoreg_id_ex,branch_id,aluSrc_id,regWr_id,regwr_id_ex,stall);

test:process is 
  begin
	branch_id<='0';
	memtoreg_id_ex<='0';
	aluSrc_id<='0';
	regWr_id<='0';
	wait for 10 ns;
	branch_id<='1';
	wait for 10 ns;
	branch_id<='0';
	wait for 10 ns;
	memtoreg_id_ex<='1';
	regWr_id<='1';
	wait for 10 ns;
	aluSrc_id<='0';
	rt_id_ex<="00001";
	rs_if_id<="00000";
	wait for 10 ns;
	rt_id_ex<="00001";
	rs_if_id<="00001";
	wait for 10 ns;
	rt_id_ex<="00001";
	rs_if_id<="00000";
	rt_if_id<="00001";
	wait for 10 ns;
	aluSrc_id<='1';
	rt_id_ex<="00001";
	rs_if_id<="00000";
	wait for 10 ns;
	rs_if_id<="00001";
	wait;
	end process;
end behavior;










