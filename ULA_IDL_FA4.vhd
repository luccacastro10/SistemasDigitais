----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:24:34 05/19/2022 
-- Design Name: 
-- Module Name:    ULA_IDL_FA4 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ULA_IDL_FA4 is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Cin : in  STD_LOGIC;
           Z : out  STD_LOGIC_VECTOR (3 downto 0);
           Cout : out  STD_LOGIC);
end ULA_IDL_FA4;

architecture Behavioral of ULA_IDL_FA4 is
	Component ULA_IDL_FA is
		Port ( A : in  STD_LOGIC;
				B : in  STD_LOGIC;
				Cin : in  STD_LOGIC;
				Z : out  STD_LOGIC;
				Cout : out  STD_LOGIC);
	end Component;
	
SIGNAL C_TEMP: STD_LOGIC_VECTOR (3 DOWNTO 0);
begin

C_TEMP(0) <= Cin;

fa0: ULA_IDL_FA port map(A(0), B(0), C_TEMP(0), Z(0), C_TEMP(1));
fa1: ULA_IDL_FA port map(A(1), B(1), C_TEMP(1), Z(1), C_TEMP(2));
fa2: ULA_IDL_FA port map(A(2), B(2), C_TEMP(2), Z(2), C_TEMP(3));
fa3: ULA_IDL_FA port map(A(3), B(3), C_TEMP(3), Z(3), Cout);


end Behavioral;
