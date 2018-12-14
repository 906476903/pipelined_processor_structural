library ieee;
use ieee.std_logic_1164.all;
library work;
use work.eecs361.all;
use work.sram;

Entity data_memory is
	port (
		cs	  : in	std_logic;
		oe	  :	in	std_logic;
		we	  :	in	std_logic;
		addr  : in	std_logic_vector(31 downto 0);
		din	  :	in	std_logic_vector(31 downto 0);
		dout  :	out std_logic_vector(31 downto 0)
  	);
end data_memory;

Architecture structural of data_memory is
begin
	sram1 : entity work.sram(behavioral)
		--generic map(mem_file => "C:\Users\zhang\Documents\verilog\eecs361lib_cpu_VHDL\eecs361\data/bills_branch.dat")
		--generic map(mem_file => "C:\Users\zhang\Documents\verilog\eecs361lib_cpu_VHDL\eecs361\data/sort_corrected_branch.dat")
		generic map(mem_file => "C:\Users\zhang\Documents\verilog\eecs361lib_cpu_VHDL\eecs361\data/unsigned_sum.dat")
		--generic map(mem_file => "C:\Users\zhang\Documents\verilog\eecs361lib_cpu_VHDL\eecs361\data/mem_forwarding.dat")
		port map(cs, oe, we, addr, din, dout);
end architecture structural;
