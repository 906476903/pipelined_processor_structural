library ieee;
use ieee.std_logic_1164.all;
library work;

entity or_gate_1 is
	port (
		r : in std_logic_vector(4 downto 0);
		res : out std_logic
	);
end entity or_gate_1;

architecture structure of or_gate_1 is

signal t1, t2, t3, t4 : std_logic;
component or_gate is
	port (
		x : in std_logic;
		y : in std_logic;
		z : out std_logic
	);
end component;

begin

	or1: or_gate port map (r(0), r(1), t1);
	or2: or_gate port map (r(2), r(3), t2);
	or3: or_gate port map (r(4), t1, t3);
	or4: or_gate port map (t3, t2, res);
	
end structure;