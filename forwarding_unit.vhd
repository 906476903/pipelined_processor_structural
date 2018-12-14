library ieee;
use ieee.std_logic_1164.all;
library work;



entity forwarding_unit is
	port (
		id_ex_rs, id_ex_rt: in std_logic_vector(4 downto 0);
		ex_mem_we, mem_wb_we: in std_logic;
		ex_mem_rd, mem_wb_rd: in std_logic_vector(4 downto 0);
		forwardA, forwardB: out std_logic_vector(1 downto 0)
		);
end entity forwarding_unit;

architecture structure of forwarding_unit is

signal t1, t2, v1, v2, v3, v4 : std_logic_vector(4 downto 0);
signal a1, a2, a3, a4, aa1, aa2, aa3, aa4, nzero_ex_mem_rd, nzero_mem_wb_rd, ex_mem_w, mem_wb_w, ex_mem_to_id_ex_rs10, ex_mem_to_id_ex_rt10 : std_logic;
signal ex_mem_to_id_ex_rs01, ex_mem_to_id_ex_rt01 : std_logic;
signal r1, r2 : std_logic_vector(1 downto 0);

component and_gate is
	port (
		x : in std_logic;
		y : in std_logic;
		z : out std_logic
		);
end component;

component or_gate is
	port (
		x : in std_logic;
		y : in std_logic;
		z : out std_logic
	);
end component;

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

component not_gate is
  port (
    x   : in  std_logic;
    z   : out std_logic
  );
end component;

component mux_n is
  generic (
	n	: integer
  );
  port (
	sel	  : in	std_logic;
	src0  :	in	std_logic_vector(n-1 downto 0);
	src1  :	in	std_logic_vector(n-1 downto 0);
	z	  : out std_logic_vector(n-1 downto 0)
  );
end component;


begin

--ex_mem_rd != 0
	--nzero_ex_mem_rd <= ex_mem_rd != "00000";
	xor0: xor_gate_n generic map (n => 5) port map (
		ex_mem_rd, "00000", t1);
	or0: or_gate_1 port map (t1, nzero_ex_mem_rd);

--mem_wb_rd != 0
	--nzero_mem_wb_rd <= mem_wb_rd != "00000";
	xor00: xor_gate_n generic map (n => 5) port map (
		mem_wb_rd, "00000", t2);
	or00: or_gate_1 port map (t2, nzero_mem_wb_rd);

--ex_mem_rd == id_ex_rs
	xor1: xor_gate_n generic map (n => 5) port map (
		ex_mem_rd, id_ex_rs, v1);
	or1: or_gate_1 port map (v1, aa1);
	a1 <= not aa1;

--ex_mem_rd == id_ex_rt
	xor2: xor_gate_n generic map (n => 5) port map (
		ex_mem_rd, id_ex_rt, v2);
	or2: or_gate_1 port map (v2, aa2);
	a2 <= not aa2;

--mem_wb_rd == id_ex_rs
	xor3: xor_gate_n generic map (n => 5) port map (
		mem_wb_rd, id_ex_rs, v3);
	or3: or_gate_1 port map (v3, aa3);
	a3 <= not aa3;

--mem_wb_rd == id_ex_rt
	xor4: xor_gate_n generic map (n => 5) port map (
		mem_wb_rd, id_ex_rt, v4);
	or4: or_gate_1 port map (v4, aa4);
	a4 <= not aa4;
	
--forward A B
	and1: and_gate port map (ex_mem_we, nzero_ex_mem_rd, ex_mem_w);
	and11: and_gate port map (mem_wb_we, nzero_mem_wb_rd, mem_wb_w);
	
	and2: and_gate port map (ex_mem_w, a1, ex_mem_to_id_ex_rs10); --ForwardA 10
	
	and3: and_gate port map (ex_mem_w, a2, ex_mem_to_id_ex_rt10); --ForwardB 10
	
	ex_mem_to_id_ex_rs01 <= not(a1 and ex_mem_w) and a3 and mem_wb_w;
	ex_mem_to_id_ex_rt01 <= not(a2 and ex_mem_w) and a4 and mem_wb_w;
	
	mux1: mux_n generic map(n => 2) port map (
		ex_mem_to_id_ex_rs10, "00", "10", r1);
	mux2: mux_n generic map(n => 2) port map (
		ex_mem_to_id_ex_rs01, r1, "01", forwardA);
	mux3: mux_n generic map(n => 2) port map (
		ex_mem_to_id_ex_rt10, "00", "10", r2);
	mux4: mux_n generic map(n => 2) port map (
		ex_mem_to_id_ex_rt01, r2, "01", forwardB);
	


end structure;

	