-- Luís Henrique Beltrão Santana
-- RA906867-UTFPR
-- 20190321

library ieee;
use ieee.std_logic_1164.all;

entity dec_2_4_n_v0 is
	port(
		i0, i1, en: in std_logic;
		s0, s1, s2, s3: out std_logic
	);
end entity;

architecture behave of dec_2_4_n_v0 is
begin
	process(en, i0, i1)
	begin
		if (en = '1') and (i1 = '0') and (i0 = '0') then
			s3 <= '1';
			s2 <= '1';
			s1 <= '1';
			s0 <= '0';
		elsif (en = '1') and (i1 = '0') and (i0 = '1') then
			s3 <= '1';
			s2 <= '1';
			s1 <= '0';
			s0 <= '1'; 
		elsif (en = '1') and (i1 = '1') and (i0 = '0') then
			s3 <= '1';
			s2 <= '0';
			s1 <= '1';
			s0 <= '1';
		elsif (en = '1') and (i1 = '1') and (i0 = '1') then
			s3 <= '0';
			s2 <= '1';
			s1 <= '1';
			s0 <= '1';
		else
			s3 <= '1';
			s2 <= '1';
			s1 <= '1';
			s0 <= '1';
		end if;
	end process;
end architecture;
