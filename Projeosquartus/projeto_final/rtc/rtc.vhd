-- André Luiz Rodrigues dos Santos
-- RA1500759-UTFPR
-- Luí­s Henriqu eBeltrão Santana
-- RA906867-UTFPR
-- 20190629

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rtc is
	port(
		write_data: in std_logic_vector(43 downto 0); 	
		clk, en_wr, enable, reset: in std_logic;
		data: out std_logic_vector(43 downto 0)
	);
end entity;

--               ┌───────┐
-- write_data ███▌       │
--               │       │
--      en_wr ───┤       │
--               │   r   │
--     enable ───┤   t   ▐███ output
--               │   c   │
--      reset ───┤       │
--               │       │
--        clk ───┤       │
--               └───────┘

architecture rtc_behave of rtc is

	signal tmp: std_logic_vector(43 downto 0);
	begin

	process (reset, en_wr)
		begin
		if reset = '1' then
			tmp <= std_logic_vector(to_unsigned(0,44));
			data <= tmp;
		elsif en_wr = '1' then
			tmp <= write_data;
			data <= tmp;
		elsif clk' event and clk = '1' and enable = '1' then
			tmp <= std_logic_vector(unsigned(tmp) + 1);
			data <= tmp;
		end if;
	end process;
	
end architecture;