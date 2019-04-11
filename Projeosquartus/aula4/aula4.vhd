-- André Luiz Rodrigues dos Santos
-- RA1500759-UTFPR
-- Luí­s Henrique Beltã£o Santana
-- RA906867-UTFPR
-- 20190411

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity aula4 is
	port(
		i: in std_logic;
		o: out std_logic
	);
end entity;

architecture behave of aula4 is
	begin
	 o <= i;
end architecture;


