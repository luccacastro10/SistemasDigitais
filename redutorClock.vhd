library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity redutorClock is
	Port (
		clkin : in std_logic;
		clkRed : out std_logic);
end redutorClock;

architecture Behavioral of redutorClock is

begin
	process (clkin)
	variable count: integer:= 0;
		begin
			if (clkin'event and clkin = '1') then
				if (count < 50_000_000) then
					clkRed <= '0';
				else
					clkRed <= '1';
				end if;
				
				if (count = 100_000_000) then
					count := 0;
				else
					count := count + 1;
				end if;
			end if;
		end process;

end Behavioral;
