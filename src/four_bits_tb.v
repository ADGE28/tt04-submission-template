`timescale 1ns / 1ps
module four_bits_tb;
    reg                                   clk; 
    reg                                   enable;
    reg [4:0]                             instruc;
    reg                                   clk_pc;
    reg                                   clear;	 
    wire [7:0]                            port_1;

    four_bits dut(
        .clk     (clk),
        .enable  (enable),
        .instruc (instruc),
        .clk_pc  (clk_pc),           
        .clear   (clear),                  
        .port_1  (port_1)                            
    );
      // Generador de reloj de 100 MHz con duty-cycle de 50 %
  always #5 clk = ~clk;
  //always #10 enable = ~enable;
  always #15 clk_pc = ~clk_pc;
  // Secuancia de reset
  initial begin
    clk = 0; clk_pc = 0; enable = 0; clear = 0; #5;
             clear = 1; #5;
             clear = 0;
     instruc=5'b11000; #20;	
     enable =1'b1;#15;
     enable =1'b0;#15;
	 instruc=5'b01101; #20;
	 enable =1'b1;#15;
     enable =1'b0;#15;	 
	 instruc=5'b01000; #20;	
	 enable =1'b1;#15;
     enable =1'b0;#15;
	 instruc=5'b00011; #20;
	 enable =1'b1;#15;
     enable =1'b0;#15;	
	 instruc=5'b11101; #20;
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
//    $dumpfile("counter_tb.vcd");
//    $dumpvars(0,counter_tb);
    
    // Sincronizacion

    //Estimulos de prueba
    #1200;

//    $display("Test completed");
    $finish;
  end
endmodule