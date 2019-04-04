-- Luis Henrique Beltrao Santana
-- 20190314

library ieee;
use ieee.std_logic_1164.all;

entity my_nand2_tb is
end;

architecture y of my_nand2_tb is

component m_nand
	port(
		in_a : in std_logic;
		in_b : in std_logic;
		out_c: out std_logic
	);
end component;
signal a1, a2, o: std_logic;
begin
	nand_tb: m_nand port map(
		in_a  => a1,
		in_b  => a2,
		out_c => o
	);

process
begin
	a1 <= '0';
	a2 <= '0';
	wait for 50 ns;
	a1 <= '0';
	a2 <= '1';
	wait for 50 ns;
	a1 <= '1';
	a2 <= '0';
	wait for 50 ns;
	a1 <= '1';
	a2 <= '1';
	wait for 50 ns;
	wait;
end process;
end architecture;