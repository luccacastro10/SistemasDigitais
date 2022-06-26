----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:18:06 05/26/2022 
-- Design Name: 
-- Module Name:    ULA_IDL_COMPL - Behavioral 
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

entity ULA_IDL_COMPL is
    Port ( 	Xin : in  STD_LOGIC_VECTOR (3 downto 0);
				Sel : in  STD_LOGIC;
				Xout : out  STD_LOGIC_VECTOR (3 downto 0));
end ULA_IDL_COMPL;

architecture Behavioral of ULA_IDL_COMPL is

begin

Xout(0) <= Sel XOR Xin(0);
Xout(1) <= Sel XOR Xin(1);
Xout(2) <= Sel XOR Xin(2);
Xout(3) <= Sel XOR Xin(3);

end Behavioral;

