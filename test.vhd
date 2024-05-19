
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity test is
    
end test;

architecture Behavioral of test is

    component main is
        Port ( CLK100MHZ, RST : in  STD_LOGIC;
                 COUNT : inout  STD_LOGIC_VECTOR (3 downto 0));
    end component;
    signal rst_out: STD_LOGIC := '0';
    signal clk_out: STD_LOGIC;
    signal count_out : STD_LOGIC_VECTOR (3 downto 0);
begin
    counter: main PORT MAP (CLK100MHZ => clk_out, RST => rst_out, COUNT => count_out);
    process
    begin
        clk_out <= '0';
        rst_out <= '1';
        wait for 50ns;
        rst_out <= '0';
        wait for 50ns;
        loop
            clk_out <= '1';
            wait for 10ns;
            clk_out <= '0';
            wait for 10ns;
        end loop;
    end process;
end Behavioral;
