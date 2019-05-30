    
-- Andre Luiz Rodrigues dos Santos RA1500759
-- Luis Henrique Beltrao Santana RA906867
-- 20190314

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ControleFluxo is
	port(
		test_led: out std_logic;
		rd_output, wr_output: out std_logic_vector(7 downto 0); 
		cnt_output: out std_logic_vector(8 downto 0);
		clk, rst: in std_logic
	);
end entity;

architecture behave of ControleFluxo is

---- Declaração dos componentes 
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
	component InitializedRam IS
	PORT
	(
		clock		: IN STD_LOGIC  := '1'; --
		data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);--
		rdaddress		: IN STD_LOGIC_VECTOR (9 DOWNTO 0);--
		rden		: IN STD_LOGIC  := '1';--
		wraddress		: IN STD_LOGIC_VECTOR (9 DOWNTO 0);--
		wren		: IN STD_LOGIC  := '0';--
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)--
	);
END component;

	component blankRam IS
		PORT
		(
			clock		: IN STD_LOGIC  := '1'; --
			data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);--
			rdaddress		: IN STD_LOGIC_VECTOR (9 DOWNTO 0);--
			rden		: IN STD_LOGIC  := '1';--
			wraddress		: IN STD_LOGIC_VECTOR (9 DOWNTO 0);--
			wren		: IN STD_LOGIC  := '0';--
			q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)--
		);
	END component;


----  Início declaração dos sinais

	
	signal clk_1: std_logic; -- saída 1 do divisor
	signal clk_5: std_logic; -- saída 2 do divisor
	signal wr_en: std_logic:= '1'; -- saida do state_controller
	signal rd_en: std_logic:= '1'; -- saida do state_controller
	
	--Sinais FIFO
	signal fifo_clk: std_logic; -- saída 1 do divisor
	signal fifo_input, fifo_output : std_logic_vector(7 downto 0) := "00000000"; --entrada fifo (testes)
	signal fifo_usage : std_logic_vector(8 downto 0) := "000000000"; --pq tem 9 bits?
	signal fifo_rdreq, fifo_wrreq, fifo_empty, fifo_full: std_logic := '0'; -- rdreq fifo
	
	--Sinais INITIALIZED_RAM (LEITURA)
	signal init_ram_clk: std_logic; -- saída 1 do divisor
	signal init_ram_input, init_ram_output : std_logic_vector(7 downto 0) := "01010101"; 
	signal init_ram_rdaddress, init_ram_wraddress : std_logic_vector(9 downto 0) := "0000000000";
	signal init_ram_rden, init_ram_wren: std_logic := '0'; -- rdreq fifo
	
	--Sinais BLANK_RAM (ESCRITA)
	signal blank_ram_clk: std_logic; -- saída 1 do divisor
	signal blank_ram_input, blank_ram_output : std_logic_vector(7 downto 0) := "00000000"; 
	signal blank_ram_rdaddress, blank_ram_wraddress : std_logic_vector(9 downto 0) := "0000000000";
	signal blank_ram_rden, blank_ram_wren: std_logic := '0'; -- rdreq fifo
	
	begin
	
----  PortMap dos componentes

		clock_divider: divisor 
		port map(
			CLK => clk, --recebe clk do controleFluxo
			RST => rst,
			DIV_1=> clk_1, --normal
			DIV_5 => clk_5); --5x mais rápido
		
		fila: fifo
		port map(
			clock		=> fifo_clk,
			data		=> fifo_input,
			rdreq		=> fifo_rdreq ,
			wrreq		=> fifo_wrreq ,
			empty		=> fifo_empty , --posso mapear direto pra saida do top-level
			full		=> fifo_full,
			q			=> fifo_output, --test_output
			usedw		=> fifo_usage
			);

		init_ram: InitializedRam
		port map(
		clock			=> init_ram_clk,
		data			=> init_ram_input,
		rdaddress	=> init_ram_rdaddress,    -- 10bits
		rden			=> init_ram_rden,
		wraddress	=> init_ram_wraddress, --posso mapear direto pra saida do top-level
		wren			=> init_ram_wren,
		q				=> init_ram_output --test_output
		);
		
		blank_ram: blankRam
		port map(
		clock			=> blank_ram_clk,
		data			=> blank_ram_input,
		rdaddress	=> blank_ram_rdaddress,    -- 10bits
		rden			=> blank_ram_rden,
		wraddress	=> blank_ram_wraddress, --posso mapear direto pra saida do top-level
		wren			=> blank_ram_wren,
		q				=> blank_ram_output --test_output
		);

	
	-- PROCESSO RAM LEITURA
	process (rst, clk_1)
	begin --Process code
	
	init_ram_clk <= clk_1;
	
	if clk_1' event and clk_1 = '1' then	
		
		if rd_en = '1' then 
				
				init_ram_rden <= '1' after 1ns;
				
				rd_output <= init_ram_output;
				
				init_ram_rdaddress <= std_logic_vector( unsigned(init_ram_rdaddress) + 1 ); 

		end if;
	
	end if; --End clock
	
	end process;
	
	
	--processo FIFO
	process (rst, clk_1)
	begin --Process code
	
	fifo_clk <= clk_1;
	
	if clk_1' event and clk_1 = '1' then
		--Teste fifo
		if fifo_full = '0' and rd_en = '1' then -- se não estiver cheia 
			
			fifo_input <= init_ram_output;--std_logic_vector( unsigned(fifo_input) + 1 ); 
			fifo_wrreq <= '1';
			fifo_rdreq <= '0';
			cnt_output <= fifo_usage; 

		elsif fifo_full = '1' then 
			
			fifo_wrreq <= '0';
			fifo_rdreq <= '1';  --test_output está ligada na saída q
			cnt_output <= fifo_usage; 
			
		end if; --end fifo
	
	end if; --End clock
	
	end process;
	
	
	--processo RAM ESCRITA
	process (rst, clk_1)
	begin --Process code

	blank_ram_clk <= clk_1;
	
	if clk_1' event and clk_1 = '1' then
				
		
		if init_ram_wraddress < "00000000000" then 
			
			--init_ram_wraddress <= std_logic_vector( unsigned(init_ram_wraddress) + 1 ); 
			
			--init_ram_wren <= '1' after 1ns;
			
			--init_ram_input <= std_logic_vector( unsigned(init_ram_input) + 1 ); 
			
			--init_ram_rden <= '0' after 1ns;
			
			
		else 
			
			--init_ram_rdaddress <= std_logic_vector( unsigned(init_ram_rdaddress) + 1 ); 
			
			--init_ram_rden <= '1' after 1ns;
			
			--wr_output <= init_ram_output;
			
		end if;
	
	end if; --End clock
	
	end process;
end architecture;