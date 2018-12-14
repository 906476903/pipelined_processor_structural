library ieee;
use ieee.std_logic_1164.all;
library work;
use work.and_gate;
use work.or_gate;
use work.xor_gate;

Entity add_1 is
	port (
		A : in std_logic;
		B : in std_logic;
		carryin : in std_logic;
		sum : out std_logic;
		carryout : out std_logic
	);
end add_1;

Architecture structural of add_1 is
	signal w0, w1, w2, w3, w4 : std_logic;
begin
	g0 : entity and_gate(dataflow)
		port map(carryin, A, w0);
	g1 : entity and_gate(dataflow)
		port map(carryin, B, w1);
	g2 : entity and_gate(dataflow)
		port map(A, B, w2);
	g3 : entity or_gate(dataflow)
		port map(w0, w1, w3);
	g4 : entity or_gate(dataflow)
		port map(w2, w3, carryout);
	g5 : entity xor_gate(dataflow)
		port map(A, B, w4);
	g6 : entity xor_gate(dataflow)
		port map(w4, carryin, sum);

end architecture structural;
		
		
