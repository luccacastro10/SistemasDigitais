library Ieee;
use ieee.std_logic_1164.all;

entity ULA_IDL_OR4 is
	Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
			 B : in STD_LOGIC_VECTOR (3 downto 0);
			 Z : out STD_LOGIC_VECTOR (3 downto 0)
			 );
end ULA_IDL_OR4;

architecture Behavioral of ULA_IDL_OR4 is


begin

Z(0) <= A(0) OR B(0);

Z(1) <= A(1) OR B(1);

Z(2) <= A(2) OR B(2);

Z(3) <= A(3) OR B(3);

end Behavioral;
