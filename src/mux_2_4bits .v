module mux_2_4bits #(
  parameter Width = 8
) (
  input              selec,
  input  [Width-1:0] a_mux,
  input  [Width-1:0] b_mux,
  output [Width-1:0] out_mux
);
  assign out_mux = selec ? a_mux : b_mux;
endmodule