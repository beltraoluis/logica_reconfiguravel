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
		o: out std_logic_vector(6 downto 0)
	);
end entity;

architecture behave of bcd_7seg is
begin
	process(i)
	begin
		o(0) <=  not((not(i(2)) and not(i(0))) or 
				(not(i(3)) and i(1)) or 
				(not(i(3)) and i(2) and i(0)) or 
				(i(2) and i(1)) or 
				(i(3) and not(i(2)) and not(i(1))) or 
				(i(3) and not(i(0))));
		o(1) <=  not((not(i(3)) and not(i(1)) and not(i(0))) or
				(not(i(2))) or
				(not(i(3)) and i(1) and i(0)) or
				(i(3) and not(i(1)) and i(0)));
		o(2) <=  not((not(i(3)) and not(i(1))) or
				(not(i(3)) and i(0)) or
				(not(i(1)) and i(0)) or
				(not(i(3)) and i(2)) or
				(i(3) and not(i(2))));
		o(3) <=  not((not(i(3)) and not(i(2)) and not(i(0))) or
				(not(i(2)) and i(1) and i(0)) or
				(i(2) and not(i(1)) and i(0)) or
				(i(2) and i(1) and not(i(0))) or
				(i(3) and not(i(1)) and not(i(0))));
		o(4) <=  not((not(i(2)) and not(i(0))) or
				(i(1) and not(i(0))) or
				(i(3) and i(1)) or
				(i(3) and i(2)));
		o(5) <=  not((not(i(1)) and not(i(0))) or
				(not(i(3)) and i(2) and not(i(1))) or
				(i(2) and not(i(0))) or
				(i(3) and not(i(2)) and not(i(1))) or
				(i(3) and not(i(0))) or
				(i(3) and i(2) and i(1)));
		o(6) <=  not((not(i(2)) and i(1)) or
				(i(1) and not(i(0))) or
				(not(i(3)) and i(2) and not(i(1))) or
				(i(3) and not(i(2))) or
				(i(3) and i(0)));
	end process;
end architecture;


