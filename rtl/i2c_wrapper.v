`timescale 1ns/1ps
module wrapper(
  x_in,
  x_out,
  x_tris,
  x
  );

  output x_in;
  input x_out,x_tris;
  inout x;

  assign x_in = x;

  assign x = (!x_tris)? x_out : 1'bz;

endmodule
