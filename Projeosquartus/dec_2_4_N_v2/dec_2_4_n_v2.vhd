-- Luís Henrique Beltrão Santana
-- RA906867-UTFPR
-- 20190321

library ieee;
use ieee.std_logic_1164.all;

entity dec_2_4_n_v2 is
	port(
		i0, i1, en: in std_logic;
		s0, s1, s2, s3: out std_logic
	);
end entity;

architecture behave of dec_2_4_n_v2 is
begin
	s0 <= not(en and not(i1) and not(i0));
	s1 <= not(en and not(i1) and i0);
	s2 <= not(en and i1 and not(i0));
	s3 <= not(en and i1 and i0);
end architecture;
