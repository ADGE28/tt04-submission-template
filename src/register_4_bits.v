module register_4_bits(
	input clk, 
	input clear,  
	input [7:0] d, 
	output reg [7:0] Q 
);

always @(posedge clk, posedge clear) 
	begin
		if(clear==1'b1)
			Q <= 8'h00; 
		else 
			Q <= d; 
	end 
endmodule 