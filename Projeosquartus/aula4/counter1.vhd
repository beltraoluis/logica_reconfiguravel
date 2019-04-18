-- André Luiz Rodrigues dos Santos
-- RA1500759-UTFPR
-- Luí­s Henrique Beltã£o Santana
-- RA906867-UTFPR
-- 20190411

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter1 is
	port(
		clk, rst1, rst2, en1, en2: in std_logic;
		o10, o11, o12, o13, o20, o21, o22, o23, crr1, crr2: out std_logic
	);
end entity;

architecture behave of counter1 is
	signal aux1: integer range 0 to 9 := 0;
	signal n1: std_logic_vector(3 downto 0);
	begin
	process(clk, en1, rst1)
	begin
	crr1 <= '0';
	crr2 <= '0';
		if rst1 = '1' then
			aux1 <= 0;
			crr1 <= '0';
		elsif clk' event and clk = '1' and  en1 = '1' then
			if aux1 = 9 then
				aux1 <= 0;
				crr1 <= '1';
			else
				crr1 <= '0';
				aux1 <= aux1 + 1;
			end if;
		end if;
		n1 <= std_logic_vector(to_unsigned(aux1,4));
		o10 <= n1(0);
		o11 <= n1(1);
		o12 <= n1(2);
		o13 <= n1(3);
	end process;
	
	process(clk, en2, rst2)
	variable aux2: integer range 0 to 9 := 0;
	variable n2: std_logic_vector(3 downto 0);
	begin
		if rst2 = '1' then
			aux2 := 0;
			crr2 <= '0';
		elsif clk' event and clk = '1' and  en2 = '1' then
			if aux2 = 9 then
				aux2 := 0;
				crr2 <= '1';
			else
				crr2 <= '0';
				aux2 := aux2 + 1;
			end if;
		end if;
		n2 := std_logic_vector(to_unsigned(aux2,4));
		o20 <= n2(0);
		o21 <= n2(1);
		o22 <= n2(2);
		o23 <= n2(3);
	end process;
end architecture;


