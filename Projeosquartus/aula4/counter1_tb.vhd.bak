-- André Luiz Rodrigues dos Santos
-- RA1500759-UTFPR
-- Luís Henrique Beltrão Santana
-- RA906867-UTFPR
-- 20190328

library ieee;
use ieee.std_logic_1164.all;

entity counter4b_tb is
end;

architecture test of counter4b_tb is
	component counter4b
		port(
		clk, rst1, rst2, en1, en2: in std_logic;
		o10, o11, o12, o13, o20, o21, o22, o23, crr1, crr2: out std_logic
	);
	end component;
	
	signal clock, reset1, reset2, enable1: std_logic;
	signal so0, so1, so2, so3, crr: std_logic;
	begin
		dect: counter4b port map(
			clk => clock,
			rst1 => reset1,
			en =>  enable,
			carry => crr,
			o0 => so0,
			o1 => so1,
			o2 => so2,
			o3 => so3
		);
	process
	begin
		enable <= '0';
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		enable <= '1';
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --1
		enable <= '0';
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		enable <= '1';
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --2
		enable <= '0';
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		enable <= '1';
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --3
		enable <= '0';
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		enable <= '1';
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --4
		enable <= '0';
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		enable <= '1';
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --5
		enable <= '0';
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		enable <= '1';
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --6
		enable <= '0';
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		enable <= '1';
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --7
		enable <= '0';
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		enable <= '1';
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --8
		enable <= '0';
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		enable <= '1';
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --9
		enable <= '0';
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		enable <= '1';
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --0
		enable <= '0';
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		enable <= '1';
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --1
		enable <= '0';
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		enable <= '1';
		clock <= '1';
		reset <= '1';
		wait for 50 ns; --0
		enable <= '0';
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		enable <= '1';
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --1
		enable <= '0';
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		enable <= '1';
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --2
		enable <= '0';
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		enable <= '1';
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --3
		enable <= '0';
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		enable <= '1';
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --4
	end process;
end architecture;