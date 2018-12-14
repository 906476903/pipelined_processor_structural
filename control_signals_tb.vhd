library ieee;
use ieee.std_logic_1164.all;
library work;
use work.eecs361_gates.all;
use work.aluctr_decoder;
use work.mux;

entity control_signal_tb is
	port(	aluop  : out std_logic_vector(3 downto 0);
		regDst : out std_logic;
		aluSrc : out std_logic;
		memToReg : out std_logic;
		regWr : out std_logic;
		memRead : out std_logic;
		memWr : out std_logic;
		beq : out std_logic;
		bneq   : out std_logic;
		bgtz : out std_logic;
		extop : out std_logic
		);
end control_signal_tb;

architecture behavior of control_signal_tb is

component control_signal is
	port (
		op : in std_logic_vector(5 downto 0);
		func  : in std_logic_vector(5 downto 0);
		aluop  : out std_logic_vector(3 downto 0);
		regDst : out std_logic;
		aluSrc : out std_logic;
		memToReg : out std_logic;
		regWr : out std_logic;
		memRead : out std_logic;
		memWr : out std_logic;
		beq : out std_logic;
		bneq   : out std_logic;
		bgtz : out std_logic;
		extop : out std_logic
		);
end component;

signal op_tb : std_logic_vector(5 downto 0);
signal func_tb : std_logic_vector(5 downto 0);

begin

dut:control_signal
	port map(op => op_tb,
	func => func_tb,
	aluop => aluop,
	regDst => regDst,
	aluSrc => aluSrc,
	memToReg => memToReg,
	regWr => regWr,
	memRead => memRead,
	memWr => memWr,
	beq => beq,
	bneq => bneq,
	bgtz => bgtz,
	extop => extop);

test_control_signal:process is
  begin
	-- Test add
      op_tb <= "000000";
			func_tb <= "100000";
            wait for 5 ns;

        -- Test addu
      op_tb <= "000000";
			func_tb <= "100001";
	    wait for 5 ns;

	-- Test sub
      op_tb <= "000000";
			func_tb <= "100010";
            wait for 5 ns;

        -- Test subu
      op_tb <= "000000";
			func_tb <= "100011";
	    wait for 5 ns;

	-- Test and
      op_tb <= "000000";
			func_tb <= "100100";
            wait for 5 ns;
				
	-- Test or
      op_tb <= "000000";
			func_tb <= "100101";
            wait for 5 ns;
				
	-- Test slt
      op_tb <= "000000";
			func_tb <= "101010";
            wait for 5 ns;

	-- Test sltu
      op_tb <= "000000";
			func_tb <= "101011";
	    wait for 5 ns;

	-- Test sll
      op_tb <= "000000";
			func_tb <= "000000";
            wait for 5 ns;

	-- Test addi
      op_tb <= "001000";
			func_tb <= "000000";
            wait for 5 ns;
           
        -- Test beq
      op_tb <= "000100";
			func_tb <= "000000";
            wait for 5 ns;
            
        -- Test bne
      op_tb <= "000101";
			func_tb <= "000000";
            wait for 5 ns;

	-- Test bgtz
      op_tb <= "000111";
			func_tb <= "000000";
	    wait for 5 ns;
            
        -- Test lw
      op_tb <= "100011";
			func_tb <= "000000";
            wait for 5 ns;

        -- Test sw
      op_tb <= "101011";
			func_tb <= "000000";
            wait for 5 ns;
            wait;
 end process;
end behavior;








