module register_6bits(
	input clk, 
	input clear,  
	input [3:0] d, 
	output reg [3:0] Q 
);

always @(posedge clk, posedge clear) 
	begin
		if(clear==1'b1)
			Q <= 3'b000; 
		else 
			Q <= d; 
	end 
endmodule 