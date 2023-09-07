module prog_input #(
    parameter SCR1_WIDTH=5,
    parameter RAM_SIZE_WORDS=16
)
( 
   input clear,
   input enable,
   input [4:0] instruc,   
   output reg master_clear,
   input [3:0] address,
   output [4:0] instruction	
);
reg [SCR1_WIDTH-1:0]  ram_block[RAM_SIZE_WORDS-1:0];
localparam [15:0] 
    s0 = 0,
    s1 = 1,
    s2 = 2,
	s3 = 3,
	s4 = 4,
	s5 = 5,
	s6 = 6,
	s7 = 7,
	s8 = 8,
	s9 = 9,
	s10 = 10,
	s11 = 11,
	s12 = 12,
	s13 = 13,
	s14 = 14,
	s15 = 15;
    reg[15:0] state_reg, state_next;  

// state reg
always @(posedge enable, posedge clear) begin
    if (clear) begin
        state_reg <= s0;
        master_clear<=1'b0;
    end
    else begin
        state_reg <= state_next;
    end
end 
// next state logic :
always @(negedge enable) begin 
    state_next = state_reg; // default state_next
    case (state_reg)
        s0 : begin
		       ram_block[0]<=instruc;
			   state_next = s1; 
        end
        s1 : begin
		      ram_block[1]<=instruc;
				state_next = s2; 
        end
		  s2 : begin
		      ram_block[2]<=instruc;
				state_next = s3; 
        end
		  s3 : begin
		      ram_block[3]<=instruc;
				state_next = s4; 
        end
		  s4 : begin
		      ram_block[4]<=instruc;
				state_next = s5; 
        end
		  s5 : begin
		      ram_block[5]<=instruc;
				state_next = s6; 
        end
		  s6 : begin
		      ram_block[6]<=instruc;
				state_next = s7; 
        end
		  s7 : begin
		      ram_block[7]<=instruc;
				state_next = s8; 
        end
		  s8 : begin
		      ram_block[8]<=instruc;
				state_next = s9; 
        end
		  s9 : begin
		      ram_block[9]<=instruc;
				state_next = s10; 
        end
		  s10 : begin
		      ram_block[10]<=instruc;
				state_next = s11; 
        end
		  s11 : begin
		      ram_block[11]<=instruc;
				state_next = s12; 
        end
		  s12 : begin
		      ram_block[12]<=instruc;
				state_next = s13; 
        end
		  s13 : begin
		      ram_block[13]<=instruc;
				state_next = s14; 
        end
		  s14 : begin
		      ram_block[14]<=instruc;
				state_next = s15; 
        end
		  s15 : begin
		      ram_block[15]<=instruc;
				master_clear<=1'b1;
				state_next = s0;
		  end	
		  default: begin 	
			  state_next = s0;   
			end 
    endcase
end
assign instruction=ram_block[address]; 
endmodule 