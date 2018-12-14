library ieee;
use ieee.std_logic_1164.all;
library work;
use work.eecs361_gates.all;
use work.aluctr_decoder;




entity control_signal is
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
		bneq : out std_logic;
		bgtz : out std_logic;
		extop : out std_logic
		);
end control_signal;




architecture struc of control_signal is

signal rtype : std_logic;
signal lwop : std_logic;
signal swop : std_logic;
signal addi : std_logic;
signal tmp1 : std_logic;
signal tmp11 : std_logic;
signal tmp2 : std_logic;
signal tmp3 : std_logic;
signal wbranch : std_logic;
signal bgtz0 : std_logic;
signal bneq0 : std_logic;
signal beq0 : std_logic;
signal sll_s : std_logic;
signal sltu : std_logic;
signal or1, or2, or3, or4, or5 : std_logic;
signal t0, t1, t2, t3, t4, t5, t6, q1, q2, q3, q4, q5, q6 : std_logic;
signal u1, u2, u3, u4, u5, u6, p1, p2, p3, p4, p5, p6 : std_logic;
signal w1, w2, w3, w4, w5, w6, w7, z0, z1, z2, z3, z4, z5, z6, z7 : std_logic;
signal s1, s2, s3, s4, s5, s6, h2, h3, h4, h5, h6, h7, nota0 : std_logic;
signal nota1, nota2, notf0, notf1, notf2, notf3, j1, j2, j3, j4, g1, g2 : std_logic;
signal g3, g4, g5, g6, g7, g8, g9, gg1, gg2, gg3, gg4, gg5, gg6, gg7, gg8, gg9, gg10 : std_logic;
signal aluctr : std_logic_vector(2 downto 0);
signal alu3op : std_logic_vector(2 downto 0);

component mux is
	port (
		sel : in std_logic;
		src0 : in std_logic;
		scr1 : in std_logic;
		z : out std_logic
		);
end component;

component or_gate is
	port (
		x : in std_logic;
		y: in std_logic;
		z : out std_logic
		);
end component;

component aluctr_decoder is
	port (
		A : in std_logic_vector(2 downto 0);
		result : out std_logic_vector(3 downto 0)
		);
end component;

component not_gate is
  port (
    x   : in  std_logic;
    z   : out std_logic
  );
end component;
begin
--rtype <= not(op(0) or op(1) or op(2) or op(3) or op(4) or op(5));--000000
or_gate1 : or_gate port map(x => op(0), y => op(1) , z=>or1);
or_gate2 : or_gate port map(x => or1, y => op(2) , z=>or2);
or_gate3 : or_gate port map(x => or2, y => op(3) , z=>or3);
or_gate4 : or_gate port map(x => or3, y => op(4) , z=>or4);
or_gate5 : or_gate port map(x => or4, y => op(5) , z=>or5);
not_map_0 : not_gate port map(x => or5, z => rtype);
--------regDst

regDst <= rtype;

---------aluSrc



--lwop <= (op(5) and (not op(4)) and (not op(3)) and (not op(2)) and op(1) and op(0)); --100011
not_map_1 : not_gate port map(x => op(4), z => t0);
not_map_2 : not_gate port map(x => op(3), z => t1);
not_map_3 : not_gate port map(x => op(2), z => t2);
and_gate4 : and_gate port map(x => t1, y => t0, z=>t3);
and_gate5 : and_gate port map(x => t2, y => t3, z=>t4);
and_gate6 : and_gate port map(x => t4, y => op(5), z=>t5);
and_gate7 : and_gate port map(x => t5, y => op(1), z=>t6);
and_gate8 : and_gate port map(x => t6, y => op(0), z=>lwop);



--swop <= (op(5) and (not op(4)) and op(3) and (not op(2)) and op(1) and op(0));--101011
not_map_9 : not_gate port map(x => op(4), z => q1);
not_map_10 : not_gate port map(x => op(2), z => q2);
and_gate11 : and_gate port map(x => q1, y => q2, z=>q3);
and_gate12 : and_gate port map(x => q3, y => op(5), z=>q4);
and_gate13 : and_gate port map(x => q4, y => op(3), z=>q5);
and_gate14 : and_gate port map(x => q5, y => op(1), z=>q6);
and_gate15 : and_gate port map(x => q6, y => op(0), z=>swop);


