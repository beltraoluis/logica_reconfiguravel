-- Luís Henrique Beltrão Santana
-- RA906867-UTFPR
-- 20190321

library ieee;
use ieee.std_logic_1164.all;

entity dec_2_4_n_v2_tb is
end;

architecture test of dec_2_4_n_v2_tb is
	component dec_2_4_n_v2
		port(
		i0, i1, en: in std_logic;
		s0, s1, s2, s3: out std_logic
	);
	end component;
	
	signal a0, a1, enable: std_logic;
	signal o0, o1, o2, o3: std_logic;
	begin
		dect: dec_2_4_n_v2 port map(
			i0 => a0,
			i1 => a1,
			en =>  enable,
			s0 => o0,
			s1 => o1,
			s2 => o2,
			s3 => o3
		);
	process
	begin
		a0 <= '0';
		a1 <= '0';
		enable <= '1';
		wait for 50 ns;
		a0 <= '1';
		a1 <= '0';
		enable <= '1';
		wait for 50 ns;
		a0 <= '0';
		a1 <= '1';
		enable <= '1';
		wait for 50 ns;
		a0 <= '1';
		a1 <= '1';
		enable <= '1';
		wait for 50 ns;
		a0 <= '0';
		a1 <= '0';
		enable <= '0';
		wait for 50 ns;
	end process;
end architecture;