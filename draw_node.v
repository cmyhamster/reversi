module project (  // draw single node (square)
		input			CLOCK_50;				//	50 MHz
		input   [9:0]   SW;
		input   [3:0]   KEY;

	// Declare your inputs and outputs here
	// Do not change the following outputs
		output			VGA_CLK;   				//	VGA Clock
		output			VGA_HS;					//	VGA H_SYNC
		output			VGA_VS;					//	VGA V_SYNC
		output			VGA_BLANK_N;				//	VGA BLANK
		output			VGA_SYNC_N;				//	VGA SYNC
		output	[9:0]	VGA_R;   				//	VGA Red[9:0]
		output	[9:0]	VGA_G;	 				//	VGA Green[9:0]
		output	[9:0]	VGA_B;   				//	VGA Blue[9:0]
		);

	
   
	wire resetn;
	assign resetn = ~KEY[0]; 

	// Create the colour, x, y and writeEn wires that are inputs to the controller.
	wire [2:0] colour;
	wire [7:0] x;
	wire [6:0] y;
	wire writeEn;
	assign writeEn = 1;
	reg [1:0] init_couter;
	wire [191:0] board;
	wire go;
	
	wire [6:0] real_x;
	wire [6:0] real_y;
	wire [2:0] real_colour;
	
	assign real_x = x * 4;
	assign real_y = y*4;
	
	
	always (*)
	begin
		if 
	end
	
	// initiallize the board white: 3,3; 4,4; balck: 4,3; 3,4
	
	
	
	
	reversi r0(
			.clk(clk),
			.resetn(resetn),
			.x(x),
			.y(y),
			.go(go),
			
			.board_result(board),
			.real_colour(real_colour)
		);
	

	// Create an Instance of a VGA controller - there can be only one!
	// Define th    // Next state logic aka our state table number of colours as well as the initial background
	// image file (.MIF) for the controller.
	vga_adapter VGA(
			.resetn(resetn),
			.clock(CLOCK_50),
			.colour(real_colour),
			.x(real_x),
			.y(real_y),
			.plot(writeEn),
			/* Signals for the DAC to drive the monitor. */
			.VGA_R(VGA_R),
			.VGA_G(VGA_G),
			.VGA_B(VGA_B),
			.VGA_HS(VGA_HS),
			.VGA_VS(VGA_VS),
			.VGA_BLANK(VGA_BLANK_N),
			.VGA_SYNC(VGA_SYNC_N),
			.VGA_CLK(VGA_CLK));
		defparam VGA.RESOLUTION = "160x120";
		defparam VGA.MONOCHROME = "FALSE";
		defparam VGA.BITS_PER_COLOUR_CHANNEL = 1;
		defparam VGA.BACKGROUND_IMAGE = "green.mif";




endmodule 