library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity ULA_IDL is
	Port ( clk : in std_logic;
		operacao : in STD_LOGIC_VECTOR (2 downto 0);
		display : out STD_LOGIC_VECTOR (7 downto 0));
end ULA_IDL;

-- Declarações de signals e components

architecture Behavioral of ULA_IDL is

signal clkRed : std_logic;
signal leituraContador: unsigned(7 downto 0);
signal operador1 : STD_LOGIC_VECTOR (3 downto 0);
signal operador2 : STD_LOGIC_VECTOR (3 downto 0);
signal res0, res1, res2, res3, res4, res5, res6, res7 : STD_LOGIC_VECTOR (3 downto 0);
signal flg0, flg1, flg2, flg3, flg4, flg5, flg6, flg7 : STD_LOGIC_VECTOR (3 downto 0);
signal resultado, flags : STD_LOGIC_VECTOR (3 downto 0);

component redutorClock
	Port (
		elkin : in std_logic;
		ClkRed : out std_logic);
end component redutorClock;

component counter_seconds is
    generic(t_max : integer := 100000000); 
    port(CLOCK_50: in std_logic;
    counter_out: out unsigned(7 downto 0));
end component counter_seconds;

component ULA_IDL_FA4
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
			B : in  STD_LOGIC_VECTOR (3 downto 0);
         Cin : in  STD_LOGIC;
         Z : out  STD_LOGIC_VECTOR (3 downto 0);
         Cout : out  STD_LOGIC);
end component ULA_IDL_FA4;

component ULA_IDL_SUB4 is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Cin : in  STD_LOGIC;
           Z : out  STD_LOGIC_VECTOR (3 downto 0);
           Cout : out  STD_LOGIC);
end component ULA_IDL_SUB4;

component ULA_IDL_TROCSIN is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           Z : out  STD_LOGIC_VECTOR (3 downto 0);
           Cout : out  STD_LOGIC);
end component ULA_IDL_TROCSIN;

component ULA_IDL_MULTI is
	Port ( A: in STD_LOGIC_VECTOR (3 downto 0);
			 B: in STD_LOGIC_VECTOR (3 downto 0);
			 C: out STD_LOGIC_VECTOR (3 downto 0));
end component ULA_IDL_MULTI;

component ULA_IDL_DIV2 is
	Port ( A: in STD_LOGIC_VECTOR (3 downto 0);
			 D: out STD_LOGIC_VECTOR (3 downto 0));
end component ULA_IDL_DIV2;

component ULA_IDL_AND4 is
	Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
			 B : in STD_LOGIC_VECTOR (3 downto 0);
			 Z : out STD_LOGIC_VECTOR (3 downto 0)
			 );
end component ULA_IDL_AND4;

component ULA_IDL_OR4 is
	Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
			 B : in STD_LOGIC_VECTOR (3 downto 0);
			 Z : out STD_LOGIC_VECTOR (3 downto 0)
			 );
end component ULA_IDL_OR4;


begin

-- Contador de 8 bits. Se considerarmos os 4 primeiros bits para o operando1 e os 4 ultimos para o operando2,
-- temos uma logica análoga à dois contadores, sendo que o segundo contador representa o numero de ciclos do primeiro


	cont : counter_seconds port map (clk, leituraContador);
	
	operador1 (0) <= leituraContador (0);
	operador1 (1) <= leituraContador (1);
	operador1 (2) <= leituraContador (2);
	operador1 (3) <= leituraContador (3);
	operador2 (0) <= leituraContador (4);
	operador2 (1) <= leituraContador (5);
	operador2 (2) <= leituraContador (6);
	operador2 (3) <= leituraContador (7);

-- Ordem Flags: Zero, Negativo, Carry Out e Overflow (MSE para LSE)

	soma: ULA_IDL_FA4 port map(operador1, operador2, '0', res0, flg0(1));
	flg0 (0) <= '0';
	flg0 (2) <= '0';
	flg0 (3) <= '1' when (res0 = "0000")
					else '0';
						
	subtracao: ULA_IDL_SUB4 port map(operador1, operador2, '1' ,res1, flg1(0));
	flg1 (1) <= '0';
	flg1 (2) <= res1(3);
	flg1 (3) <= '1' when (res1 = "0000")
					else '0';
	
	incremento: ULA_IDL_FA4 port map(operador1, "0000", '1', res2, flg2(0));
	
	trocasin: ULA_IDL_TROCSIN port map(operador1, res3, flg3(0));
	
	mult: ULA_IDL_MULTI port map (operador1, operador2, res4);
	
	div2: ULA_IDL_DIV2 port map (operador1, res5);
	
 	and4: ULA_IDL_AND4 port map(operador1, operador2, res6);
	flg6(0) <= '0';
	flg6(1) <= '0';
	flg6(2) <= res6(3);
	flg6(3) <= '1' when (res6 = "0000")
					else '0';
					
	or4: ULA_IDL_OR4 port map(operador1, operador2, res7);
	flg7(0) <= '0';
	flg7(1) <= '0';
	flg7(2) <= res7(3);
	flg7(3) <= '1' when (res7 = "0000")
					else '0';
		

-- Calcula-se todas as operações previamente. Sendo assim, temos 8 direferentes resultados, e 8 diferentes flags	
--Logo, a partir do valor do seletor (operacao), jogamos no resultado o resultado/flag especifico (selecionado)

	with operacao select
	resultado <= res0 when "000",
						res1 when "001",
						res2 when "010",
						res3 when "011",
						res4 when "100",
						res5 when "101",
						res6 when "110",
						res7 when others;
						
	with operacao select
	flags <= flg0 when "000",
					flg1 when "001",
					flg2 when "010",
					flg3 when "011",
					flg4 when "100",
					flg5 when "101",
					flg6 when "110",
					flg7 when others;
					
   display (0) <= resultado (0);
	display (1) <= resultado (1);
	display (2) <= resultado (2);
	display (3) <= resultado (3);
	display (4) <= flags (0);
	display (5) <= flags (1);
	display (6) <= flags (2);
	display (7) <= flags (3);
					

end Behavioral;
