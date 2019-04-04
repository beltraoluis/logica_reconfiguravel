-- André Luiz Rodrigues dos Santos
-- RA1500759-UTFPR
-- Luís Henrique Beltrão Santana
-- RA906867-UTFPR
-- 20190328

library ieee;
use ieee.std_logic_1164.all;

entity bcd_7seg is
	port(
		i: in std_logic_vector(3 downto 0);
		a, b, c, d, e ,f ,g: out std_logic
	);
end entity;

architecture behave of bcd_7seg is
begin
	process(i)
	begin
		a <=  not((not(i(2)) and not(i(0))) or 
				(not(i(3)) and i(1)) or 
				(not(i(3)) and i(2) and i(0)) or 
				(i(2) and i(1)) or 
				(i(3) and not(i(2)) and not(i(1))) or 
				(i(3) and not(i(0))));
		b <=  not((not(i(3)) and not(i(1)) and not(i(0))) or
				(not(i(2))) or
				(not(i(3)) and i(1) and i(0)) or
				(i(3) and not(i(1)) and i(0)));
		c <=  not((not(i(3)) and not(i(1))) or
				(not(i(3)) and i(0)) or
				(not(i(1)) and i(0)) or
				(not(i(3)) and i(2)) or
				(i(3) and not(i(2))));
		d <=  not((not(i(3)) and not(i(2)) and not(i(0))) or
				(not(i(2)) and i(1) and i(0)) or
				(i(2) and not(i(1)) and i(0)) or
				(i(2) and i(1) and not(i(0))) or
				(i(3) and not(i(1)) and not(i(0))));
		e <=  not((not(i(2)) and not(i(0))) or
				(i(1) and not(i(0))) or
				(i(3) and i(1)) or
				(i(3) and i(2)));
		f <=  not((not(i(1)) and not(i(0))) or
				(not(i(3)) and i(2) and not(i(1))) or
				(i(2) and not(i(0))) or
				(i(3) and not(i(2)) and not(i(1))) or
				(i(3) and not(i(0))) or
				(i(3) and i(2) and i(1)));
		g <=  not((not(i(2)) and i(1)) or
				(i(1) and not(i(0))) or
				(not(i(3)) and i(2) and not(i(1))) or
				(i(3) and not(i(2))) or
				(i(3) and i(0)));
	end process;
end architecture;


