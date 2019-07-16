-- André Luiz Rodrigues dos Santos
-- RA1500759-UTFPR
-- Luís Henrique Beltrão Santana
-- RA906867-UTFPR
-- 20190328

library ieee;
use ieee.std_logic_1164.all;

entity counter1_tb is
end;

architecture test of counter1_tb is
	component counter1
		port(
		clk, rst1, rst2, en1, en2: in std_logic;
		o10, o11, o12, o13, o20, o21, o22, o23, crr1, crr2: out std_logic
	);
	end component;
	
	signal clock, reset1, reset2, enable1, enable2: std_logic := 'U';
	signal so10, so11, so12, so13, so20, so21, so22, so23, carry1, carry2: std_logic := 'U';
	begin
		dect: counter1 port map(
			clk => clock,
			rst1 => reset1,
			rst2 => reset2,
			en1 =>  enable1,
			en2 =>  enable2,
			crr1 => carry1,
			crr2 => carry2,
			o10 => so10,
			o11 => so11,
			o12 => so12,
			o13 => so13,
			o20 => so20,
			o21 => so21,
			o22 => so22,
			o23 => so23
		);
	process
	begin
	   enable1 <= '0';
		enable2 <= '0';
		reset1 <= '1';
		reset2 <= '1';
		clock <= '1';
		wait for 50 ns;
		clock <= '0';
		reset1 <= '0';
		reset2 <= '0';
		wait for 50 ns; -- 0 0
		enable1 <= '1';
		clock <= '1';
		wait for 50 ns;
		clock <= '0';
		wait for 50 ns; -- 1 0
		enable1 <= '1';
		clock <= '1';
		wait for 50 ns;
		clock <= '0';
		wait for 50 ns; -- 2 0
		enable1 <= '1';
		clock <= '1';
		wait for 50 ns;
		clock <= '0';
		wait for 50 ns; -- 3 0
		enable1 <= '0';
		clock <= '0';
		reset1 <= '1';
		wait for 50 ns;
		reset1 <= '0';
		wait for 50 ns; -- 0 0
		enable2 <= '1';
		clock <= '1';
		wait for 50 ns;
		clock <= '0';
		wait for 50 ns; -- 0 1
		enable2 <= '1';
		clock <= '1';
		wait for 50 ns;
		clock <= '0';
		wait for 50 ns; -- 0 2
		enable2 <= '1';
		clock <= '1';
		wait for 50 ns;
		clock <= '0';
		wait for 50 ns; -- 0 3
	end process;
end architecture;