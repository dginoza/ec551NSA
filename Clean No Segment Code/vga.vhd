
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity VGA is
    Port ( CLK25 : in  STD_LOGIC;									-- Horloge d'entrée de 25 MHz							
			  clkout : out  STD_LOGIC;					-- Horloge de sortie vers le ADV7123 et l'écran TFT
           rez_160x120 : IN std_logic;
           rez_320x240 : IN std_logic;
           Hsync,Vsync : out  STD_LOGIC;						-- les deux signaux de synchronisation pour l'écran VGA
			  Nblank : out  STD_LOGIC;								-- Converter control signal N/A ADV7123
           activeArea : out  STD_LOGIC;
			  Nsync : out  STD_LOGIC				-- Synchronization signals and control of the LCD screen
			  );
end VGA;

architecture Behavioral of VGA is
signal Hcnt:STD_LOGIC_VECTOR(9 downto 0):="0000000000";		-- pour le comptage des colonnes
signal Vcnt:STD_LOGIC_VECTOR(9 downto 0):="1000001000";		-- pour le comptage des lignes original: 1000001000
signal video:STD_LOGIC;
constant HM: integer :=658;	--la taille maximale considéré 800 (horizontal) // orig 799
constant HD: integer :=640;	--size of screen (horizontal)
constant HF: integer :=16;		--front porch
constant HB: integer :=48;		--back porch
constant HR: integer :=96;		--sync time
constant VM: integer :=524;	--The maximum size considered 525 (vertical)	
constant VD: integer :=480;	--Size of Screen (vertical), originally 480, 500 no better
constant VF: integer :=10;		--front porch, increase seems to push frame up
constant VB: integer :=33;		--back porch
constant VR: integer :=2;		--retrace, changed to 20 didnt seem to make better or worse

begin

-- Initialization of a counter from 0 to 799 (800 pixels per line):
-- each clock edge increments the column counter
-- that is, from 0 to 799.
	process(CLK25)
		begin
			if (CLK25'event and CLK25='1') then
				if (Hcnt = HM) then
					Hcnt <= "0000000000";
               if (Vcnt= VM) then
                  Vcnt <= "0000000000";
                  activeArea <= '1';
               else
                  if rez_160x120 = '1' then
                     if vCnt < 120-1 then
                        activeArea <= '1';
                     end if;
                  elsif rez_320x240 = '1' then
                     if vCnt < 240-1 then
                        activeArea <= '1';
                     end if;
                  else
                     if vCnt < 480-1 then -- 480 originally, 500 no white bar on right, but repeated bar, 520 no better.
                        activeArea <= '1';
                     end if;
                  end if;
                  Vcnt <= Vcnt+1;
               end if;
				else
               if rez_160x120 = '1' then
                  if hcnt = 160-1 then
                     activeArea <= '0';
                  end if;
               elsif rez_320x240 = '1' then
                  if hcnt = 320-1 then
                     activeArea <= '0';
                  end if;
               else
                  if hcnt = 640-1 then -- 640 orignally, not the issue 
                     activeArea <= '0';
                  end if;
               end if;
					Hcnt <= Hcnt + 1;
				end if;
			end if;
		end process;
----------------------------------------------------------------

-- Generation of the horizontal sync signal Hsync:
	process(CLK25)
		begin
			if (CLK25'event and CLK25='1') then
				if (Hcnt >= (HD+HF) and Hcnt <= (HD+HF+HR-1)) then   --- Hcnt >= 656 and Hcnt <= 751
					Hsync <= '0';
				else
					Hsync <= '1';
				end if;
			end if;
		end process;
----------------------------------------------------------------

-- génération du signal de synchronisation verticale Vsync:
	process(CLK25)
		begin
			if (CLK25'event and CLK25='1') then
				if (Vcnt >= (VD+VF-1) and Vcnt <= (VD+VF+VR-1)) then  ---Vcnt >= 490 and vcnt<= 491 ... pushed to 500 and 501 seemed to mess up as original... 480-481
					Vsync <= '0';
				else
					Vsync <= '1';
				end if;
			end if;
		end process;
----------------------------------------------------------------

-- Nblank and Nsync to order the cover ADV7123:
Nsync <= '1';
video <= '1' when (Hcnt < HD) and (Vcnt < VD)			-- This is to use the full resolution 640 x 480	
	      else '0';
Nblank <= video;
clkout <= CLK25;

		
end Behavioral;

