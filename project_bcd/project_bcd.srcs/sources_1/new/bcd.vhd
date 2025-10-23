----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.12.2024 16:26:11
-- Design Name: 
-- Module Name: bcd - Behavioral
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
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bcd is
    Port (  
            counter_clk : in STD_LOGIC; --semnalul de ceas de 100MHz
            select_in : in STD_LOGIC;
            reset_in : in STD_LOGIC;
            an 	: out STD_LOGIC_VECTOR(3 downto 0);
            seg 	: out STD_LOGIC_VECTOR(6 downto 0); --segmentele din display
            Val_in : in STD_LOGIC_VECTOR(3 downto 0);
            out_div : buffer STD_LOGIC ---pt divizor..buffer ca sa putem simciti valoarea
            );
end bcd;

architecture Behavioral of bcd is

        signal a : std_logic_vector(3 downto 0):="0000"; -- semnal pentru control bcd
begin 
    -- activam Displayul 7
   an <= "0000"; 
   process(counter_clk,reset_in) --divizor de frecventa, facem perioada 1 secunda --reducem de la 100MHz la 1Hz
            variable n : integer range 0 to 1000000000;
   begin
        if reset_in ='1' then 
                    n:=0;--reset pentru divizor
                    out_div  <= '0';
        elsif counter_clk'event and counter_clk='1' then ------------divizor frecventa
                if n < 100000000 then
                    n := n + 1;
                else
                    n := 0;
                end if;
                
                if n < 50000000 then
                    out_div  <= '1';  -- Semnalul de 1 Hz
                else
                    out_div  <= '0';  -- Semnalul de 1 Hz
                end if;
         end if;
    end process; 
               
     process(reset_in,select_in, out_div,a,Val_in)
     begin  
           if reset_in ='1' then 
               a <= (others => '0');         
           else 
                if select_in='1' then ---bcd/registru paralel
                        if out_div = '1' and out_div'event then
                                if a = "1001" then  -- Dacă se ajunge la 9 (1001), revine la 0
                                    a <= "0000";
                                else
                                    a <= a + 1;  -- Incrementare
                                end if;
                         end if;
                 else
                        a <= Val_in;
                 end if;
           end if;
                end process;
               
    
    seg(0) <= (a(2) and not(a(1)) and not(a(0))) or (not(a(3)) and not(a(2)) and not(a(1)) and a(0));
	seg(1) <= (a(2) and not(a(1)) and a(0)) or (a(2) and a(1) and not(a(0)));
	seg(2) <= (not(a(2)) and a(1) and not(a(0)));
	seg(3) <= (a(2) and not(a(1)) and not(a(0))) or (a(2) and a(1) and a(0)) or (not(a(3)) and not(a(2)) and not(a(1)) and a(0));
	seg(4) <= a(0) or (a(2) and not(a(1)));
	seg(5) <= (not(a(3)) and not(a(2)) and a(0)) or (a(1) and a(0)) or (not(a(3)) and not(a(2)) and a(1));
	seg(6) <= (not(a(3)) and not(a(2)) and not(a(1))) or (a(2) and a(1) and a(0));

end Behavioral;
