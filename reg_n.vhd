library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.eecs361.all;
use work.reg_1;

entity reg_n is
  generic (
    	n : integer
  );
  port (
	A : in std_logic_vector(n-1 downto 0);
	wr : in std_logic;
	clk : in std_logic;
	result : out std_logic_vector(n-1 downto 0)
  );
end reg_n;

architecture structural of reg_n is
begin
	reg_loop : for i in 0 to n-1 generate
		g0 : entity work.reg_1(structural)
			port map(A(i), wr, clk, result(i));
	end generate reg_loop;
end structural;
