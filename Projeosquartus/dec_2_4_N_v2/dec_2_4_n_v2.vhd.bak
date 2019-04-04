-- Luís Henrique Beltrão Santana
-- RA906867-UTFPR
-- 20190321

library ieee;
use ieee.std_logic_1164.all;

entity dec_2_4_n_v1 is
	port(
		i0, i1, en: in std_logic;
		s0, s1, s2, s3: out std_logic
	);
end entity;

architecture behave of dec_2_4_n_v1 is
	signal aux: std_logic_vector(1 downto 0);
	signal s: std_logic_vector(3 downto 0); 
begin
	aux <= i1&i0;
	process(en, i0, i1)
	begin
		case aux is
			when "00" => s <= "1110";
			when "01" => s <= "1101";
			when "10" => s <= "1011";
			when "11" => s <= "0111";
			when others => s <= "1111";
		end case;
		if (en = '1') then
			s0 <= s(0);
			s1 <= s(1);
			s2 <= s(2);
			s3 <= s(3);
		else
			s0 <= '1';
			s1 <= '1';
			s2 <= '1';
			s3 <= '1';
		end if;	
	end process;
end architecture;
