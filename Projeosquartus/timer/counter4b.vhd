-- André Luiz Rodrigues dos Santos
-- RA1500759-UTFPR
-- Luís Henrique Beltrão Santana
-- RA906867-UTFPR
-- 20190404

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter4b is
	port(
		clk, rst, en: in std_logic;
		o0, o1, o2, o3, carry: out std_logic
	);
end entity;

architecture behave of counter4b is
	signal aux: integer range 0 to 9 := 0;
	signal n: std_logic_vector(3 downto 0);
begin
	aux <= 0;
	process(clk, rst)
	begin
		if rst = '1' then
			aux <= 0;
		elsif clk' event and clk = '1' and  en = '1' then
			if aux = 9 then
				aux <= 0;
				carry <= '1';
			else
				carry <= '0';
				aux <= aux + 1;
			end if;
		end if;
		n <= std_logic_vector(to_unsigned(aux,4));
		o0 <= n(0);
		o1 <= n(1);
		o2 <= n(2);
		o3 <= n(3);
	end process;
end architecture;


