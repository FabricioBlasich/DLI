library ieee;
Library lpm;
use ieee.std_logic_1164.all;
Use lpm.lpm_components.all;


entity Ejercicio2_Lab2 is
	GENERIC(ancho : natural := 3);
	port 
	(
		A, B : in std_logic_vector(ancho-1 downto 0);
		displaySuma : out std_logic_vector(0 to 6);
		--displayInputA : out std_logic_vector(6 downto 0);
		--displayInputB : out std_logic_vector(6 downto 0);
		actDisplaySuma: out std_logic
		--actDisplayInputA: out std_logic;
		--actDisplayInputB: out std_logic

		
	);	

end entity;

architecture a_Ejercicio2_Lab2 of Ejercicio2_Lab2 is

--Varicles intermedia 
	SIGNAL resultadoSum : std_logic_vector(ancho-1 downto 0);
	SIGNAL cout : std_logic;
	SIGNAL inDeco : std_logic_vector(ancho downto 0);

begin
	
	-- Instancio el sumador
	addSub: lpm_add_sub GENERIC MAP(LPM_WIDTH => 3) 
		PORT MAP(dataa => A, datab => NOT B(2) & NOT B(1) & B(0), result => resultadoSum , cout => cout);
		
	--Junto en un std_vector el resultado de la sumador mas el carry para poder pasarlo como entrada al deco
	inDeco <= cout & resultadoSum;
	
	
	-- Instancio mi deco4a7
	DecoderSuma : entity work.Deco4a7 port map(input => inDeco, output => displaySuma, display => actDisplaySuma);
	
	--DecoderInputA : entity work.Deco4a7 port map(input => '0' & A,  output => displaySuma, displayInputA => actDisplayInputA);
	--DecoderInputB : entity work.Deco4a7 port map(input => '0' & A,  output => displaySuma, displayInputA => actDisplayInputA);
	

end a_Ejercicio2_Lab2;