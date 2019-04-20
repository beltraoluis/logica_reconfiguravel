-- AndrÃ© Luiz Rodrigues dos Santos
-- RA1500759-UTFPR
-- LuÃ­Â­s Henrique BeltÃ£Â£o Santana
-- RA906867-UTFPR
-- 20190411

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bit_set_check is
	port(
		i0: in std_logic_vector(3 downto 0);
		op: in std_logic_vector(1 downto 0);
		o0: out std_logic_vector(2 downto 0)
	);
end entity;

architecture behave of bit_set_check is
	begin
	process
	--variable sum: std_logic_vector(2 downto 0) := "000";
	variable sum: integer range 0 to 9 := 0;
	variable j: integer range 0 to 9 := 0;
	
		begin
		if op = "00" then -- for
			for i in 0 to 3 loop
				if i0(i) = '1' then
					sum := sum + 1;
				end if;
			end loop;
			
		elsif op = "01" then -- while
			while (j < 4) loop
				sum := sum + 1;
				j := j + 1;
			end loop;
		elsif op = "10" then -- case/when
			case i0 is
				when "0000" =>
					o0 <= "000";
				when "0001" =>
					o0 <= "001";
				when "0010" =>
					o0 <= "001";
				when "0011" =>
					o0 <= "010";
				when "0100" =>
					o0 <= "001";
				when "0101" =>
					o0 <= "010";
				when "0110" =>
					o0 <= "010";
				when "0111" =>
					o0 <= "011";
				when "1000" =>
					o0 <= "001";
				when "1001" =>
					o0 <= "010";
				when "1010" =>
					o0 <= "010";
				when "1011" =>
					o0 <= "011";
				when "1100" =>
					o0 <= "010";
				when "1101" =>
					o0 <= "011";
				when "1110" =>
					o0 <= "011";
				when "1111" =>
					o0 <= "100";
			end case;
		end if;
		
	end process;
end architecture;


