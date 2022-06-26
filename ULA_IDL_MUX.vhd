----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:34:52 05/26/2022 
-- Design Name: 
-- Module Name:    ULA_IDL_MUX - Behavioral 
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

entity ULA_IDL_MUX is
    Port ( Yin : in  STD_LOGIC_VECTOR (3 downto 0);
           Sel : in  STD_LOGIC;
           Yout : out  STD_LOGIC_VECTOR (3 downto 0));
end ULA_IDL_MUX;

architecture Behavioral of ULA_IDL_MUX is

SIGNAL zero: STD_LOGIC_VECTOR (3 DOWNTO 0):= "0000";
begin

Yout <= Yin when Sel = '1' else zero;

end Behavioral;

