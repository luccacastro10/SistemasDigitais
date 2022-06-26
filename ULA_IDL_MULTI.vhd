library Ieee;
use ieee.std_logic_1164.all;

entity ULA_IDL_MULTI is
	Port ( A: in STD_LOGIC_VECTOR (3 downto 0);
			 B: in STD_LOGIC_VECTOR (3 downto 0);
			 C: out STD_LOGIC_VECTOR (3 downto 0));
end ULA_IDL_MULTI;

architecture LOGICA_ULA_IDL_MULTI of ULA_IDL_MULTI is
	
	signal C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16: STD_LOGIC := '0';
	signal S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12, S13, S14: STD_LOGIC := '0';
	signal M: STD_LOGIC_VECTOR (3 downto 0);
	
begin
	M(0) <= A(0) AND B(0);
	
	M(1) <= (A(1) AND B(0)) xOR (A(0) AND B(1));
	C1 <= A(1) AND B(0) AND A(0) AND B(1);
	
	M(2) <= (((A(2) AND B(0)) XOR (A(1) AND B(1))) XOR (A(0) AND B(2))) XOR C1;
	
	S1 <= ((A(2) AND B(0)) XOR (A(1) AND B(1)));
	S2 <= ((A(0) AND B(2)) XOR C1);
	C2 <= (A(2) AND B(0) AND A(1) AND B(1));
	C3 <= (A(0) AND B(2) AND C1);
	C4 <= S1 AND S2;
	
	M(3) <= ((((A(3) AND B(0)) XOR (A(2) AND B(1))) XOR (A(1) AND B(2))) XOR (A(0) AND B(3))) XOR C3 XOR C4;
	
end LOGICA_ULA_IDL_MULTI;