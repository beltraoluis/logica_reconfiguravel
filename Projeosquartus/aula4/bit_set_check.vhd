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
	process
	variable sum: std_logic_vector(2 downto 0) := '000';
		begin
		if op = '00' then -- for
			for i in 0 to 3 loop
				if i0(i) then
					sum := sum + 1;
			end loop;
		elsif op = '01' then -- while
			variable i: integer := 0
			while (i < 4) loop
				sum := sum + 1;
				i := i + 1;
			end loop
		elsif op = '10' then -- case/when
			case i0 is
				when '0000' =>
					o0 <= '000';
				when '0001' =>
					o0 <= '001';
				when '0010' =>
					o0 <= '001';
				when '0011' =>
					o0 <= '010';
				when '0100' =>
					o0 <= '001';
				when '0101' =>
					o0 <= '010';
				when '0110' =>
					o0 <= '010';
				when '0111' =>
					o0 <= '011';
				when '1000' =>
					o0 <= '001';
				when '1001' =>
					o0 <= '010';
				when '1010' =>
					o0 <= '010';
				when '1011' =>
					o0 <= '011';
				when '1100' =>
					o0 <= '010';
				when '1101' =>
					o0 <= '011';
				when '1110' =>
					o0 <= '011';
				when '1111' =>
					o0 <= '100';
		else
	end process;
end architecture;


