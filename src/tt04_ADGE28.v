module tt04_ADGE28(
	input clk, //connected to relog signal 
	input enable, //connected to switch
	input [4:0] instruc, //connected to switches
	input clear, //connected to switch
	inout [7:0] port_1 //connected to switches and leds	
);
wire clk_pc; 
wire master_clear;
wire master_clear_aux;
wire [7:0] bus_general;
wire [7:0] sal_reg1;
wire [7:0] sal_reg2;
wire [7:0] reg_w;
wire [7:0] d_reg;
wire oe_alu;
wire w_reg1;
wire w_reg2;
wire r_waux;
wire oe_data;
wire oe_port;
wire clk_reg;
wire w_port;
wire [3:0] sal_sum;
wire [3:0] addressaux;
wire [4:0] instructionaux;

clk_pc_code clk_pc_code (
    .clk      (clk     ),
    .reset    (clear   ),
	.clk_pc_out (clk_pc)
);

clk_pc_code_master clk_pc_code_master (
    .clk      (clk     ),
    .master_clear (master_clear_aux),
    .reset    (clear   ),
	.clk_master_out (master_clear)
);

register_6bits register_6bits (
    .clk      (clk_pc     ),
    .clear    (master_clear),
	 .d       (sal_sum    ),
	 .Q       (addressaux )
);

unidad_con unidad_con (
     .clk            (clk      ),
     .clear          (master_clear),
     .instruction    (instructionaux[4:2]),
     .oe_memo        (oe_data  ),
	 .oe_alu         (oe_alu   ),
	 .oe_port        (oe_port   ),
	 .r_w            (r_waux   ),
	 .clk1           (w_reg1   ),
	 .clk2           (w_reg2   ),
	  .clk_reg       (clk_reg  )
); 

sumador_4_y_1 sumador_4_y_1 (
    .in_sum        (addressaux),
    .out_sum       (sal_sum   )
);

mux_2_4bits mux_2_4bits_1 (
    .selec        (instructionaux[2]),
	 .a_mux        (sal_reg1   ),
	 .b_mux        (sal_reg2   ),
	 .out_mux      (reg_W      )
);

mux_2_4bits mux_2_4bits_2 (
    .selec        (instructionaux[0]),
	 .a_mux        (sal_reg1   ),
	 .b_mux        (sal_reg2   ),
	 .out_mux      (d_reg      )
);


register_4_bits register_4_bits_1 (
    .clk     (w_reg1),
    .clear   (master_clear),
	.d       (bus_general),
	.Q       (sal_reg1   )
);

register_4_bits register_4_bits_2 (
    .clk      (w_reg2),
    .clear    (master_clear),
	 .d       (bus_general),
	 .Q       (sal_reg2   )
);

memory_4_4 memory_4_4_1 (
    .r_w     (r_waux ),
    .oe      (oe_data),
	 .address (instructionaux[1:0]),
	 .dato    (bus_general ),
	 .dato_w  (reg_w       )
);

alu_4_instructions alu_4_instructions (
    .sel     ({instructionaux[1],instructionaux[0]}),
	 .oe      (oe_alu ),
	 .a       (sal_reg1 ),
	 .b       (sal_reg2 ),
	 .result  (bus_general)
);

port_4bits port_4bits (
    .clk        (clk_reg    ),
    .clear      (master_clear),
	 .in_out_en  (oe_port    ),
	 .d          (d_reg      ),
	 .Q_out      (bus_general),
	 .Q          (port_1     )
);

prog_input prog_input (
    .clear        (clear   ),
    .enable       (enable  ),
    .instruc      (instruc ),
    .master_clear (master_clear_aux),
    .address      (addressaux    ),
    .instruction  (instructionaux)
);
endmodule 