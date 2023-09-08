module port_4bits(
	input clk, 
	input clear, 
	input in_out_en,
	input [7:0] d, 
	output [7:0] Q_out,
	inout [7:0] Q 
);
wire [7:0] Qaux;
wire [7:0] Qaux_1;
register_4_bits register1 (
    .clk        (clk                  ),
    .clear      (clear                ),
    .d          (d                    ),
	 .Q          (Qaux                 )
);

register_4_bits register2 (
    .clk        (clk                  ),
    .clear      (clear                ),
    .d          (Q                    ),
	 .Q          (Qaux_1               )
);
assign Q = in_out_en ? Qaux : 8'bZZZZZZZZ;
assign Q_out = in_out_en ? 8'bZZZZZZZZ : Qaux_1;
endmodule