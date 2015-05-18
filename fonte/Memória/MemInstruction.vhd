library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity InstructionMemory is
    port(	
		W_Instruction: in std_logic_vector(31 downto 0);
		instrucao_atual: in std_logic_vector(31 downto 0);
		N_Instruction: in std_logic_vector(31 downto 0);
		saida: out std_logic_vector(31 downto 0)
    );
end entity;

architecture arch_InstructionMemory of InstructionMemory is
	type mem is array(255 downto 0) of std_logic_vector(7 downto 0);
	signal Instrucao: mem;   
	
	begin
		process(instrucao_atual)
		begin
			saida(7 downto 0) <= Instrucao(conv_integer(instrucao_atual));		--	
			saida(15 downto 8) <= Instrucao(conv_integer(instrucao_atual) + 1);	--	Carrega byte a byte
			saida(23 downto 16) <= Instrucao(conv_integer(instrucao_atual) + 2);	--
			saida(31 downto 24) <= Instrucao(conv_integer(instrucao_atual) + 3);	--
		end process;

		process(W_Instruction)	-- Se for escrever novas instrucoes
		begin
			Instrucao(conv_integer(W_Instruction)) 	   <= N_Instruction(7 downto 0);
			Instrucao(conv_integer(W_Instruction) + 1) <= N_Instruction(15 downto 8);
			Instrucao(conv_integer(W_Instruction) + 2) <= N_Instruction(23 downto 16);
			Instrucao(conv_integer(W_Instruction) + 3) <= N_Instruction(31 downto 24);
		end process;	
end architecture;
