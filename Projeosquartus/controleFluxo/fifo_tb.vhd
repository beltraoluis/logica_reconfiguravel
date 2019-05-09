-- Luis Henrique Beltrao Santana
-- 20190314

library ieee;
use ieee.std_logic_1164.all;

entity fifo_tb is
end;

architecture y of fifo_tb is

component m_fifo
	port(
		clock		: in STD_LOGIC;
		data		: in STD_LOGIC_VECTOR (7 downto 0);
		rdreq		: in STD_LOGIC;
		wrreq		: in STD_LOGIC;
		empty		: out STD_LOGIC;
		full		: out STD_LOGIC;
		q		: out STD_LOGIC_VECTOR (7 downto 0);
		usedw		: out STD_LOGIC_VECTOR (7 downto 0)
	);
end component;
signal s_clock, s_rdreq, s_wrreq, s_empty, s_full: std_logic;
signal s_data, s_q, s_usedw: std_logic_vector(7 downto 0);
begin
	fifo_tb: m_fifo port map(
		clock => s_clock,
		data => s_data,
		rdreq => s_rdreq,
		wrreq => s_wrreq,
		empty => s_empty,
		full => s_full,
		q => s_q,
		usedw => s_usedw
	);

process
begin
	s_clock <= '0';
	wait for 50 ns;
	s_clock <= '1';
	wait for 50 ns;
end process;
process
begin
	wait for 90ns;
	s_data <= "00000000";
	--s_clock <= '0';
	s_wrreq <= '0';
	s_rdreq <= '0';
	wait for 50 ns;
	s_data <= "00000001";
	s_wrreq <= '1';
	--s_clock <= '1';
	wait for 50 ns;
	--s_clock <= '0';
	s_wrreq <= '0';
	wait for 50 ns;
	s_data <= "00000010";
	s_wrreq <= '1';
	--s_clock <= '1';
	wait for 50 ns;
	--s_clock <= '0';
	s_wrreq <= '0';
	wait for 50 ns;
	s_data <= "00000011";
	s_wrreq <= '1';
	--s_clock <= '1';
	wait for 50 ns;
	--s_clock <= '0';
	s_wrreq <= '0';
	wait for 50 ns;
	s_data <= "00000100";
	s_wrreq <= '1';
	--s_clock <= '1';
	wait for 50 ns;
	--s_clock <= '0';
	s_wrreq <= '0';
	wait for 50 ns;
	s_data <= "00000101";
	s_wrreq <= '1';
	--s_clock <= '1';
	wait for 50 ns;
	--s_clock <= '0';
	s_wrreq <= '0';
	wait for 50 ns;
	s_data <= "00000110";
	s_wrreq <= '1';
	--s_clock <= '1';
	wait for 50 ns;
	--s_clock <= '0';
	s_wrreq <= '0';
	wait for 50 ns;
	s_data <= "00000111";
	s_wrreq <= '1';
	--s_clock <= '1';
	wait for 50 ns;
	--s_clock <= '0';
	s_wrreq <= '0';
	wait for 50 ns;
	s_data <= "00001000";
	s_wrreq <= '1';
	--s_clock <= '1';
	wait for 50 ns;
	--s_clock <= '0';
	s_rdreq <= '0';
	wait for 50 ns;
	s_rdreq <= '1';
	--s_clock <= '1';
	wait for 50 ns;
	--s_clock <= '0';
	s_rdreq <= '0';
	wait for 50 ns;
	s_rdreq <= '1';
	--s_clock <= '1';
	wait for 50 ns;
	--s_clock <= '0';
	s_rdreq <= '0';
	wait for 50 ns;
	s_rdreq <= '1';
	--s_clock <= '1';
	wait for 50 ns;
	--s_clock <= '0';
	s_rdreq <= '0';
	wait for 50 ns;
	s_rdreq <= '1';
	--s_clock <= '1';
	wait for 50 ns;
	--s_clock <= '0';
	s_rdreq <= '0';
	wait for 50 ns;
	s_rdreq <= '1';
	--s_clock <= '1';
	wait for 50 ns;
	--s_clock <= '0';
	s_rdreq <= '0';
	wait for 50 ns;
	s_rdreq <= '1';
	--s_clock <= '1';
	wait for 50 ns;
	--s_clock <= '0';
	s_rdreq <= '0';
	wait for 50 ns;
	s_rdreq <= '1';
	--s_clock <= '1';
	wait for 50 ns;
	--s_clock <= '0';
	s_rdreq <= '0';
	wait for 50 ns;
	s_rdreq <= '1';
	--s_clock <= '1';
end process;
end architecture;