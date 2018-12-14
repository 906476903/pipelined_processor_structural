library ieee;
use ieee.std_logic_1164.all;
library work;
use work.mux;

Entity sll_32 is
	port (
		A : in std_logic_vector(31 downto 0);
		B : in std_logic_vector(4 downto 0);
		result : out std_logic_vector(31 downto 0)
	);
end sll_32;

architecture structural of sll_32 is
	signal vec0, vec1, vec2, vec3, vec4 : std_logic_vector(31 downto 0);
begin
	zero0 : entity mux(structural)
		port map(B(0), A(31), A(30), vec0(31));
	zero1 : entity mux(structural)
		port map(B(0), A(30), A(29), vec0(30));
	zero2 : entity mux(structural)
		port map(B(0), A(29), A(28), vec0(29));
	zero3 : entity mux(structural)
		port map(B(0), A(28), A(27), vec0(28));
	zero4 : entity mux(structural)
		port map(B(0), A(27), A(26), vec0(27));
	zero5 : entity mux(structural)
		port map(B(0), A(26), A(25), vec0(26));
	zero6 : entity mux(structural)
		port map(B(0), A(25), A(24), vec0(25));
	zero7 : entity mux(structural)
		port map(B(0), A(24), A(23), vec0(24));
	zero8 : entity mux(structural)
		port map(B(0), A(23), A(22), vec0(23));
	zero9 : entity mux(structural)
		port map(B(0), A(22), A(21), vec0(22));
	zero10 : entity mux(structural)
		port map(B(0), A(21), A(20), vec0(21));
	zero11 : entity mux(structural)
		port map(B(0), A(20), A(19), vec0(20));
	zero12 : entity mux(structural)
		port map(B(0), A(19), A(18), vec0(19));
	zero13 : entity mux(structural)
		port map(B(0), A(18), A(17), vec0(18));
	zero14 : entity mux(structural)
		port map(B(0), A(17), A(16), vec0(17));
	zero15 : entity mux(structural)
		port map(B(0), A(16), A(15), vec0(16));
	zero16 : entity mux(structural)
		port map(B(0), A(15), A(14), vec0(15));
	zero17 : entity mux(structural)
		port map(B(0), A(14), A(13), vec0(14));
	zero18 : entity mux(structural)
		port map(B(0), A(13), A(12), vec0(13));
	zero19 : entity mux(structural)
		port map(B(0), A(12), A(11), vec0(12));
	zero20 : entity mux(structural)
		port map(B(0), A(11), A(10), vec0(11));
	zero21 : entity mux(structural)
		port map(B(0), A(10), A(9), vec0(10));
	zero22 : entity mux(structural)
		port map(B(0), A(9), A(8), vec0(9));
	zero23 : entity mux(structural)
		port map(B(0), A(8), A(7), vec0(8));
	zero24 : entity mux(structural)
		port map(B(0), A(7), A(6), vec0(7));
	zero25 : entity mux(structural)
		port map(B(0), A(6), A(5), vec0(6));
	zero26 : entity mux(structural)
		port map(B(0), A(5), A(4), vec0(5));
	zero27 : entity mux(structural)
		port map(B(0), A(4), A(3), vec0(4));
	zero28 : entity mux(structural)
		port map(B(0), A(3), A(2), vec0(3));
	zero29 : entity mux(structural)
		port map(B(0), A(2), A(1), vec0(2));
	zero30 : entity mux(structural)
		port map(B(0), A(1), A(0), vec0(1));
	zero31 : entity mux(structural)
		port map(B(0), A(0), '0', vec0(0));
	one0 : entity mux(structural)
		port map(B(1), vec0(31), vec0(29), vec1(31));
	one1 : entity mux(structural)
		port map(B(1), vec0(30), vec0(28), vec1(30));
	one2 : entity mux(structural)
		port map(B(1), vec0(29), vec0(27), vec1(29));
	one3 : entity mux(structural)
		port map(B(1), vec0(28), vec0(26), vec1(28));
	one4 : entity mux(structural)
		port map(B(1), vec0(27), vec0(25), vec1(27));
	one5 : entity mux(structural)
		port map(B(1), vec0(26), vec0(24), vec1(26));
	one6 : entity mux(structural)
		port map(B(1), vec0(25), vec0(23), vec1(25));
	one7 : entity mux(structural)
		port map(B(1), vec0(24), vec0(22), vec1(24));
	one8 : entity mux(structural)
		port map(B(1), vec0(23), vec0(21), vec1(23));
	one9 : entity mux(structural)
		port map(B(1), vec0(22), vec0(20), vec1(22));
	one10 : entity mux(structural)
		port map(B(1), vec0(21), vec0(19), vec1(21));
	one11 : entity mux(structural)
		port map(B(1), vec0(20), vec0(18), vec1(20));
	one12 : entity mux(structural)
		port map(B(1), vec0(19), vec0(17), vec1(19));
	one13 : entity mux(structural)
		port map(B(1), vec0(18), vec0(16), vec1(18));
	one14 : entity mux(structural)
		port map(B(1), vec0(17), vec0(15), vec1(17));
	one15 : entity mux(structural)
		port map(B(1), vec0(16), vec0(14), vec1(16));
	one16 : entity mux(structural)
		port map(B(1), vec0(15), vec0(13), vec1(15));
	one17 : entity mux(structural)
		port map(B(1), vec0(14), vec0(12), vec1(14));
	one18 : entity mux(structural)
		port map(B(1), vec0(13), vec0(11), vec1(13));
	one19 : entity mux(structural)
		port map(B(1), vec0(12), vec0(10), vec1(12));
	one20 : entity mux(structural)
		port map(B(1), vec0(11), vec0(9), vec1(11));
	one21 : entity mux(structural)
		port map(B(1), vec0(10), vec0(8), vec1(10));
	one22 : entity mux(structural)
		port map(B(1), vec0(9), vec0(7), vec1(9));
	one23 : entity mux(structural)
		port map(B(1), vec0(8), vec0(6), vec1(8));
	one24 : entity mux(structural)
		port map(B(1), vec0(7), vec0(5), vec1(7));
	one25 : entity mux(structural)
		port map(B(1), vec0(6), vec0(4), vec1(6));
	one26 : entity mux(structural)
		port map(B(1), vec0(5), vec0(3), vec1(5));
	one27 : entity mux(structural)
		port map(B(1), vec0(4), vec0(2), vec1(4));
	one28 : entity mux(structural)
		port map(B(1), vec0(3), vec0(1), vec1(3));
	one29 : entity mux(structural)
		port map(B(1), vec0(2), vec0(0), vec1(2));
	one30 : entity mux(structural)
		port map(B(1), vec0(1), '0', vec1(1));
	one31 : entity mux(structural)
		port map(B(1), vec0(0), '0', vec1(0));
	two0 : entity mux(structural)
		port map(B(2), vec1(31), vec1(27), vec2(31));
	two1 : entity mux(structural)
		port map(B(2), vec1(30), vec1(26), vec2(30));
	two2 : entity mux(structural)
		port map(B(2), vec1(29), vec1(25), vec2(29));
	two3 : entity mux(structural)
		port map(B(2), vec1(28), vec1(24), vec2(28));
	two4 : entity mux(structural)
		port map(B(2), vec1(27), vec1(23), vec2(27));
	two5 : entity mux(structural)
		port map(B(2), vec1(26), vec1(22), vec2(26));
	two6 : entity mux(structural)
		port map(B(2), vec1(25), vec1(21), vec2(25));
	two7 : entity mux(structural)
		port map(B(2), vec1(24), vec1(20), vec2(24));
	two8 : entity mux(structural)
		port map(B(2), vec1(23), vec1(19), vec2(23));
	two9 : entity mux(structural)
		port map(B(2), vec1(22), vec1(18), vec2(22));
	two10 : entity mux(structural)
		port map(B(2), vec1(21), vec1(17), vec2(21));
	two11 : entity mux(structural)
		port map(B(2), vec1(20), vec1(16), vec2(20));
	two12 : entity mux(structural)
		port map(B(2), vec1(19), vec1(15), vec2(19));
	two13 : entity mux(structural)
		port map(B(2), vec1(18), vec1(14), vec2(18));
	two14 : entity mux(structural)
		port map(B(2), vec1(17), vec1(13), vec2(17));
	two15 : entity mux(structural)
		port map(B(2), vec1(16), vec1(12), vec2(16));
	two16 : entity mux(structural)
		port map(B(2), vec1(15), vec1(11), vec2(15));
	two17 : entity mux(structural)
		port map(B(2), vec1(14), vec1(10), vec2(14));
	two18 : entity mux(structural)
		port map(B(2), vec1(13), vec1(9), vec2(13));
	two19 : entity mux(structural)
		port map(B(2), vec1(12), vec1(8), vec2(12));
	two20 : entity mux(structural)
		port map(B(2), vec1(11), vec1(7), vec2(11));
	two21 : entity mux(structural)
		port map(B(2), vec1(10), vec1(6), vec2(10));
	two22 : entity mux(structural)
		port map(B(2), vec1(9), vec1(5), vec2(9));
	two23 : entity mux(structural)
		port map(B(2), vec1(8), vec1(4), vec2(8));
	two24 : entity mux(structural)
		port map(B(2), vec1(7), vec1(3), vec2(7));
	two25 : entity mux(structural)
		port map(B(2), vec1(6), vec1(2), vec2(6));
	two26 : entity mux(structural)
		port map(B(2), vec1(5), vec1(1), vec2(5));
	two27 : entity mux(structural)
		port map(B(2), vec1(4), vec1(0), vec2(4));
	two28 : entity mux(structural)
		port map(B(2), vec1(3), '0', vec2(3));
	two29 : entity mux(structural)
		port map(B(2), vec1(2), '0', vec2(2));
	two30 : entity mux(structural)
		port map(B(2), vec1(1), '0', vec2(1));
	two31 : entity mux(structural)
		port map(B(2), vec1(0), '0', vec2(0));
	three0 : entity mux(structural)
		port map(B(3), vec2(31), vec2(23), vec3(31));
	three1 : entity mux(structural)
		port map(B(3), vec2(30), vec2(22), vec3(30));
	three2 : entity mux(structural)
		port map(B(3), vec2(29), vec2(21), vec3(29));
	three3 : entity mux(structural)
		port map(B(3), vec2(28), vec2(20), vec3(28));
	three4 : entity mux(structural)
		port map(B(3), vec2(27), vec2(19), vec3(27));
	three5 : entity mux(structural)
		port map(B(3), vec2(26), vec2(18), vec3(26));
	three6 : entity mux(structural)
		port map(B(3), vec2(25), vec2(17), vec3(25));
	three7 : entity mux(structural)
		port map(B(3), vec2(24), vec2(16), vec3(24));
	three8 : entity mux(structural)
		port map(B(3), vec2(23), vec2(15), vec3(23));
	three9 : entity mux(structural)
		port map(B(3), vec2(22), vec2(14), vec3(22));
	three10 : entity mux(structural)
		port map(B(3), vec2(21), vec2(13), vec3(21));
	three11 : entity mux(structural)
		port map(B(3), vec2(20), vec2(12), vec3(20));
	three12 : entity mux(structural)
		port map(B(3), vec2(19), vec2(11), vec3(19));
	three13 : entity mux(structural)
		port map(B(3), vec2(18), vec2(10), vec3(18));
	three14 : entity mux(structural)
		port map(B(3), vec2(17), vec2(9), vec3(17));
	three15 : entity mux(structural)
		port map(B(3), vec2(16), vec2(8), vec3(16));
	three16 : entity mux(structural)
		port map(B(3), vec2(15), vec2(7), vec3(15));
	three17 : entity mux(structural)
		port map(B(3), vec2(14), vec2(6), vec3(14));
	three18 : entity mux(structural)
		port map(B(3), vec2(13), vec2(5), vec3(13));
	three19 : entity mux(structural)
		port map(B(3), vec2(12), vec2(4), vec3(12));
	three20 : entity mux(structural)
		port map(B(3), vec2(11), vec2(3), vec3(11));
	three21 : entity mux(structural)
		port map(B(3), vec2(10), vec2(2), vec3(10));
	three22 : entity mux(structural)
		port map(B(3), vec2(9), vec2(1), vec3(9));
	three23 : entity mux(structural)
		port map(B(3), vec2(8), vec2(0), vec3(8));
	three24 : entity mux(structural)
		port map(B(3), vec2(7), '0', vec3(7));
	three25 : entity mux(structural)
		port map(B(3), vec2(6), '0', vec3(6));
	three26 : entity mux(structural)
		port map(B(3), vec2(5), '0', vec3(5));
	three27 : entity mux(structural)
		port map(B(3), vec2(4), '0', vec3(4));
	three28 : entity mux(structural)
		port map(B(3), vec2(3), '0', vec3(3));
	three29 : entity mux(structural)
		port map(B(3), vec2(2), '0', vec3(2));
	three30 : entity mux(structural)
		port map(B(3), vec2(1), '0', vec3(1));
	three31 : entity mux(structural)
		port map(B(3), vec2(0), '0', vec3(0));
	four0 : entity mux(structural)
		port map(B(4), vec3(31), vec3(15), result(31));
	four1 : entity mux(structural)
		port map(B(4), vec3(30), vec3(14), result(30));
	four2 : entity mux(structural)
		port map(B(4), vec3(29), vec3(13), result(29));
	four3 : entity mux(structural)
		port map(B(4), vec3(28), vec3(12), result(28));
	four4 : entity mux(structural)
		port map(B(4), vec3(27), vec3(11), result(27));
	four5 : entity mux(structural)
		port map(B(4), vec3(26), vec3(10), result(26));
	four6 : entity mux(structural)
		port map(B(4), vec3(25), vec3(9), result(25));
	four7 : entity mux(structural)
		port map(B(4), vec3(24), vec3(8), result(24));
	four8 : entity mux(structural)
		port map(B(4), vec3(23), vec3(7), result(23));
	four9 : entity mux(structural)
		port map(B(4), vec3(22), vec3(6), result(22));
	four10 : entity mux(structural)
		port map(B(4), vec3(21), vec3(5), result(21));
	four11 : entity mux(structural)
		port map(B(4), vec3(20), vec3(4), result(20));
	four12 : entity mux(structural)
		port map(B(4), vec3(19), vec3(3), result(19));
	four13 : entity mux(structural)
		port map(B(4), vec3(18), vec3(2), result(18));
	four14 : entity mux(structural)
		port map(B(4), vec3(17), vec3(1), result(17));
	four15 : entity mux(structural)
		port map(B(4), vec3(16), vec3(0), result(16));
	four16 : entity mux(structural)
		port map(B(4), vec3(15), '0', result(15));
	four17 : entity mux(structural)
		port map(B(4), vec3(14), '0', result(14));
	four18 : entity mux(structural)
		port map(B(4), vec3(13), '0', result(13));
	four19 : entity mux(structural)
		port map(B(4), vec3(12), '0', result(12));
	four20 : entity mux(structural)
		port map(B(4), vec3(11), '0', result(11));
	four21 : entity mux(structural)
		port map(B(4), vec3(10), '0', result(10));
	four22 : entity mux(structural)
		port map(B(4), vec3(9), '0', result(9));
	four23 : entity mux(structural)
		port map(B(4), vec3(8), '0', result(8));
	four24 : entity mux(structural)
		port map(B(4), vec3(7), '0', result(7));
	four25 : entity mux(structural)
		port map(B(4), vec3(6), '0', result(6));
	four26 : entity mux(structural)
		port map(B(4), vec3(5), '0', result(5));
	four27 : entity mux(structural)
		port map(B(4), vec3(4), '0', result(4));
	four28 : entity mux(structural)
		port map(B(4), vec3(3), '0', result(3));
	four29 : entity mux(structural)
		port map(B(4), vec3(2), '0', result(2));
	four30 : entity mux(structural)
		port map(B(4), vec3(1), '0', result(1));
	four31 : entity mux(structural)
		port map(B(4), vec3(0), '0', result(0));
end structural;
