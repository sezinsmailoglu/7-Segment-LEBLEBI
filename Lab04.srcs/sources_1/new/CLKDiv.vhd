library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CLKDiv is
  Port (CLK: in STD_LOGIC;
        CLK_SEC: out STD_LOGIC;
        CLKanode: out STD_LOGIC);
end CLKDiv;

architecture Behavioral of CLKDiv is
SIGNAL CLKANODES, CLK_SECS : STD_LOGIC := '0';
begin
process(CLK)--CLKANODE keeps the leds on
    variable count1 : unsigned (2 downto 0):= "000";  
    begin
    if rising_edge(CLK) then 
    if count1 = "111" then --208333
    count1 := "000";
    CLKANODES <= not CLKANODES;
    end if;
    count1 := count1 + 1;
    end if;
end process;
process (CLK) --CLK_SEC
   variable count : unsigned (5 downto 0):= "000000" ;
   begin 
   if rising_edge(CLK) then 
   if count = "111111" then 
   count :=   "000000";
   CLK_SECS <= not CLK_SECS;
   end if;
   count := count + 1;
   end if;
end process;
clk_Sec <= CLK_SECS;
clkanode <= clkanodes;

end Behavioral;
