library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.eecs361.all;
use work.reg_1;
use work.reg_n;

entity id_ex_ctr_reg_tb is
	port(
	instruction_out : out std_logic_vector(31 downto 0);
	extop_out : out std_logic;
	alusrc_out : out std_logic;
	aluop_out : out std_logic_vector(3 downto 0);
	regdst_out : out std_logic;
	memwr_out : out std_logic;
	branch_out : out std_logic;
	memtoreg_out : out std_logic;
	regwr_out : out std_logic);
end id_ex_ctr_reg_tb;

architecture behavior of id_ex_ctr_reg_tb is

component id_ex_ctr_reg is
  port (
	instruction_in : in std_logic_vector(31 downto 0);
	extop_in : in std_logic;
	alusrc_in : in std_logic;
	aluop_in : in std_logic_vector(3 downto 0);
	regdst_in : in std_logic;
	memwr_in : in std_logic;
	--branch_in : in std_logic;
	memtoreg_in : in std_logic;
	regwr_in : in std_logic;
	clk : in std_logic;
	instruction_out : out std_logic_vector(31 downto 0);
	extop_out : out std_logic;
	alusrc_out : out std_logic;
	aluop_out : out std_logic_vector(3 downto 0);
	regdst_out : out std_logic;
	memwr_out : out std_logic;
	--branch_out : out std_logic;
	memtoreg_out : out std_logic;
	regwr_out : out std_logic
  );
end component;

signal instruction_in : std_logic_vector(31 downto 0) := X"00000000";
signal extop_in : std_logic := '0';
signal alusrc_in : std_logic := '0';
signal aluop_in : std_logic_vector(3 downto 0) := "0000";
signal regdst_in :  std_logic := '0';
signal memwr_in : std_logic := '0';
--signal branch_in : std_logic := '0';
signal memtoreg_in : std_logic := '0';
signal regwr_in : std_logic := '0';
signal clk : std_logic := '0';

begin
dut:id_ex_ctr_reg port map(instruction_in,extop_in,alusrc_in,aluop_in,regdst_in,memwr_in,memtoreg_in,regwr_in,clk,
			instruction_out,extop_out,alusrc_out,aluop_out,regdst_out,memwr_out,memtoreg_out,regwr_out);

test_id_ex_ctr_reg:process is
  begin
	wait for 10 ns;
	extop_in<='1';
	instruction_in<=X"00000001";
	alusrc_in<='1';
	aluop_in<="1111";
	regdst_in<='1';
	memwr_in<='1';
	--branch_in<='1';
	memtoreg_in<='1';
	regwr_in<='1';
	wait for 10 ns;
	clk <= '1';
	wait for 10 ns;
	clk<= '0';
	wait;
  end process;
end behavior;













