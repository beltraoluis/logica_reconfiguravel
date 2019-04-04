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
		clk, rst, en: in std_logic;
		o0, o1, o2, o3, carry: out std_logic
	);
	end component;
	
	signal clock, reset, enable: std_logic;
	signal so0, so1, so2, so3, crr: std_logic;
	begin
		dect: counter4b port map(
			clk => clock,
			rst => reset,
			en =>  enable,
			carry => crr,
			o0 => so0,
			o1 => so1,
			o2 => so2,
			o3 => so3
		);
	process
	begin
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --1
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --2
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --3
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --4
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --5
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --6
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --7
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --8
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --9
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --10
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --11
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --12
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --13
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --14
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --15
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --0
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --1
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		clock <= '0';
		reset <= '1';
		wait for 50 ns; --0
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --1
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --2
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --3
		clock <= '0';
		reset <= '0';
		wait for 50 ns;
		clock <= '1';
		reset <= '0';
		wait for 50 ns; --4
	end process;
end architecture;