
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TopModule is
  Port ( CLK : in STD_LOGIC;
        AnodeOut : out STD_LOGIC_VECTOR (3 downto 0);
        Led_Out :out STD_LOGIC_VECTOR(6 downto 0));
end TopModule;

architecture Behavioral of TopModule is
component CLKdiv 
  Port (CLK: in STD_LOGIC;
      CLK_SEC: out STD_LOGIC;
      CLKanode: out STD_LOGIC);
end component;

component LeblebiSignalGenerator 
      Port (CLK_SEC : in STD_LOGIC;
      LeblebiSignal : out STD_LOGIC_VECTOR(15 downto 0) );   
end component;

component SevenSegment 
      Port ( LeblebiSignal: in STD_LOGIC_VECTOR (15 downto 0 );
      CLK_480 :in STD_LOGIC;
      ANODE : out STD_LOGIC_VECTOR (3 downto 0);
      LedOut :out STD_LOGIC_VECTOR(6 downto 0));
end component;
signal clksec, clk480 : STD_LOGIC;
signal leblebi_signal: STD_LOGIC_VECTOR(15 downto 0);
begin 
comp0 : CLKdiv port map(CLK => CLK, CLKanode => CLk480, CLK_SEC => clksec);
comp1 : LeblebiSignalGenerator port map (CLK_SEC => CLKSEC, LeblebiSignal => Leblebi_signal);
comp2 : SevenSegment port map( LeblebiSignal => Leblebi_Signal, clk_480 => clk480, anode => anodeOut, LedOut => Led_out);
end Behavioral;
