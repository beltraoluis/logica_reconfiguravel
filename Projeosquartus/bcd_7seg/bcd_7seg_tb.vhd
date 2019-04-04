-- André Luiz Rodrigues dos Santos
-- RA1500759-UTFPR
-- Luís Henrique Beltrão Santana
-- RA906867-UTFPR
-- 20190328

library ieee;
use ieee.std_logic_1164.all;

entity bcd_7seg_tb is
end;

architecture test of bcd_7seg_tb is
	component bcd_7seg
		port(
		i: in std_logic_vector(3 downto 0);
		a, b, c, d, e ,f ,g: out std_logic
	);
	end component;
	
	signal t_i: std_logic_vector(3 downto 0):= "0000";
	signal t_a, t_b, t_c, t_d, t_e ,t_f ,t_g: std_logic;
	
	begin
		dect: bcd_7seg port map(
			i => t_i,
			a => t_a,
			b => t_b,
			c => t_c,
			d => t_d,
			e => t_e,
			f => t_f,
			g => t_g
		);
	process
	begin
		t_i <= "0000";
		wait for 50 ns;
		t_i <= "0001";
		wait for 50 ns;
		t_i <= "0010";
		wait for 50 ns;
		t_i <= "0011";
		wait for 50 ns;
		t_i <= "0100";
		wait for 50 ns;
		t_i <= "0101";
		wait for 50 ns;
		t_i <= "0110";
		wait for 50 ns;
		t_i <= "0111";
		wait for 50 ns;
		t_i <= "1000";
		wait for 50 ns;
		t_i <= "1001";
		wait for 50 ns;
		t_i <= "1010";
		wait for 50 ns;
		t_i <= "1011";
		wait for 50 ns;
		t_i <= "1100";
		wait for 50 ns;
		t_i <= "1101";
		wait for 50 ns;
		t_i <= "1110";
		wait for 50 ns;
		t_i <= "1111";
		wait for 50 ns;
	end process;
end architecture;