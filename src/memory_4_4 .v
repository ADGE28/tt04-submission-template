module memory_4_4 #(
    parameter SCR1_WIDTH=8,
    parameter RAM_SIZE_WORDS=4
)
(
	input r_w, 
	input oe,  
	input [1:0] address, 
	output reg [7:0] dato, 
	input [7:0] dato_w
);
reg [SCR1_WIDTH-1:0]  ram_block[RAM_SIZE_WORDS-1:0];
//nitial begin
  //ram_block[0] = 8'b00000001;
  //ram_block[1] = 8'b00000011;
  //ram_block[2] = 8'b00000011;
  //ram_block[3] = 8'b00000100;
//end
always @(oe, r_w)
	begin 
		if(oe)  
			if (r_w)  
				ram_block[address]<=dato_w;
			else 
				dato<=ram_block[address];	
		 else 
			dato<=8'bZZZZZZZZ;
	 end	 
endmodule
