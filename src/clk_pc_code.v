module clk_pc_code(
    input clk,
    input reset,
    output clk_pc_out
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
    if (reset) begin
        state_reg <= s0;
    end
    else begin
        state_reg <= state_next;
    end
end 

// next state logic :
always @(state_reg) begin 
    state_next = state_reg; // default state_next
    case (state_reg)
        s0 : begin
			state_next = s1;  
            clk_aux <= 1'b0;			
        end
        s1 : begin
			state_next = s2;  			
        end
        s2 : begin
			state_next = s3;  			
        end
        s3 : begin
		   clk_aux <= ~clk_aux;
		   state_next = s0;
        end
    endcase
end
assign clk_pc_out=clk_aux;    
endmodule 