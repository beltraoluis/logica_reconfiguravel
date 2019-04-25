-- André Luiz Rodrigues dos Santos RA1500759-UTFPR
-- Luí­s Henrique Beltã£o Santana RA906867-UTFPR
-- 20190411

-- André Luiz Rodrigues dos Santos RA1500759-UTFPR
-- Luí­s Henrique Beltã£o Santana RA906867-UTFPR
-- 20190425

library ieee;
use ieee.std_logic_1164.all;

entity sinaleiro is
	port(
		a: in std_logic;
		b: out std_logic
	);
end entity;

architecture behave of sinaleiro is
begin
	b <= a;
end architecture;
