module alu_4_instructions(
	input [1:0] sel, 
	input oe,  
	input [7:0] a, 
	input [7:0] b, 
	output [7:0] result 
);
reg[7:0] RESUL_aux;
wire [7:0] mult;
wire [15:0] RESUL_aux1;
 
	assign RESUL_aux1=(a)*(b);
	assign mult=RESUL_aux1[7:0];	
	assign result = oe ? RESUL_aux : 8'bZZZZZZZZ;
	always @(sel, oe) 
	begin	
		case (sel)
			2'b00: RESUL_aux = a+b; // Selector es 00
			2'b01: RESUL_aux = a-b; // Selector es 01
			2'b10: RESUL_aux = b-a; // Selector es 10
			default: RESUL_aux = mult; // Valor por defecto si no coincide con ninguno
		endcase 
	end 
endmodule 