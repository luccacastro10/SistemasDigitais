library ieee;
use ieee.std_logic_1164.all;

entity ULA_IDL_DIV2 is
	Port ( A: in STD_LOGIC_VECTOR (3 downto 0);
			 D: out STD_LOGIC_VECTOR (3 downto 0));
end ULA_IDL_DIV2;

architecture LOGICA_ULA_IDL_DIV2 of ULA_IDL_DIV2 is
begin
	D(0) <= A(1);
	D(1) <= A(2);
	D(2) <= A(3);
	D(3) <= '0';

end LOGICA_ULA_IDL_DIV2;