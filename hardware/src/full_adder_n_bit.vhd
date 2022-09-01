library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity full_adder_n_bit is
    Generic (n: integer := 4);
    Port ( x : in std_logic_vector (n-1 downto 0);
           y : in std_logic_vector (n-1 downto 0);
           sum : out std_logic_vector (n-1 downto 0);
           carry_out : out std_logic
          );
end full_adder_n_bit;

architecture Behavioral of full_adder_n_bit is

component full_adder 
    Port ( x : std_logic;
           y : std_logic;
           carry_in : in std_logic;
           sum : out std_logic;
           carry_out : out std_logic 
          );
end component;

signal carry_next: std_logic_vector (n downto 0);

begin
carry_next(0) <= '0';
carry_out <= carry_next(n);

FA: for i in 0 to n-1 generate 
    FA_i: full_adder Port map (
        x => x(i),
        y => y(i),
        carry_in => carry_next(i),
        sum => sum(i),
        carry_out => carry_next(i+1));
end generate;

end Behavioral;
