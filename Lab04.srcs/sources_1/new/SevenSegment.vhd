
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity SevenSegment is
                        Port ( LeblebiSignal: in STD_LOGIC_VECTOR (15 downto 0 );
                                CLK_480 :in STD_LOGIC;
                                ANODE : out STD_LOGIC_VECTOR (3 downto 0);
                                LedOut :out STD_LOGIC_VECTOR(6 downto 0));
end SevenSegment;

architecture Behavioral of SevenSegment is   
    signal Leblebi : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal Led_activating_counter : STD_LOGIC_VECTOR(1 downto 0) := "00";
    begin
    process(CLK_480, Led_Activating_counter)
    begin 
    if (rising_edge(CLK_480)) then 
        case (Led_Activating_counter) is
            when "00" => Led_activating_counter <= "01";
            when "01" => Led_Activating_counter <= "10";
            when "10" => Led_Activating_Counter <= "11";
            when "11" => Led_activating_counter <= "00";
            when others => Led_activating_Counter <= "00"; --this won't happen
         end case;
    end if;
end process;
    
   process(LED_activating_counter) is 
    begin
        case LED_activating_counter is
        when "00" =>
            Anode <= "0111"; 
            -- activate LED1 and Deactivate LED2, LED3, LED4
            Leblebi <= LeblebiSignal(15 downto 12);

        when "01" =>
            Anode <= "1011"; 
            -- activate LED2 and Deactivate LED1, LED3, LED4
            Leblebi <= LeblebiSignal(11 downto 8);

        when "10" =>
            Anode <= "1101"; 
            -- activate LED3 and Deactivate LED2, LED1, LED4
            Leblebi <= LeblebiSignal(7 downto 4);

        when "11" =>
            Anode <= "1110"; 
            -- activate LED4 and Deactivate LED2, LED3, LED1
            Leblebi <= LeblebiSignal(3 downto 0);
        when others => Anode  <="0000";
        Leblebi <= "0000";
        end case;
    end process;
    
process(Leblebi)
    begin
    case (Leblebi) is 
           when "0000" => LedOut <= "1111110";-- -
           when "0001" => LedOut <= "1110001";-- L
           when "0010" => LedOut <= "0110000";-- E
           when "0011" => LedOut <= "0000000";-- B
           when "0100" => LedOut <= "1110001";-- L
           when "0101" => LedOut <= "0110000";-- E
           when "0110" => LedOut <= "0000000";-- B
           when "0111" => LedOut <= "1111001";-- I
           when others => LedOut <= "0000000";
            end case;
end process;
end Behavioral;
