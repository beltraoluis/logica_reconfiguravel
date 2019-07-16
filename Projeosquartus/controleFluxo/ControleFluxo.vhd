    
-- Andre Luiz Rodrigues dos Santos RA1500759
-- Luis Henrique Beltrao Santana RA906867
-- 20190314

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ControleFluxo is
	port(
		test_led, test_led2: out std_logic;
		rd_output, wr_output: out std_logic_vector(7 downto 0); 
		cnt_output: out std_logic_vector(8 downto 0);
		clk, rst: in std_logic
	);
end entity;
--
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
	
	component StateController IS
		PORT
		(
			rst: in std_logic;
			cnt: in std_logic_vector(8 downto 0);
			wr_en, rd_en: out std_logic
		);
	END component;

----  Início declaração dos sinais

	
	signal clk_1: std_logic; -- saída 1 do divisor
	signal cont_5: std_logic; -- contador 5
	signal second_fifo_usage : std_logic_vector(8 downto 0) := "000000100"; --pq tem 9 bits?

	
	--Sinais FIFO
	signal fifo_clk: std_logic; -- saída 1 do divisor
	signal fifo_input, fifo_output : std_logic_vector(7 downto 0) := "00000000"; --entrada fifo (testes)
	signal fifo_usage : std_logic_vector(8 downto 0) := "000000000"; --pq tem 9 bits?
	signal fifo_rdreq, fifo_wrreq, fifo_empty, fifo_full: std_logic := '0';
	
	--Sinais INITIALIZED_RAM (LEITURA)
	signal init_ram_clk: std_logic; -- saída 1 do divisor
	signal init_ram_input, init_ram_output : std_logic_vector(7 downto 0) := "01010101"; 
	signal init_ram_rdaddress, init_ram_wraddress : std_logic_vector(9 downto 0) := "0000000000";
	signal init_ram_rden, init_ram_wren: std_logic := '0'; -- rdreq fifo
	
	--Sinais BLANK_RAM (ESCRITA)
	signal blank_ram_clk: std_logic; -- saída 1 do divisor
	signal blank_ram_input, blank_ram_output : std_logic_vector(7 downto 0) := "10011010"; 
	signal blank_ram_rdaddress, blank_ram_wraddress : std_logic_vector(9 downto 0) := "0000000000";
	signal blank_ram_rden, blank_ram_wren: std_logic := '0'; -- rdreq fifo
	
	--Sinais StateController
	--signal fifo_state_cnt: std_logic; -- fifo->state
	signal wr_en: std_logic:= '1'; -- saida do state_controller
	signal rd_en: std_logic:= '0'; -- saida do state_controller
	
	begin
	
----  PortMap dos componentes

		clock_divider: divisor 
		port map(
			CLK => clk, --recebe clk do controleFluxo
			RST => rst,
			DIV_1=> clk_1, --normal
			DIV_5 => cont_5); --5x mais rápido
		
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
		
		state_controller: StateController 
		port map(
			rst => rst,
			cnt => second_fifo_usage, 
			wr_en => wr_en,
			rd_en => rd_en); 

	
	-- PROCESSO RAM ESCREVE NA FIFO
	process (rst, clk_1)
	variable fifo_rdreq_en , fifo_wrreq_en: std_logic := '0';
	begin --Process code
	
	second_fifo_usage <= fifo_usage;
	init_ram_clk <= clk_1;
	fifo_clk <= clk_1;
	blank_ram_clk <= clk_1;
	test_led <= cont_5;
	
	if clk_1' event and clk_1 = '1' then	
		
		fifo_rdreq <= cont_5 and rd_en;
		fifo_wrreq <= wr_en;
		
		--ESCREVE NA FIFO
		if wr_en = '1' and init_ram_rdaddress < "11111111"  then 
				
				init_ram_rden <= '1';
				
				if fifo_full = '0' then -- se não estiver cheia 
				
					fifo_input <= init_ram_output;--std_logic_vector( unsigned(fifo_input) + 1 ); 
					
					cnt_output <= fifo_usage; 
	
				--elsif fifo_full = '1' then cnt_output <= fifo_usage;
				else cnt_output <= fifo_usage;
					
					--fifo_wrreq <= fifo_wrreq_en;
					--fifo_rdreq <= fifo_rdreq_en;  --test_output está ligada na saída q
					
				end if; --end fifo
				
			   rd_output <= init_ram_output;
				init_ram_rdaddress <= std_logic_vector( unsigned(init_ram_rdaddress) + 1 ); 
	
		end if; 
		
		
		--RAM QUE TIRA DA FIFO
		if rd_en = '1' then 
			
			blank_ram_wren <= '1';
			
			wr_output <= fifo_output;
			
			blank_ram_rdaddress <= std_logic_vector( unsigned(blank_ram_rdaddress) + 1 ); 
			
			cnt_output <= fifo_usage;
		else 
	
		--fifo_rdreq_en := '1';
		wr_output <= "10101101";
	
		end if;
		--cnt_output <= fifo_usage; 

	end if; --End clock
	 
	cnt_output <= fifo_usage;
	
	end process;
end architecture;