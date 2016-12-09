----------------------------------------------------------------------------------
-- Engineer: Mike Field <hamster@snap.net.nz>
-- 
-- Module Name: top_level - Behavioral 
-- Description: Top level module of the Zedboard OV7670 design
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_level is
    Port ( clk100          : in  STD_LOGIC;
           btnl            : in  STD_LOGIC;
           btnc            : in  STD_LOGIC;
           btnr            : in  STD_LOGIC;
			  btnu				: in STD_LOGIC;
           config_finished : out STD_LOGIC;
			  vsyncLed			: out STD_LOGIC;
           
           vga_hsync : out  STD_LOGIC;
           vga_vsync : out  STD_LOGIC;
           vga_r     : out  STD_LOGIC_vector(3 downto 0);
           vga_g     : out  STD_LOGIC_vector(3 downto 0);
           vga_b     : out  STD_LOGIC_vector(3 downto 0);
           
           ov7670_pclk  : in  STD_LOGIC;
           ov7670_xclk  : out STD_LOGIC;
           ov7670_vsync : in  STD_LOGIC;
           ov7670_href  : in  STD_LOGIC;
           ov7670_data  : in  STD_LOGIC_vector(7 downto 0);
           ov7670_sioc  : out STD_LOGIC;
           ov7670_siod  : inout STD_LOGIC;
           ov7670_pwdn  : out STD_LOGIC;
           ov7670_reset : out STD_LOGIC
           );
end top_level;

