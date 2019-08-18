`timescale 1ns/1ps
module tb_i2c_wrapper;
  reg x1_tris,x1_out;
  reg x2_tris,x2_out;
  wire x1_in,x2_in;
  wire x;

  wrapper U1(
    .x_in(x1_in),
    .x_out(x1_out),
    .x_tris(x1_tris),
    .x(x)
    );  
  wrapper U2(
    .x_in(x2_in),
    .x_out(x2_out),
    .x_tris(x2_tris),
    .x(x)
    );  

  /* Pulls up x when nothing drives it */
  pullup(x);

  initial begin
    $vcdplusfile("tb_i2c_wrapper.vpd");
    $vcdpluson;

    x1_tris = 1'b1;
    x1_out = 1'b1; 
    x2_tris = 1'b1;
    x2_out = 1'b1;
    #10;
    x1_out = 0;
    #10;
    x1_tris = 0;
    #10;
    x1_out = 1'b1;
    x2_out = 0;
    #10;
    x1_out = 0;
    #10;
    x1_tris = 1'b1;
    x2_out = 1'b1;
    #10;
    x2_tris = 0;
    #10;
    x1_out = 1'b1;
    x2_out = 0;
    #10;
    x2_out = 1'b1;
    #10;
    x2_tris = 1'b1;
    #100;
    $finish;

  end

endmodule
