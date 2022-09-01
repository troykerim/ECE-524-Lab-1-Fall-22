library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity full_adder_n_bit_tb is
--  Port ( );
end full_adder_n_bit_tb;

architecture Behavioral of full_adder_n_bit_tb is

component full_adder_n_bit is 
    Generic (n: integer := 4);
    Port ( x : in std_logic_vector (n-1 downto 0);
           y : in std_logic_vector (n-1 downto 0);
           carry_in : in std_logic;
           sum : out std_logic_vector (n-1 downto 0);
           carry_out : out std_logic
          );
end component;

constant n: integer := 4;
constant CP: time := 10ns;

signal x_tb : std_logic_vector (n-1 downto 0);
signal y_tb : std_logic_vector (n-1 downto 0);
signal carry_in_tb : std_logic;
signal sum_tb : std_logic_vector (n-1 downto 0);
signal carry_out_tb : std_logic;
signal clk_tb : std_logic;

begin

uui_nbit_adder: full_adder_n_bit 
generic map (n => n)
port map(
x => x_tb,
y => y_tb,
carry_in => carry_in_tb,
sum => sum_tb,
carry_out => carry_out_tb);

process 
begin
clk_tb <= '1';
wait for CP/2;
clk_tb <= '0';
wait for CP/2;
end process;

process
begin

wait for CP;

x_tb <= "0001";
y_tb <= "0001";
carry_in_tb <= '0';
wait for CP; 

x_tb <= "0010";
y_tb <= "0001";
carry_in_tb <= '0';
wait for CP; 

x_tb <= "0010";
y_tb <= "0010";
carry_in_tb <= '0';
wait for CP; 

x_tb <= "0011";
y_tb <= "0011";
carry_in_tb <= '0';
wait for CP; 

x_tb <= "1011";
y_tb <= "1011";
carry_in_tb <= '0';
wait for CP; 

x_tb <= "1111";
y_tb <= "1111";
carry_in_tb <= '1';
wait; 
end process;



end Behavioral;
