library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity TB is
end entity;

architecture arch_TB of TB is	
	
	component Processador is
	port(
		clk: in std_logic;
		reset: in std_logic;
		N_instruction: in std_logic_vector(31 downto 0);
		where: in std_logic_vector(31 downto 0);
		WDATA_out: out std_logic_vector(31 downto 0);
		SaidaUla: out std_logic_vector(31 downto 0);
		SaidaBR2: out std_logic_vector(31 downto 0)
	);
end component;

	signal clkPC, reset: std_logic;
	signal newInstruction, address: std_logic_vector( 31 downto 0 );
	signal W_DATA, SAIDA_ULA, SAIDA_BR_2: std_logic_vector( 31 downto 0 );
	
begin
	U0: Processador port map(clkPC, reset, newInstruction, address, W_DATA, SAIDA_ULA, SAIDA_BR_2);

	process
	begin
		-- Comeca zerando e colocando a primeira instrucao --
		clkPC 			<= '0';
		reset 			<= '0';
		newInstruction 	<= "00100000000010000000000000000101";
		wait for 5 ns;
		
		-- escreve as instrucoes na memoria de instrucao --

		-- ADDi $8, $0, 5
		address 		<= "00000000000000000000000000000000";
		wait for 5 ns;
		
		-- SW $8, 0($0)
		newInstruction 	<= "10101100000010000000000000000000";
		wait for 5 ns;
		address 		<= "00000000000000000000000000000100";
		wait for 5 ns;
		
		-- LW $16, 0($0)
		newInstruction 	<= "10001100000100000000000000000000";
		wait for 5 ns;
		address 		<= "00000000000000000000000000001000";
		wait for 10 ns;
		
		-- ADDi $8, $8, 2
		newInstruction 	<= "00100001000010000000000000000010";
		wait for 5 ns;
		address 		<= "00000000000000000000000000001100";
		wait for 10 ns;


		-- Comeca --
		-- Primeira instrucao --
		reset 		<= '1';
		wait for 5 ns;
		reset 		<= '0';
		wait for 5 ns;
		
		-- Segunda instrucao --
		clkPC <= '1';
		wait for 5 ns;
		clkPC <= '0';
		wait for 5 ns;
		
		-- Terceira instrucao --
		clkPC <= '1';
		wait for 5 ns;
		clkPC <= '0';
		wait for 5 ns;
		
		-- Quarta instrucao --
		clkPC <= '1';
		wait for 5 ns;
		clkPC <= '0';
		wait for 5 ns;

		

		wait;
	end process;
end architecture;