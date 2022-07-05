library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity CLKDiv_tb is
end;

architecture bench of CLKDiv_tb is

  component CLKDiv
    Port (CLK: in STD_LOGIC;
          CLK_SEC: out STD_LOGIC;
          CLKanode: out STD_LOGIC);
  end component;

  signal CLK: STD_LOGIC;
  signal CLK_SEC: STD_LOGIC;
  signal CLKanode: STD_LOGIC;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: CLKDiv port map ( CLK      => CLK,
                         CLK_SEC  => CLK_SEC,
                         CLKanode => CLKanode );

--  stimulus: process
--  begin
--     clk <= '0';
--     wait for clock_period;
--     clk <= '1';
--     wait for clock_period;

 --   wait;
--  end process;

  clocking: process
  begin 
     stop_the_clock <= false;
    while not stop_the_clock loop
      CLK <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;
  