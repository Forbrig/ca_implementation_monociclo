library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity PC is
	port(
		clk: in std_logic;
		In1: in std_logic_vector(31 downto 0);
		saida: out std_logic_vector(31 downto 0)
	);
end entity;	
	
	
architecture arch_PC of PC is
begin
	process(In1, clk)
	begin
		if(clk'event and clk = '1')then
			saida <= In1; 
		end if;
	end process;
end architecture;