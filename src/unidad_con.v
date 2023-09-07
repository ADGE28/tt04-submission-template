module unidad_con(
    input clk,
    input clear,
    input [2:0] instruction,
    output reg oe_memo, 
    output reg oe_alu,
    output reg oe_port, 
    output reg r_w, 
    output reg clk1, 
    output reg clk2,
    output reg clk_reg
);
localparam [3:0] 
    s0 = 0,
    s1 = 1,
    s2 = 2,
	 s3 = 3;
reg[3:0] state_reg, state_next;
always @(negedge clk, posedge clear) begin
    if (clear) begin
        state_reg <= s0;
        state_next <= s0;
    end
    else begin
        state_reg <= state_next;
    end
end 

always @(state_reg, clk)
	begin
		case (instruction)  
			3'b011: begin
			 case (state_reg)
               s0 : begin
			     oe_alu<=1'b0;
				 r_w<=1'b0;
				 oe_memo<=1'b1;
				 oe_port<=1'b1;
				 clk1<=1'b0;
				 clk2<=1'b0;
				 clk_reg<=1'b0;
			     state_next = s1;
			    end 
			    s1 : begin
			     clk1<=1'b1;
	             state_next = s2;
			    end 
			    s2 : begin
			     oe_alu<=1'b0;
				 r_w<=1'b0;
				 oe_memo<=1'b0;
				 oe_port<=1'b1;
				 clk2<=1'b0;
			     clk1<=1'b0;
			     clk_reg<=1'b0;
	             state_next = s0;
			    end 
			 endcase
			end 
			
			3'b010: begin
			 case (state_reg)
               s0 : begin
			     oe_alu<=1'b0;
				 r_w<=1'b0;
				 oe_memo<=1'b1;
				 oe_port<=1'b1;
				 clk1<=1'b0;
				 clk2<=1'b0;
				 clk_reg<=1'b0;
			     state_next = s1;
			    end 
			    s1 : begin
			     clk2<=1'b1;
	             state_next = s2;
			    end 
			    s2 : begin
			     oe_alu<=1'b0;
				 r_w<=1'b0;
				 oe_memo<=1'b0;
				 oe_port<=1'b1;
				 clk2<=1'b0;
			     clk1<=1'b0;
			     clk_reg<=1'b0;
	             state_next = s0;
			    end 
			 endcase
			end
			
			3'b001: begin
			 case (state_reg)
               s0 : begin
			     oe_alu<=1'b1;
				 r_w<=1'b0;
				 oe_memo<=1'b0;
				 oe_port<=1'b1;
				 clk1<=1'b0;
				 clk2<=1'b0;
				 clk_reg<=1'b0;
			     state_next = s1;
			    end 
			    s1 : begin
			     clk1<=1'b1;
	             state_next = s2;
			    end 
			    s2 : begin
			     oe_alu<=1'b0;
				 r_w<=1'b0;
				 oe_memo<=1'b0;
				 oe_port<=1'b1;
				 clk2<=1'b0;
			     clk1<=1'b0;
			     clk_reg<=1'b0;
	             state_next = s0;
			    end 
			 endcase
			end 
			
			3'b000: begin
			 case (state_reg)
               s0 : begin
			     oe_alu<=1'b1;
				 r_w<=1'b0;
				 oe_memo<=1'b0;
				 oe_port<=1'b1;
				 clk1<=1'b0;
				 clk2<=1'b0;
				 clk_reg<=1'b0;
			     state_next = s1;
			    end 
			    s1 : begin
			     clk2<=1'b1;
	             state_next = s2;
			    end 
			    s2 : begin
			     oe_alu<=1'b0;
				 r_w<=1'b0;
				 oe_memo<=1'b0;
				 oe_port<=1'b1;
				 clk2<=1'b0;
			     clk1<=1'b0;
			     clk_reg<=1'b0;
	             state_next = s0;
			    end 
			 endcase
			end 
			
			3'b111: begin
			 case (state_reg)
               s0 : begin
			     oe_alu<=1'b0;
				 r_w<=1'b0;
				 oe_memo<=1'b0;
				 oe_port<=1'b1;
				 clk1<=1'b0;
				 clk2<=1'b0;
				 clk_reg<=1'b0;
			     state_next = s1;
			    end 
			    s1 : begin
			     clk_reg<=1'b1;
	             state_next = s2;
			    end 
			    s2 : begin
			     oe_alu<=1'b0;
				 r_w<=1'b0;
				 oe_memo<=1'b0;
				 oe_port<=1'b1;
				 clk2<=1'b0;
			     clk1<=1'b0;
			     clk_reg<=1'b0;
	             state_next = s0;
			    end 
			 endcase
			end 
			
			3'b110: begin
			 case (state_reg)
               s0 : begin
			     oe_alu<=1'b0;
				 r_w<=1'b0;
				 oe_memo<=1'b0;
				 oe_port<=1'b0;
				 clk1<=1'b0;
				 clk2<=1'b1;
				 clk_reg<=1'b0;
			     state_next = s1;
			    end 
			    s1 : begin
			     clk_reg<=1'b1;
	             state_next = s2;
			    end 
			    s2 : begin
			     oe_alu<=1'b0;
				 r_w<=1'b0;
				 oe_memo<=1'b0;
				 oe_port<=1'b1;
				 clk2<=1'b0;
			     clk1<=1'b0;
			     clk_reg<=1'b0;
	             state_next = s0;
			    end 
			 endcase
			end 
			
			default: begin 	
			     oe_alu<=1'b0;
				 r_w<=1'b0;
				 oe_memo<=1'b0;
				 oe_port<=1'b1;
				 clk1<=1'b0;
				 clk2<=1'b0;
				 clk_reg<=1'b0;
				end 
		endcase
	end 
endmodule