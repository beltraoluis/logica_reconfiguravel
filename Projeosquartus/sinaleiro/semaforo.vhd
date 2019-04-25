-- André Luiz Rodrigues dos Santos RA1500759-UTFPR
-- Luí­s Henrique Beltã£o Santana RA906867-UTFPR
-- 20190425

library ieee;
use ieee.std_logic_1164.all;

entity semaforo is
	port(
		i_c5, i_c40, i_pisca, rst: in std_logic;
		o0_vermelho, o0_amarelo, o0_verde: out std_logic;
		o1_vermelho, o1_amarelo, o1_verde: out std_logic
	);
end entity;

architecture behave of semaforo is
type states is (s0, s1, s2, s3, s4);
signal state_reg, state_next: states;
begin
	process(i_c5, i_c40, rst)
	begin
		if rst = '1' then
			state_reg <= s0;
			state_next <= s1;
		elsif state_reg = s0 and i_c5 = '1' then
			state_reg <= state_next;
			state_next <= s1;
		elsif state_reg = s1 and i_c40 = '1' then
			state_reg <= state_next;
			state_next <= s2;
		elsif state_reg = s2 and i_c5 = '1' then
			state_reg <= state_next;
			state_next <= s3;
		elsif state_reg = s3 and i_c40 = '1' then
			state_reg <= state_next;
			state_next <= s4;
		elsif state_reg = s4 and i_c5 = '1' then
			state_reg <= state_next;
			state_next <= s1;
		end if;
	end process;
	process(state_reg)
	begin
		if state_reg = s0 then
			o0_amarelo <= i_pisca;
			o1_amarelo <= i_pisca;
		elsif state_reg = s1 then
			o0_vermelho <= '1';
			o0_amarelo <= '0';
			o0_verde <= '0';
			o1_vermelho <= '0';
			o1_amarelo <= '0';
			o1_verde <= '1';
		elsif state_reg = s2 then
			o0_vermelho <= '1';
			o0_amarelo <= '0';
			o0_verde <= '0';
			o1_vermelho <= '0';
			o1_amarelo <= '1';
			o1_verde <= '0';
		elsif state_reg = s3 then
			o0_vermelho <= '0';
			o0_amarelo <= '0';
			o0_verde <= '1';
			o1_vermelho <= '1';
			o1_amarelo <= '0';
			o1_verde <= '0';
		elsif state_reg = s4 then
			o0_vermelho <= '0';
			o0_amarelo <= '0';
			o0_verde <= '1';
			o1_vermelho <= '0';
			o1_amarelo <= '1';
			o1_verde <= '0';
		end if;
	end process;
end architecture;