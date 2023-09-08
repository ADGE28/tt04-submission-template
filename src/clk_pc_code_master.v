module clk_pc_code_master(
    input clk,
    input master_clear, 
    input reset,
    output clk_master_out
    );
localparam [3:0] 
    s0 = 0,
    s1 = 1,
    s2 = 2,
	 s3 = 3;
    reg[3:0] state_reg, state_next;  
// state reg
reg clk_aux;
always @(posedge clk, posedge reset) begin
    if (reset==1'b1) begin
        state_reg <= s0;
    end
    else begin
        state_reg <= state_next;
    end
end 

// next state logic :
always @(state_reg, master_clear) begin 
    state_next = state_reg; 
    case (state_reg)
        s0 : begin
          clk_aux <= 1'b0;
          if (master_clear) begin
			state_next = s1;
			clk_aux <= 1'b1;  
           end 			
        end
        s1 : begin
			state_next = s2;
			clk_aux <= ~clk_aux;  			
        end
        s2 : begin
		   state_next = s2;
        end
    endcase
end
assign clk_master_out=clk_aux;    
endmodule 