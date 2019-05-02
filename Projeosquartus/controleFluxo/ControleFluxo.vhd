    
-- Andre Luiz Rodrigues dos Santos RA1500759
-- Luis Henrique Beltrao Santana RA906867
-- 20190314

library ieee;
use ieee.std_logic_1164.all;

entity ControleFluxo is
	port(
		a, b: in std_logic;
		c: out std_logic
	);
end entity;

architecture behave of ControleFluxo is
begin
	c <= not(a and b);
end architecture;