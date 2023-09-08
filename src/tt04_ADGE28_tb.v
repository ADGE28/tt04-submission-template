`timescale 1ns / 1ps
`include "tt04_ADGE28.v"
`include "clk_pc_code.v"
`include "clk_pc_code_master.v"
`include "alu_4_instructions.v"
`include "memory_4_4.v"
`include "mux_2_4bits.v"
`include "port_4bits.v"
`include "prog_input.v"
`include "register_4_bits.v"
`include "register_6bits.v"
`include "sumador_4_y_1.v"
`include "unidad_con.v"
module tt04_ADGE28_tb;
    reg                                   clk; 
    reg                                   enable;
    reg [4:0]                             instruc;
    reg                                   clear;	 
    wire [7:0]                            port_1;

    tt04_ADGE28 dut(
        .clk     (clk),
        .enable  (enable),
        .instruc (instruc),          
        .clear   (clear),                  
        .port_1  (port_1)                            
    );
      // Generador de reloj de 100 MHz con duty-cycle de 50 %
  always #5 clk = ~clk;
  initial begin
    clk = 0; enable = 0; clear = 0; #5;
             clear = 1; #5;
             clear = 0;
     instruc=5'b00000; #20;	
     enable =1'b1;#15;
     enable =1'b0;#15;
	 instruc=5'b01101; #20;
	 enable =1'b1;#15;
     enable =1'b0;#15;	 
	 instruc=5'b01000; #20;	
	 enable =1'b1;#15;
     enable =1'b0;#15;
	 instruc=5'b00000; #20;
	 enable =1'b1;#15;
     enable =1'b0;#15;	
	 instruc=5'b00000; #20;
	 enable =1'b1;#15;
     enable =1'b0;#15;	
	 instruc=5'b00000; #20;
	 enable =1'b1;#15;
     enable =1'b0;#15;	
	 instruc=5'b00000; #20;
	 enable =1'b1;#15;
     enable =1'b0;#15;	
	 instruc=5'b00000; #20;
	 enable =1'b1;#15;
     enable =1'b0;#15;	
	 instruc=5'b00000; #20;
	 enable =1'b1;#15;
     enable =1'b0;#15;	
	 instruc=5'b00000; #20;
	 enable =1'b1;#15;
     enable =1'b0;#15;
	 instruc=5'b00000; #20;
	 enable =1'b1;#15;
     enable =1'b0;#15;
	 instruc=5'b00000; #20;
	 enable =1'b1;#15;
     enable =1'b0;#15;
	 instruc=5'b00000; #20;
	 enable =1'b1;#15;
     enable =1'b0;#15;
	 instruc=5'b00000; #20;
	 enable =1'b1;#15;
     enable =1'b0;#15;
     instruc=5'b00000; #20;
	 enable =1'b1;#15;
     enable =1'b0;#15;
     instruc=5'b00000; #20;
	 enable =1'b1;#15;
     enable =1'b0;#15;
  end

  initial begin
    // Configuracion de archivos de salida
    $dumpfile("counter_tb.vcd");
    $dumpvars(0,counter_tb);
    
    // Sincronizacion

    //Estimulos de prueba
    #1200;

    $display("Test completed");
    $finish;
  end
endmodule