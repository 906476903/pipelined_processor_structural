library ieee;
use ieee.std_logic_1164.all;
library work;
use work.eecs361_gates.all;

Entity instruction_decoder is
	port (
		A : in std_logic_vector(31 downto 0);
		op : out std_logic_vector(5 downto 0);
		rs : out std_logic_vector(4 downto 0);
		rt : out std_logic_vector(4 downto 0);
		rd : out std_logic_vector(4 downto 0);
		shamt : out std_logic_vector(4 downto 0);
		funct : out std_logic_vector(5 downto 0);
		immediate : out std_logic_vector(15 downto 0)
	);
end instruction_decoder;

Architecture structural of instruction_decoder is
begin
	op <= A(31 downto 26);
	rs <= A(25 downto 21);
	rt <= A(20 downto 16);
	rd <= A(15 downto 11);
	shamt <= A(10 downto 6);
	funct <= A(5 downto 0);
	immediate <= A(15 downto 0);
end architecture structural;
