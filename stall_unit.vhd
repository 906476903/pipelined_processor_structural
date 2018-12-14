library ieee;
use ieee.std_logic_1164.all;

entity stall_unit is
port (
	rt_id_ex, rd_id_ex, rs_if_id, rt_if_id : in std_logic_vector(4 downto 0);
	memtoreg_id_ex: in std_logic;
	branch_id : in std_logic;
	aluSrc_id : in std_logic;
	regWr_id,regwr_id_ex : in std_logic;
	stall : out std_logic
);
end stall_unit;

architecture structural of stall_unit is

signal t1, t3, t5 : std_logic_vector(4 downto 0);
signal t2, t4, t6 : std_logic;

component xor_gate_n is
  generic (
    n   : integer
  );
  port (
    x   : in  std_logic_vector(n-1 downto 0);
    y   : in  std_logic_vector(n-1 downto 0);
    z   : out std_logic_vector(n-1 downto 0)
  );
end component;

component or_gate_1 is
	port (
		r : in std_logic_vector(4 downto 0);
		res : out std_logic
	);
end component;

begin

	xor0: xor_gate_n generic map (n => 5) port map (
		rt_id_ex, rs_if_id, t1);
	or0: or_gate_1 port map (t1, t2);
	
	xor1: xor_gate_n generic map (n => 5) port map (
		rt_id_ex, rt_if_id, t3);
	or1: or_gate_1 port map (t3, t4);
	
	xor2: xor_gate_n generic map (n => 5) port map (
		rt_id_ex, rs_if_id, t5);
	or2: or_gate_1 port map (t5, t6);

	stall <= branch_id or ((memtoreg_id_ex and regWr_id) and ( ((not t2 or not t4) and (not aluSrc_id)) or (not t6 and aluSrc_id)));
end architecture structural;

