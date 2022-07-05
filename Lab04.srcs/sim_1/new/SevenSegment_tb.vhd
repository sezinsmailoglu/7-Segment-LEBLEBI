
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity SevenSegment_tb is
end;

architecture bench of SevenSegment_tb is

  component SevenSegment
                          Port ( LeblebiSignal: in STD_LOGIC_VECTOR (15 downto 0 );
                                  CLK_480 :in STD_LOGIC;
                                  ANODE : out STD_LOGIC_VECTOR (3 downto 0);
                                  LedOut :out STD_LOGIC_VECTOR(6 downto 0));
  end component;

  signal LeblebiSignal: STD_LOGIC_VECTOR (15 downto 0 );
  signal CLK_480: STD_LOGIC;
  signal ANODE: STD_LOGIC_VECTOR (3 downto 0);
  signal LedOut: STD_LOGIC_VECTOR(6 downto 0);

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: SevenSegment port map ( LeblebiSignal => LeblebiSignal,
                               CLK_480       => CLK_480,
                               ANODE         => ANODE,
                               LedOut        => LedOut );

  stimulus: process
  begin
      stop_the_clock <= false;
              LeblebiSignal <= "0000000000000000";
              wait for 40 ns;
              LeblebiSignal <= "0000000000000001";
              wait for 40 ns;
              LeblebiSignal <= "0000000000010010";
              wait for 40 ns;
              LeblebiSignal <= "0000000100100011";
              wait for 40 ns;
              LeblebiSignal <= "0001001000110100";
              wait for 40 ns;
              LeblebiSignal <= "0010001101000101";
              wait for 40 ns;
              LeblebiSignal <= "0011010001010110";
              wait for 40 ns;
              LeblebiSignal <= "0100010101100111";
              wait for 40 ns;
              LeblebiSignal <= "0101011001110000";
              wait for 40 ns;
              LeblebiSignal <= "0110011100000000";
              wait for 40 ns;
              LeblebiSignal <= "0111000000000000";
              wait for 40 ns;


    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      CLK_480 <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;