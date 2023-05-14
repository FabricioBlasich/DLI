
library ieee;
LIBRARY lpm;
use ieee.std_logic_1164.all;
USE lpm.lpm_components.all;

entity Ejercicio3_Lab2 is

	generic
	(
		DATA_WIDTH : natural := 3
	);

	port 
	(
		A, B	: in std_logic_vector((DATA_WIDTH-1) downto 0);
		displayComp : out std_logic_vector(0 to 6);
--		diplayInputA: out std_logic_vector(0 to 6);
--		diplayInputB: out std_logic_vector(0 to 6);
--		activadorDisplayA : out std_logic;
--		activadorDisplayB : out std_logic;
		activadorDisplayComp : out std_logic
	);

end entity;

architecture a_Ejercicio3_Lab2 of Ejercicio3_Lab2 is

	SIGNAL outputComparador : std_logic_vector(2 downto 0);
	
	
	
begin

	comparador: lpm_compare GENERIC MAP (LPM_WIDTH => DATA_WIDTH)
		PORT MAP (dataa => A, datab =>  B(0) & NOT B(1) & NOT B(2), alb => outputComparador(0), aeb => outputComparador(1), agb => outputComparador(2));
		
	activadorDisplayComp <= '1';
	
	WITH outputComparador SELECT
		displayComp <= "0001101" when "001",
							"0001001" when "010",
							"0011001" when "100",
					  "1111111" when others;
					  
	--Decos para visualizar lar entradas
		--DecoInputA : entity work.Deco4a7 port map(input => A, output => diplayInputA, display => activadorDisplayA);
		--DecoInputB : entity work.Deco4a7 port map(input => B, output => diplayInputB, display => activadorDisplayB);
		

end a_Ejercicio3_Lab2;