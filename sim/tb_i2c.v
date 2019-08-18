`timescale 1ns/1ps
module tb_i2c;
  reg clk,nrst,baud;
  wire SDA, SCL;
  
  reg tx_en1,tx_rd1;
  reg [6:0] dev_id1;
  reg [7:0] tx_data1;
  reg [1:0] tx_cnt1;
  reg [1:0] rd_addr1;
  wire SCL_out1, SDA_out1, busy1, tx_fail1, SCL_tris1, SDA_tris1, SCL_in1, SDA_in1;
  wire [7:0] rd_data1;

  reg tx_en2,tx_rd2;
  reg [6:0] dev_id2;
  reg [7:0] tx_data2;
  reg [1:0] tx_cnt2;
  reg [1:0] rd_addr2;
  wire SCL_out2, SDA_out2, busy2, tx_fail2, SCL_tris2, SDA_tris2, SCL_in2, SDA_in2;
  wire [7:0] rd_data2;
  
  parameter half_cc = 5;
  parameter cc = 2*half_cc;
  parameter cc8 = cc*8;
  parameter cc32 = cc*32;

  
  controller UUT1(
    .clk(clk),
    .nrst(nrst),
    .SCL_in(SCL_in1),
    .SDA_in(SDA_in1),
    .SDA_out(SDA_out1),
    .SCL_out(SCL_out1),
    .SDA_tris(SDA_tris1),
    .SCL_tris(SCL_tris1),
    .tx_en(tx_en1),
    .tx_rd(tx_rd1),
    .tx_cnt(tx_cnt1),
    .tx_data(tx_data1),
    .tx_fail(tx_fail1),
    .busy(busy1),
    .rd_addr(rd_addr1),
    .rd_data(rd_data1),
    .dev_id(dev_id1),
    .baud(baud)
  );
  controller UUT2(
    .clk(clk),
    .nrst(nrst),
    .SCL_in(SCL_in2),
    .SDA_in(SDA_in2),
    .SDA_out(SDA_out2),
    .SCL_out(SCL_out2),
    .SDA_tris(SDA_tris2),
    .SCL_tris(SCL_tris2),
    .tx_en(tx_en2),
    .tx_rd(tx_rd2),
    .tx_cnt(tx_cnt2),
    .tx_data(tx_data2),
    .tx_fail(tx_fail2),
    .busy(busy2),
    .rd_addr(rd_addr2),
    .rd_data(rd_data2),
    .dev_id(dev_id2),
    .baud(baud)
  );
  
  wrapper SCL1(
    .x_in(SCL_in1),
    .x_out(SCL_out1),
    .x_tris(SCL_tris1),
    .x(SCL)
    );  
  wrapper SCL2(
    .x_in(SCL_in2),
    .x_out(SCL_out2),
    .x_tris(SCL_tris2),
    .x(SCL)
    );  
    
  wrapper SDA1(
    .x_in(SDA_in1),
    .x_out(SDA_out1),
    .x_tris(SDA_tris1),
    .x(SDA)
    );  
  wrapper SDA2(
    .x_in(SDA_in2),
    .x_out(SDA_out2),
    .x_tris(SDA_tris2),
    .x(SDA)
    );  
  
  pullup(SCL);
  pullup(SDA);

  always
    #half_cc clk = ~clk;
  
  initial begin
    $vcdplusfile("test.vpd");
    $vcdpluson;
    //$dumpfile("test_rtl.vpd");
    //$dumpvars(0, tb_i2c);
    
    clk = 0;
    nrst = 0;
    baud = 0;
    
    tx_en1 = 0;
    tx_rd1 = 0;
    tx_cnt1 = 1;
    tx_data1 = 8'h29;
    rd_addr1 = 0;
    dev_id1 = 7'h5;
    
    tx_en2 = 0;
    tx_rd2 = 0;
    tx_cnt2 = 1;
    tx_data2 = 0;
    rd_addr2 = 0;
    dev_id2 = 7'h29;
    
    #cc;
    #cc;
    nrst = 1;
    #cc;
    #cc;
    tx_en1 = 1;
    #cc;
    #cc;
    tx_en1 = 0;
    #cc;
    tx_data1 = 8'hc4;
    #cc32;
    tx_en1 = 1;
    #cc;
    tx_en1 = 0;
    #cc32;
    tx_data1 = 8'h7;
    tx_en1 = 1;
    rd_addr2 = 1;
    #cc;
    tx_en1 = 0;
    #cc32;
    tx_rd1 = 1;
    tx_en1 = 1;
    tx_data1 = 8'h29;
    #cc;
    tx_rd1 = 0;
    tx_en1 = 0;
    #cc32;
    tx_cnt1 = 0;
    #cc32;
    rd_addr1 = 1;
    #cc32;
    tx_en1 = 1;
    tx_data1 = 8'hff;
    #cc;
    tx_en1 = 0;
    #cc32;
    tx_en1 = 1;
    tx_data1 = 8'h29;
    #cc;
    tx_en1 = 0;
    #cc32;
    #cc32;
    tx_en1 = 1;
    tx_data1 = 8'h55;
    #cc;
    tx_en1 = 0;
    #cc32;
    #cc32;
    #cc32;
    rd_addr2 = 0;
    #cc32;
    #cc8;
    tx_en1 = 1;
    tx_rd1 = 1;
    #cc;
    tx_en1 = 0;
    #cc32;
    #cc32;

    $finish;
    
  end

  `ifdef SDF_ANNOTATE
  initial begin
    $sdf_annotate("../mapped/controller.sdf",UUT1);
  end
  `endif

endmodule