architecture Behavioral of top_level is

	COMPONENT VGA
	PORT(
		CLK25 : IN std_logic;    
      rez_160x120 : IN std_logic;
      rez_320x240 : IN std_logic;
		Hsync : OUT std_logic;
		Vsync : OUT std_logic;
		Nblank : OUT std_logic;      
		clkout : OUT std_logic;
		activeArea : OUT std_logic;
		Nsync : OUT std_logic;
		HcntOut : out std_logic_vector(9 downto 0);
		VcntOut : out std_logic_vector(9 downto 0)
		);
	END COMPONENT;
	
	COMPONENT vga640x480
	PORT(
		dclk	: IN STD_LOGIC;
		clr	: IN STD_LOGIC;
		seg1Count : IN std_logic_vector(4 downto 0);
		seg2Count : IN std_logic_vector(4 downto 0);
		seg3Count : IN std_logic_vector(4 downto 0);
		seg4Count : IN std_logic_vector(4 downto 0);
		seg5Count : IN std_logic_vector(4 downto 0);
		seg6Count : IN std_logic_vector(4 downto 0);	
		hsync	: OUT STD_LOGIC;
		vsync : OUT STD_LOGIC;
		red : OUT STD_LOGIC_vector(3 downto 0);
		green : OUT STD_LOGIC_vector(3 downto 0);
		blue : OUT STD_LOGIC_vector(3 downto 0)
		);
		END COMPONENT;
	
	COMPONENT mux
	PORT(
		sel	: IN STD_LOGIC;
		vgaR1 : IN STD_LOGIC_vector(3 downto 0);
		vgaG1 : IN STD_LOGIC_vector(3 downto 0);
		vgaB1 : IN STD_LOGIC_vector(3 downto 0);
		vgaH1 : IN STD_LOGIC;
		vgaV1 : IN STD_LOGIC;
		vgaR2 : IN STD_LOGIC_vector(3 downto 0);
		vgaG2 : IN STD_LOGIC_vector(3 downto 0);
		vgaB2 : IN STD_LOGIC_vector(3 downto 0);
		vgaH2 : IN STD_LOGIC;
		vgaV2 : IN STD_LOGIC;
		vgaRout : out STD_LOGIC_vector(3 downto 0);
		vgaGout : out STD_LOGIC_vector(3 downto 0);
		vgaBout : out STD_LOGIC_vector(3 downto 0);
		vgaHout : out STD_LOGIC;
		vgaVout : out STD_LOGIC
		);
	END COMPONENT;
	
	COMPONENT segment
	PORT(
		hcnt : IN std_logic_vector(9 downto 0);
		vcnt : IN std_logic_vector(9 downto 0);
		pixelIn : IN std_logic_vector(11 downto 0);
		pixelOut : OUT std_logic_vector(11 downto 0);
		seg1Count : OUT std_logic_vector(4 downto 0);
		seg2Count : OUT std_logic_vector(4 downto 0);
		seg3Count : OUT std_logic_vector(4 downto 0);
		seg4Count : OUT std_logic_vector(4 downto 0);
		seg5Count : OUT std_logic_vector(4 downto 0);
		seg6Count : OUT std_logic_vector(4 downto 0)		
		);
	END COMPONENT;
	
	COMPONENT sys_array
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		datainRGB : IN std_logic_vector(11 downto 0);
		pixel_rdy : IN std_logic;
		num_pix_ok : IN std_logic;
		pixOut : OUT std_logic_vector(11 downto 0)
		);
	END COMPONENT;
	
	COMPONENT count_pixels_two
	PORT (
		addr : IN std_logic_vector(18 downto 0);
		reset : IN std_logic;
		num_pix_ok : OUT std_logic
		);
	END COMPONENT;

	COMPONENT ov7670_controller
	PORT(
		clk : IN std_logic;
		resend : IN std_logic;    
		siod : INOUT std_logic;      
		config_finished : OUT std_logic;
		sioc : OUT std_logic;
		reset : OUT std_logic;
		pwdn : OUT std_logic;
		xclk : OUT std_logic
		);
	END COMPONENT;

	COMPONENT debounce
	PORT(
		clk : IN std_logic;
		i : IN std_logic;          
		o : OUT std_logic
		);
	END COMPONENT;

	COMPONENT frame_buffer
	PORT(
		data : IN std_logic_vector(11 downto 0);
		rdaddress : IN std_logic_vector(18 downto 0);
		rdclock : IN std_logic;
		wraddress : IN std_logic_vector(18 downto 0);
		wrclock : IN std_logic;
		wren : IN std_logic;          
		q : OUT std_logic_vector(11 downto 0)
		);
	END COMPONENT;

	COMPONENT ov7670_capture
	PORT(
      rez_160x120 : IN std_logic;
      rez_320x240 : IN std_logic;
		pclk : IN std_logic;
		vsync : IN std_logic;
		href : IN std_logic;
		d : IN std_logic_vector(7 downto 0);          
		addr : OUT std_logic_vector(18 downto 0);
		dout : OUT std_logic_vector(11 downto 0);
		we : OUT std_logic
		);
	END COMPONENT;

	COMPONENT RGB
	PORT(
		Din : IN std_logic_vector(11 downto 0);
		Nblank : IN std_logic;          
		R : OUT std_logic_vector(7 downto 0);
		G : OUT std_logic_vector(7 downto 0);
		B : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	component vga_pll_zedboard
	port (
		CLK100       : in  std_logic;
		CLK50_camera : out std_logic;
		CLK25_vga    : out std_logic);
	end component;
	
	COMPONENT vga_pll
	PORT(
		inclk0 : IN std_logic;          
		c0 : OUT std_logic;
		c1 : OUT std_logic
		);
	END COMPONENT;

	COMPONENT Address_Generator
	PORT(
		CLK25       : IN  std_logic;
      rez_160x120 : IN std_logic;
      rez_320x240 : IN std_logic;
		enable      : IN  std_logic;       
      vsync       : in  STD_LOGIC;
		address     : OUT std_logic_vector(18 downto 0)
		);
	END COMPONENT;



   signal clk_camera : std_logic;
   signal clk_vga    : std_logic;
   signal wren       : std_logic;
   signal resend     : std_logic;
   signal nBlank     : std_logic;
   signal vsync      : std_logic;
	signal hsync		: std_logic;
	signal vsync1      : std_logic;
	signal hsync1		: std_logic;
	signal vsync2      : std_logic;
	signal hsync2		: std_logic;
	
   signal nSync      : std_logic;
	
	signal vsyncPr    : std_logic;
	signal hSyncPr		: std_logic;
	
	signal redPr,greenPr,bluePr : std_logic_vector(7 downto 0);
   
   signal wraddress  : std_logic_vector(18 downto 0);
   signal wrdata     : std_logic_vector(11 downto 0);
	
	signal windowedData : std_logic_vector(11 downto 0);
	signal segmentData : std_logic_vector(11 downto 0);
	signal filt1Data : std_logic_vector(11 downto 0);
	
	signal sumRowOutz  : std_logic_vector(10 downto 0);
   
   signal rdaddress  : std_logic_vector(18 downto 0);
   signal rddata     : std_logic_vector(11 downto 0);
   signal red,green,blue : std_logic_vector(3 downto 0);
	signal red1,green1,blue1 : std_logic_vector(7 downto 0);
	signal red2,green2,blue2 : std_logic_vector(3 downto 0);
   signal activeArea : std_logic;
   
   signal rez_160x120 : std_logic;
   signal rez_320x240 : std_logic;
	signal switchVGA : std_logic;
	
	signal hcnt : std_logic_vector(9 downto 0);
   signal vcnt : std_logic_vector(9 downto 0);
	
	signal pix_ok : std_logic;
	
	constant pixRdy :  std_logic := '1';
	constant pixOK :  std_logic := '1';
	
	constant selModetest :  std_logic := '1';
	constant selMux :  std_logic := '1';
begin
   vga_r <= red;
   vga_g <= green;
   vga_b <= blue;
   
   rez_160x120 <= btnl;
   rez_320x240 <= btnr;
	
	switchVGA <= btnu;
  
-- For the Nexys2  
--	Inst_vga_pll: vga_pll PORT MAP(
--		inclk0 => clk50,
--		c0 => clk_camera,
--		c1 => clk_vga
--	);

inst_vga_pll : vga_pll_zedboard
  port map
   ( CLK100 => CLK100,
     CLK50_camera => CLK_camera,
     CLK25_vga => CLK_vga);

   vga_vsync <= vsync;
	vsyncLed <= vsync;
	vga_hsync <= hsync;
	
	Inst_window : sys_array PORT MAP(
		clk		=> clk_vga,
		rst		=> resend,
		datainRGB	=> rddata,
		pixel_rdy	=> pixRdy,
		num_pix_ok	=> pix_ok,
		pixOut		=> windowedData
		
	);
	
	Inst_countPix : count_pixels_two PORT MAP(
		addr	=> rdaddress,
		reset	=> resend,
		num_pix_ok	=> pix_ok
	
	);
   
	Inst_VGA: VGA PORT MAP(
		CLK25      => clk_vga,
      rez_160x120 => rez_160x120,
      rez_320x240 => rez_320x240,
		clkout     => open,
		Hsync      => hsync1,
		Vsync      => vsync1,
		Nblank     => nBlank,
		activeArea => activeArea,
		Nsync      => nsync,
		HcntOut	  => hcnt,
		VcntOut    => vcnt
	);
	
	Inst_segment: segment PORT MAP(
		hcnt			=> hcnt,
		vcnt			=> vcnt,
		pixelIn		=> windowedData,
		pixelOut		=> segmentData,
		seg1Count => seg1c,
		seg2Count => seg2c,
		seg3Count => seg3c,
		seg4Count => seg4c,
		seg5Count => seg5c,
		seg6Count => seg6c
	);
	
	Inst_VGA2 : vga640x480 PORT MAP(
		dclk	=>	clk_vga,
		clr	=>	resend,
		seg1Count => seg1c,
		seg2Count => seg2c,
		seg3Count => seg3c,
		seg4Count => seg4c,
		seg5Count => seg5c,
		seg6Count => seg6c,
		hsync	=>	hsync2,
		vsync =>	vsync2,
		red 	=>	red2,
		green =>	green2,
		blue 	=>	blue2
		);
	
	Inst_mux: mux PORT MAP (
		sel		=>	switchVGA,
		vgaR1		=>	red1(7 downto 4),
		vgaG1 	=>	green1(7 downto 4),
		vgaB1 	=>	blue1(7 downto 4),
		vgaH1 	=>	hsync1,
		vgaV1 	=>	vsync1,
		vgaR2 	=>	red2,
		vgaG2 	=>	green2,
		vgaB2 	=>	blue2,
		vgaH2 	=>	hsync2,
		vgaV2 	=>	vsync2,
		vgaRout 	=>	red,
		vgaGout 	=>	green,
		vgaBout 	=>	blue,
		vgaHout 	=>	hsync,
		vgaVout 	=>	vsync
		);

	Inst_debounce: debounce PORT MAP(
		clk => clk_vga,
		i   => btnc,
		o   => resend
	);

	Inst_ov7670_controller: ov7670_controller PORT MAP(
		clk             => clk_camera,
		resend          => resend,
		config_finished => config_finished,
		sioc            => ov7670_sioc,
		siod            => ov7670_siod,
		reset           => ov7670_reset,
		pwdn            => ov7670_pwdn,
		xclk            => ov7670_xclk
	);

	Inst_frame_buffer: frame_buffer PORT MAP(
		rdaddress => rdaddress,
		rdclock   => clk_vga,
		q         => rddata,
      
		wrclock   => ov7670_pclk,
		wraddress => wraddress(18 downto 0),
		data      => wrdata,
		wren      => wren
	);
   
	Inst_ov7670_capture: ov7670_capture PORT MAP(
		pclk  => ov7670_pclk,
      rez_160x120 => rez_160x120,
      rez_320x240 => rez_320x240,
		vsync => ov7670_vsync,
		href  => ov7670_href,
		d     => ov7670_data,
		addr  => wraddress,
		dout  => wrdata,
		we    => wren
	);

	Inst_RGB: RGB PORT MAP(
		Din => segmentData,
		Nblank => activeArea,
		R => red1,
		G => green1,
		B => blue1
	);

	Inst_Address_Generator: Address_Generator PORT MAP(
		CLK25 => clk_vga,
      rez_160x120 => rez_160x120,
      rez_320x240 => rez_320x240,
		enable => activeArea,
      vsync  => vsync1,
		address => rdaddress
	);

end Behavioral;

