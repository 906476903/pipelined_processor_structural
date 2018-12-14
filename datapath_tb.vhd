library ieee;
use ieee.std_logic_1164.all;
library work;

entity datapath_tb is
end datapath_tb;

architecture behavior of datapath_tb is


signal clk : std_logic;
signal reset : std_logic;
signal forward : std_logic;

 begin
	pipeline : entity work.datapath_pipelined(structural) port map(clk, reset, forward);
	test_cup : process is
	begin
	-- Start process w/ reset cycle
	clk <='1';
	reset <= '1';
	wait for 10 ns;
    	clk <= '0';
    	
    	wait for 10 ns;
    	clk <= '1';
	reset <= '0';
	forward <= '1';
    	wait for 10 ns;
    	clk <= '0';
  	  wait for 10 ns;
    	clk <= '1';
    	wait for 10 ns;
    	clk <= '0';
	forward <= '1';

go: for i in 0 to 1000 loop

	clk <= '0';
	wait for 10 ns;
	clk <= '1';
	wait for 10 ns;
	
	end loop;
	
	end process;
end behavior;

















