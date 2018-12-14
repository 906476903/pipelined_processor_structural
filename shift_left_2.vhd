library ieee;
use ieee.std_logic_1164.all;
library work;
use work.eecs361_gates.all;

Entity shift_left_2 is
	port (
		A : in std_logic_vector(31 downto 0);
		B : out std_logic_vector(31 downto 0)
	);
end shift_left_2;

Architecture structural of shift_left_2 is
begin
	shift_loop : for i in 2 to 31 generate
		B(i) <= A(i-2);
	end generate shift_loop;
	B(1) <= '0';
	B(0) <= '0';
end architecture structural;
