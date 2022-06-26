library Ieee;
use ieee.std_logic_1164.all;

entity ULA_IDL_SUB4 is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Cin : in  STD_LOGIC;
           Z : out  STD_LOGIC_VECTOR (3 downto 0);
           Cout : out  STD_LOGIC);
end ULA_IDL_SUB4;

architecture Behavioral of ULA_IDL_SUB4 is
	component ULA_IDL_FA4
		Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
				B : in  STD_LOGIC_VECTOR (3 downto 0);
				Cin : in  STD_LOGIC;
				Z : out  STD_LOGIC_VECTOR (3 downto 0);
				Cout : out  STD_LOGIC);
	end component ULA_IDL_FA4;
	
	component ULA_IDL_COMPL is
    Port ( 	Xin : in  STD_LOGIC_VECTOR (3 downto 0);
				Sel : in  STD_LOGIC;
				Xout : out  STD_LOGIC_VECTOR (3 downto 0));
	end component ULA_IDL_COMPL;
	
signal NOTB: STD_LOGIC_VECTOR (3 DOWNTO 0);

begin

comp_b: ULA_IDL_COMPL port map (B, Cin, NOTB);

sub: ULA_IDL_FA4 port map (A, NOTB, Cin, Z, Cout);

end Behavioral;
