
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity main is
    Port ( CLK100MHZ, RST : in  STD_LOGIC;
             COUNT : inout  STD_LOGIC_VECTOR (3 downto 0));
end main;

architecture Behavioral of main is

	component custom_clk is
    		port ( clk,reset: in std_logic; clock_out: out std_logic);
	end component;
	signal clk1Hz: STD_LOGIC;
begin
    clk1: custom_clk PORT MAP (clk => CLK100MHZ, reset => '0', clock_out => clk1Hz);
    process (clk1Hz,RST)
    begin
        if (RST = '1') then
            COUNT <= "0000";
        elsif(rising_edge(clk1Hz)) then
            COUNT <= COUNT+1;
        end if;
    end process;
end Behavioral;