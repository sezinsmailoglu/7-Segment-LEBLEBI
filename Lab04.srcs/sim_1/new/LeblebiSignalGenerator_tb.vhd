library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity LeblebiSignalGenerator_tb is
end;

architecture bench of LeblebiSignalGenerator_tb is

  component LeblebiSignalGenerator
        Port (CLK_SEC : in STD_LOGIC;
              LeblebiSignal : out STD_LOGIC_VECTOR(15 downto 0) );
  end component;

  signal CLK_SEC: STD_LOGIC;
  signal LeblebiSignal: STD_LOGIC_VECTOR(15 downto 0) ;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: LeblebiSignalGenerator port map ( CLK_SEC       => CLK_SEC,
                                         LeblebiSignal => LeblebiSignal );

  stimulus: process
  begin

    stop_the_clock <= false;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      CLK_SEC <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;
  
