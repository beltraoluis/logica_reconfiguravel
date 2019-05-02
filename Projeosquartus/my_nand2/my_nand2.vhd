-- Andre Luiz Rodrigues dos Santos RA1500759
-- Luis Henrique Beltrao Santana RA906867
-- 20190314

library ieee;
use ieee.std_logic_1164.all;

entity my_nand2 is
	port(
		a, b: in std_logic;
		c: out std_logic
	);
end entity;

architecture behave of my_nand2 is
begin
	c <= not(a and b);
end architecture;
