library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Deklarasi Entity
entity mux4to1 is
    Port (
        sel : in  STD_LOGIC_VECTOR (1 downto 0); -- Selektor 2-bit
        in0 : in  STD_LOGIC_VECTOR (3 downto 0); -- Input 0 (4-bit)
        in1 : in  STD_LOGIC_VECTOR (3 downto 0); -- Input 1 (4-bit)
        in2 : in  STD_LOGIC_VECTOR (3 downto 0); -- Input 2 (4-bit)
        in3 : in  STD_LOGIC_VECTOR (3 downto 0); -- Input 3 (4-bit)
        y   : out STD_LOGIC_VECTOR (3 downto 0)  -- Output (4-bit)
    );
end mux4to1;

-- Deklarasi Architecture
architecture Behavioral of mux4to1 is
begin
    -- Process sekuensial dengan Sensitivity List
    process (sel, in0, in1, in2, in3)
    begin
        case sel is
            when "00" => y <= in0;
            when "01" => y <= in1;
            when "10" => y <= in2;
            when "11" => y <= in3;
            when others => y <= (others => 'X');
        end case;
    end process;
end Behavioral;