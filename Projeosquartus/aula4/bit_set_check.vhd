-- André Luiz Rodrigues dos Santos
-- RA1500759-UTFPR
-- Luí­s Henrique Beltã£o Santana
-- RA906867-UTFPR
-- 20190411

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bit_set_check is
	port(
		i0: in std_logic_vector(3 downto 0),
		op: in std_logic_vector(1 downto 0),
		o0: out std_logic_vector(2 downto 0)
	);
end entity;

architecture behave of counter1 is
	begin
	if op = '00' then -- for
	elsif op = '01' then -- while
	elsif op = '10' then -- case/when
	else
	
end architecture;