--addi <= not(op(5) or op(4) or (not op(3)) or op(2) or op(1) or op(0));--001000
not_map_16 : not_gate port map(x => op(3), z => u1);
or_gate17 : or_gate port map(x => op(5), y => u1, z=>u2);
or_gate18 : or_gate port map(x => op(4), y => u2, z=>u3);
or_gate19 : or_gate port map(x => op(2), y => u3, z=>u4);
or_gate20 : or_gate port map(x => op(1), y => u4, z=>u5);
or_gate21 : or_gate port map(x => op(0), y => u5, z=>u6);
not_map_22 : not_gate port map(x => u6, z => addi);


or_gate_map_0 : or_gate port map(x => lwop, y => swop , z=>tmp1);
or_gate_map_00 : or_gate port map(x => tmp1, y=>sll_s, z=>tmp11);

or_gate_map_1 : or_gate port map(x => tmp11, y => addi , z=>aluSrc);

---------memToReg
memToReg <= lwop;

-----------regWr
or_gate_map_2 : or_gate port map(x => rtype, y => addi , z=>tmp2);
or_gate_map_3 : or_gate port map(x => tmp2, y => lwop, z=>regWr);


----------memRead

memRead <=lwop;--? memToReg

----------memWr
memWr <= swop;



-----------branch
--beq0 <= not (op(5) or op(4) or op(3) or not op(2) or op(1) or op(0));--000100
not_map_23 : not_gate port map(x => op(2), z => p1);
or_gate24 : or_gate port map(x => op(5), y => p1, z=>p2);
or_gate25 : or_gate port map(x => op(4), y => p2, z=>p3);
or_gate26 : or_gate port map(x => op(3), y => p3, z=>p4);
or_gate27 : or_gate port map(x => op(1), y => p4, z=>p5);
or_gate28 : or_gate port map(x => op(0), y => p5, z=>p6);
not_map_29 : not_gate port map(x => p6, z => beq0);

beq <= beq0;
--bneq0 <= not (op(5) or op(4) or op(3) or not op(2) or op(1) or not op(0));--000101
not_map_30 : not_gate port map(x => op(2), z => w1);
not_map_31 : not_gate port map(x => op(0), z => w2);
or_gate32 : or_gate port map(x => w1, y => w2, z=>w3);
or_gate33 : or_gate port map(x => op(5), y => w3, z=>w4);
or_gate34 : or_gate port map(x => op(4), y => w4, z=>w5);
or_gate35 : or_gate port map(x => op(3), y => w5, z=>w6);
or_gate36 : or_gate port map(x => op(1), y => w6, z=>w7);
not_map_37 : not_gate port map(x => w7, z => bneq0);

bneq <= bneq0;
--bgtz0 <= (not op(5) and not op(4) and not op(3) and op(2) and op(1) and op(0));--000111
not_map_38 : not_gate port map(x => op(5), z => z0);
not_map_39 : not_gate port map(x => op(4), z => z1);
not_map_40 : not_gate port map(x => op(3), z => z2);
and_gate40 : and_gate port map(x => z0, y => z1, z=>z3);
and_gate41 : and_gate port map(x => z2, y => z3, z=>z4);
and_gate42 : and_gate port map(x => op(2), y => z4, z=>z5);
and_gate43 : and_gate port map(x => op(1), y => z5, z=>z6);
and_gate44 : and_gate port map(x => op(0), y => z6, z=>bgtz0);


bgtz <= bgtz0;
or_gate_map_4 : or_gate port map(x => beq0, y => bneq0 , z=>tmp3);
or_gate_map_5 : or_gate port map(x => tmp3, y => bgtz0 , z=>wbranch);

------------extop
or_gate_map_7 : or_gate port map(x => lwop, y => swop, z=> extop);




-------------aluop

alu3op(2) <= '1' and rtype;
alu3op(1) <= '1' and addi;
alu3op(0) <= '1' and wbranch;

--sltu <= (func(5) and not func(4) and func(3) and not func(2) and func(1) and func(0));--func 101011
not_map_46 : not_gate port map(x => func(4), z => s1);
not_map_47 : not_gate port map(x => func(2), z => s2);
and_gate48 : and_gate port map(x => s2, y => s1, z=>s3);
and_gate49 : and_gate port map(x => func(3), y => s3, z=>s4);
and_gate50 : and_gate port map(x => func(1), y => s4, z=>s5);
and_gate51 : and_gate port map(x => func(0), y => s5, z=>s6);
and_gate52 : and_gate port map(x => func(5), y => s6, z=>sltu);



