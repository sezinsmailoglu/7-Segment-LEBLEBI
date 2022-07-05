library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity LeblebiSignalGenerator is
      Port (CLK_SEC : in STD_LOGIC;
            LeblebiSignal : out STD_LOGIC_VECTOR(15 downto 0) );
            
end LeblebiSignalGenerator;
architecture Behavioral of LeblebiSignalGenerator is
            SIGNAL state: STD_LOGIC_VECTOR(3 downto 0) := "0000";
begin
    process (CLK_SEC, state)
    begin
    if rising_edge(CLK_SEC) then   
        case (state) is 
            when "0000"=> 
            LeblebiSignal <= "0000000000000000";
            state <=  "0001";
            when "0001" => 
            LeblebiSignal <= "0000000000000001";
            state <= "0010";
            when  "0010" => 
            LeblebiSignal <= "0000000000010010";
            state <= "0011";
            when "0011" => 
            LeblebiSignal <= "0000000100100011";
            state <=  "0100";
            when "0100" => 
            LeblebiSignal <= "0001001000110100";
            state <= "0101";
            when "0101" => 
            LeblebiSignal <= "0010001101000101";
            state <= "0110";    
            when "0110" => 
            LeblebiSignal <= "0011010001010110";
            state <= "0111";
            when "0111" => 
            LeblebiSignal <= "0100010101100111";
            state <= "1000";
            when "1000" => 
            LeblebiSignal <= "0101011001110000";
            state <= "1001";
            when "1001" =>
            LeblebiSignal <= "0110011100000000";
            state <= "1010";
            when "1010" => 
            LeblebiSignal <= "0111000000000000";
            state <= "0000";
            when others => -- this should never happen
            LeblebiSignal <= "0000000000000000";
            state <= "0000"; 
            end case;
        end if;
    end process;
end Behavioral;
