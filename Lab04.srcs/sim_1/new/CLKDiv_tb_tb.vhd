----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/31/2018 01:42:17 PM
-- Design Name: 
-- Module Name: CLKDiv_tb_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity CLKDiv_tb_tb is
end;

architecture bench of CLKDiv_tb_tb is

  component CLKDiv
    Port (CLK: in STD_LOGIC;
          CLK_SEC: out STD_LOGIC;
          CLKanode: out STD_LOGIC);
  end component;

  signal CLK: STD_LOGIC;
  signal CLKsec: STD_LOGIC;
  signal CLKanode: STD_LOGIC;

  constant clock_period: time := 10 ns;

begin

  uut: CLKDiv port map ( CLK      => CLK,
                         CLK_SEC  => CLKsec,
                         CLKanode => CLKanode );

 
  clocking: process
  begin 
      CLK <= '0';
      wait for clock_period /2 ;
       CLK <= '1';
       WAIT FOR clock_period /2 ;
  end process;

end;
  
