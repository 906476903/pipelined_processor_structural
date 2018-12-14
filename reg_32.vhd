library ieee;
use ieee.std_logic_1164.all;
library work;
use work.eecs361_gates.all;
use work.mux_8_1_32;
use work.dff_32;
use work.mux_n;
use work.mux_32;
use work.dec_n;

Entity reg_32 is
	port (
		busw : in std_logic_vector(31 downto 0);
		clk : in std_logic;
		reset : in std_logic;--active high
		regwr : in std_logic;
		--regdst : in std_logic;
		rs : in std_logic_vector(4 downto 0);
		rt : in std_logic_vector(4 downto 0);
		rw : in std_logic_vector(4 downto 0);
		busa : out std_logic_vector(31 downto 0);
		busb : out std_logic_vector(31 downto 0)
	);
end reg_32;

Architecture structural of reg_32 is
	--signal rw : std_logic_vector(4 downto 0);
	signal rw_decode : std_logic_vector(31 downto 0);
	type qarray is array (31 downto 0) of std_logic_vector(31 downto 0);
	signal Q_array : qarray;
	type tmp_array is array(3 downto 0) of std_logic_vector(31 downto 0);
	signal tmp_array_0 : tmp_array;
	signal tmp_array_1 : tmp_array;
	signal tmp_2 : std_logic_vector(31 downto 0);
	signal tmp_3 : std_logic_vector(31 downto 0);
	signal tmp_4 : std_logic_vector(31 downto 0);
	signal tmp_5 : std_logic_vector(31 downto 0);
	signal rw_mask : std_logic_vector(31 downto 0);
begin
	--g0 : entity mux_n generic map(5)
		--port map(regdst, rt, rd, rw);
	g1 : entity dec_n generic map(5)
		port map(rw, rw_decode);

	read_loop_0 : for i in 0 to 3 generate
		g2 : entity mux_8_1_32(structural)
			port map(rs(2 downto 0), Q_array(8*i), Q_array(8*i+1), Q_array(8*i+2), Q_array(8*i+3), Q_array(8*i+4), Q_array(8*i+5), Q_array(8*i+6), Q_array(8*i+7), tmp_array_0(i));
		g3 : entity mux_8_1_32(structural)
			port map(rt(2 downto 0), Q_array(8*i), Q_array(8*i+1), Q_array(8*i+2), Q_array(8*i+3), Q_array(8*i+4), Q_array(8*i+5), Q_array(8*i+6), Q_array(8*i+7), tmp_array_1(i));
	end generate read_loop_0;

	g4 : entity mux_32(structural)
			port map(rs(3), tmp_array_0(0), tmp_array_0(1), tmp_2);
	g5 : entity mux_32(structural)
			port map(rs(3), tmp_array_0(2), tmp_array_0(3), tmp_3);
	g6 : entity mux_32(structural)
			port map(rs(4), tmp_2, tmp_3, busa);
	g7 : entity mux_32(structural)
			port map(rt(3), tmp_array_1(0), tmp_array_1(1), tmp_4);
	g8 : entity mux_32(structural)
			port map(rt(3), tmp_array_1(2), tmp_array_1(3), tmp_5);
	g9 : entity mux_32(structural)
			port map(rt(4), tmp_4, tmp_5, busb);

	write_loop : for i in 0 to 31 generate
		g10 : entity work.and_gate(dataflow)
			port map(rw_decode(i), regwr, rw_mask(i));
	end generate write_loop;

	reg0 : entity dff_32(structural)
		port map("00000000000000000000000000000000", clk, reset, '1', Q_array(0));
	reg_loop : for i in 0 to 31 generate
		reg1 : entity dff_32(structural)
			port map(busw, clk, reset, rw_mask(i), Q_array(i));
	end generate reg_loop;
end architecture structural;