--sll_s <= not(func(0) or func(1) or func(2) or func(3) or func(4) or func(5)) and rtype;--func 000000

or_gate53 : or_gate port map(x => func(0), y => func(5), z=>h2);
or_gate54 : or_gate port map(x => func(1), y => h2, z=>h3);
or_gate55 : or_gate port map(x => func(2), y => h3, z=>h4);
or_gate56 : or_gate port map(x => func(3), y => h4, z=>h5);
or_gate57 : or_gate port map(x => func(4), y => h5, z=>h6);
not_map_58 : not_gate port map(x => h6, z => h7);
and_map_53_0 : and_gate port map(x => h7, y => rtype, z=>sll_s);






--aluctr(2) <= (not alu3op(2) and alu3op(0)) 
--				or (alu3op(2) and not func(2) and func(1));
not_map59 : not_gate port map(x => alu3op(2), z => nota2);
and_gate60 : and_gate port map(x => nota2, y => alu3op(0), z=>j1);

not_map61 : not_gate port map(x => func(2), z => notf2);
and_gate62 : and_gate port map(x => notf2, y => alu3op(2), z=>j3);
and_gate63 : and_gate port map(x => j3, y => func(1), z=>j4);
or_gate64 : or_gate port map(x => j1, y => j4, z=>aluctr(2));

--aluctr(1) <=  (not alu3op(2) and not alu3op(1)) 
--				or (alu3op(2) and not func(2) and not func(0))
--				or (not alu3op(2) and alu3op(1) and not alu3op(0))
--				or (alu3op(2) and not func(3) and not func(2) and func(0));
				
not_map65 : not_gate port map(x => alu3op(1), z => nota1);
and_gate66 : and_gate port map(x => nota2, y => nota1, z=>g1);

not_map67 : not_gate port map(x => func(0), z => notf0);
and_gate68 : and_gate port map(x => alu3op(2), y => notf2, z=>gg1);
and_gate69 : and_gate port map(x => notf0, y => gg1, z=>g2);

not_map70 : not_gate port map(x => alu3op(0), z => nota0);
and_gate71 : and_gate port map(x => nota2, y => nota0, z=>gg2);
and_gate72 : and_gate port map(x => gg2, y => alu3op(1), z=>g3);

not_map73 : not_gate port map(x => func(3), z => notf3);
and_gate74 : and_gate port map(x => alu3op(2), y => notf3, z=>gg3);
and_gate75 : and_gate port map(x => notf2, y => gg3, z=>gg4);
and_gate76 : and_gate port map(x => func(0), y => gg4, z=>g4);

or_gate77 : or_gate port map(x => g1, y => g2, z=>g5);
or_gate78 : or_gate port map(x => g5, y => g3, z=>g6);
or_gate79 : or_gate port map(x => g6, y => g4, z=>aluctr(1));

--aluctr(0) <= (alu3op(2) and not func(3) and func(2) and not func(1) and func(0)) or
--			(alu3op(2) and func(3) and not func(2) and func(1) and not func(0))
--			or (sll_s);
			
not_map80 : not_gate port map(x => func(1), z => notf1);
and_gate81 : and_gate port map(x => alu3op(2), y => notf3, z=>gg5);
and_gate82 : and_gate port map(x => func(2), y => gg5, z=>gg6);
and_gate83 : and_gate port map(x => notf1, y => gg6, z=>gg7);
and_gate84 : and_gate port map(x => func(0), y => gg7, z=>g7);

and_gate85 : and_gate port map(x => alu3op(2), y => notf0, z=>gg8);
and_gate86 : and_gate port map(x => func(3), y => gg8, z=>gg9);
and_gate87 : and_gate port map(x => notf2, y => gg9, z=>gg10);
and_gate88 : and_gate port map(x => func(1), y => gg10, z=>g8);

or_gate89 : or_gate port map(x => g7, y => g8, z=>g9);
or_gate90 : or_gate port map(x => sll_s, y => g9, z=>aluctr(0));

			
alu_decoder_map : aluctr_decoder port map(A => aluctr, result => aluop);












end architecture struc;
