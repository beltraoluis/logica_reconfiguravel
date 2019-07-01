-- AndrÃ© Luiz Rodrigues dos Santos
-- RA1500759-UTFPR
-- LuÃ­Â­s Henriqu eBeltrÃ£o Santana
-- RA906867-UTFPR
-- 20190629

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rtc_tb is
end;

architecture rtc_behave of rtc_tb is

component rtc
	port(
		write_data: in std_logic_vector(43 downto 0); 	
		clk, en_wr, enable, reset: in std_logic;
		data: out std_logic_vector(43 downto 0)
	);
end component;

signal s_write_data: std_logic_vector(43 downto 0); 	
signal s_clk, s_en_wr, s_enable, s_reset: std_logic;

begin
	c_rtc: rtc port map(
		write_data => s_write_data,
		clk => s_clk,
		en_wr	=> s_en_wr,
		enable => s_enable,
		reset	=> s_reset
	);

process
begin
	s_clk <= '1';
	wait for 1 ms;
	s_clk <= '0';
	wait for 1 ms;
end process;

process
begin
	s_reset <= '1';
	wait for 1 ms;
	s_write_data <= x"16BAAE9644C";
	s_en_wr <= '1';
	wait for 10 ns;
	s_en_wr <= '0';
	s_enable <= '1';
	wait for 10 ms;
	s_reset <= '1';
	wait for 1 ms;
	s_reset <= '0';
	wait for 10 ns;
end process;
end architecture;