    
-- Andre Luiz Rodrigues dos Santos RA1500759
-- Luis Henrique Beltrao Santana RA906867
-- 20190314

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ControleFluxo is
	port(
		test_output: out std_logic_vector(7 downto 0);
		test_clk: out std_logic;
		clk, rst: in std_logic
	);
end entity;

--adicionar a ram cheia, a ram vazia e a fifo

architecture behave of ControleFluxo is

--Declaração dos componentes --
	component fifo is 
				port
				(
					clock		: IN STD_LOGIC ;
					data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
					rdreq		: IN STD_LOGIC ;
					wrreq		: IN STD_LOGIC ;
					empty		: OUT STD_LOGIC ;
					full		: OUT STD_LOGIC ;
					q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
					usedw		: OUT STD_LOGIC_VECTOR (8 DOWNTO 0)
				);
			end component;
	
	component divisor is 
				port	(
				CLK: in std_logic;
				RST: in std_logic;
				DIV_1, DIV_5: out std_logic
				);
	end component;
		
			
--Início declaração dos sinais

	signal clk_1: std_logic; -- saída 1 do divisor
	signal clk_5: std_logic; -- saída 2 do divisor
	
	--Sinais FIFO
	signal fifo_input, fifo_output : std_logic_vector(7 downto 0) := "00000000"; --entrada fifo (testes)
	signal fifo_usage : std_logic_vector(8 downto 0) := "000000000"; --pq tem 9 bits?
	signal fifo_rdreq, fifo_wrreq, fifo_empty, fifo_full: std_logic := '0'; -- rdreq fifo
	
--Término declaração dos sinais	
	begin
--PortMap dos componentes

	clock_divider: divisor 
		port map(
		CLK => clk, --recebe clk do controleFluxo
		RST => rst,
		DIV_1=> clk_1, --normal
		DIV_5 => clk_5); --5x mais rápido
		
	fila: fifo
		port map(
		clock		=>  clk_1,
		data		=> fifo_input,
		rdreq		=> fifo_rdreq ,
		wrreq		=> fifo_wrreq ,
		empty		=> fifo_empty , --posso mapear direto pra saida do top-level
		full		=> fifo_full,
		q			=> fifo_output, --test_output
		usedw		=> fifo_usage
		);

	process (rst)
	begin --Process code
	
	if clk_1' event and clk_1 = '1' then
	
		if fifo_full = '0' then -- se não estiver cheia 
			
			fifo_input <= std_logic_vector( unsigned(fifo_input) + 1 ); 
			fifo_wrreq <= '1';
			fifo_rdreq <= '0';
			
		elsif fifo_full = '1' then 
		
			fifo_wrreq <= '0';
			fifo_rdreq <= '1';  --test_output está ligada na saída q
			test_output <= fifo_output;
		end if;
		
		
		test_clk <= clk_1;
	end if;
	
	
	end process;
end architecture;