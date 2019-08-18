
module partoser_0 ( clk, nrst, load, send, parallel, serial, valid, done );
  input [7:0] parallel;
  input clk, nrst, load, send;
  output serial, valid, done;
  wire   n1, n2, n3, n12, n13, n18, n19, n21, n22, n30, n31, n32, n33, n34,
         n35, n36, n37, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n4, n5, n6, n7, n8, n9, n10, n11, n14, n15, n16, n17, n20;

  DFFARX1 \mem_reg[7]  ( .D(n40), .CLK(clk), .RSTB(nrst), .Q(serial) );
  AO222X1 U3 ( .IN1(serial), .IN2(n1), .IN3(parallel[7]), .IN4(n2), .IN5(n3), 
        .IN6(n20), .Q(n40) );
  AO222X1 U4 ( .IN1(n1), .IN2(n17), .IN3(parallel[5]), .IN4(n2), .IN5(n3), 
        .IN6(n16), .Q(n41) );
  AO222X1 U5 ( .IN1(n1), .IN2(n16), .IN3(parallel[4]), .IN4(n2), .IN5(n3), 
        .IN6(n15), .Q(n42) );
  AO222X1 U7 ( .IN1(n1), .IN2(n15), .IN3(parallel[3]), .IN4(n2), .IN5(n3), 
        .IN6(n14), .Q(n43) );
  AO222X1 U9 ( .IN1(n1), .IN2(n14), .IN3(parallel[2]), .IN4(n2), .IN5(n3), 
        .IN6(n11), .Q(n44) );
  AO222X1 U11 ( .IN1(n1), .IN2(n11), .IN3(parallel[1]), .IN4(n2), .IN5(n3), 
        .IN6(n10), .Q(n45) );
  AO22X1 U13 ( .IN1(n1), .IN2(n10), .IN3(parallel[0]), .IN4(n2), .Q(n46) );
  AO222X1 U15 ( .IN1(n1), .IN2(n20), .IN3(parallel[6]), .IN4(n2), .IN5(n3), 
        .IN6(n17), .Q(n47) );
  AOI21X1 U19 ( .IN1(load), .IN2(n4), .IN3(n3), .QN(n1) );
  NAND4X0 U21 ( .IN1(n36), .IN2(n3), .IN3(n6), .IN4(n7), .QN(n13) );
  AO21X1 U22 ( .IN1(n4), .IN2(n8), .IN3(n39), .Q(n12) );
  OAI22X1 U23 ( .IN1(n9), .IN2(n4), .IN3(n3), .IN4(n37), .QN(n49) );
  AO22X1 U25 ( .IN1(send), .IN2(n4), .IN3(valid), .IN4(n18), .Q(n50) );
  OR2X1 U26 ( .IN1(n19), .IN2(n37), .Q(n18) );
  AO21X1 U27 ( .IN1(n3), .IN2(n19), .IN3(n8), .Q(n32) );
  NAND3X0 U29 ( .IN1(n6), .IN2(n7), .IN3(n5), .QN(n19) );
  XOR2X1 U32 ( .IN1(n21), .IN2(n30), .Q(n33) );
  OR2X1 U33 ( .IN1(n22), .IN2(n31), .Q(n21) );
  XOR2X1 U34 ( .IN1(n22), .IN2(n31), .Q(n34) );
  XOR2X1 U36 ( .IN1(n5), .IN2(n3), .Q(n35) );
  DFFARX1 \count_reg[0]  ( .D(n35), .CLK(clk), .RSTB(nrst), .Q(n5), .QN(n36)
         );
  DFFARX1 delay_reg ( .D(n49), .CLK(clk), .RSTB(nrst), .Q(n9), .QN(n37) );
  DFFARX1 a_reg ( .D(n32), .CLK(clk), .RSTB(nrst), .Q(n8) );
  DFFARX1 \count_reg[1]  ( .D(n34), .CLK(clk), .RSTB(nrst), .Q(n6), .QN(n31)
         );
  DFFARX1 \count_reg[2]  ( .D(n33), .CLK(clk), .RSTB(nrst), .Q(n7), .QN(n30)
         );
  DFFARX1 \mem_reg[0]  ( .D(n46), .CLK(clk), .RSTB(nrst), .Q(n10) );
  DFFARX1 \mem_reg[6]  ( .D(n47), .CLK(clk), .RSTB(nrst), .Q(n20) );
  DFFARX1 \mem_reg[5]  ( .D(n41), .CLK(clk), .RSTB(nrst), .Q(n17) );
  DFFARX1 \mem_reg[4]  ( .D(n42), .CLK(clk), .RSTB(nrst), .Q(n16) );
  DFFARX1 \mem_reg[3]  ( .D(n43), .CLK(clk), .RSTB(nrst), .Q(n15) );
  DFFARX1 \mem_reg[2]  ( .D(n44), .CLK(clk), .RSTB(nrst), .Q(n14) );
  DFFARX1 \mem_reg[1]  ( .D(n45), .CLK(clk), .RSTB(nrst), .Q(n11) );
  DFFARX1 valid_reg ( .D(n50), .CLK(clk), .RSTB(nrst), .Q(valid), .QN(n4) );
  DFFARX1 done_reg ( .D(n48), .CLK(clk), .RSTB(nrst), .Q(done), .QN(n39) );
  NAND2X1 U6 ( .IN1(n3), .IN2(n5), .QN(n22) );
  NOR2X0 U8 ( .IN1(n1), .IN2(valid), .QN(n2) );
  NAND2X1 U10 ( .IN1(n12), .IN2(n13), .QN(n48) );
  NOR2X0 U12 ( .IN1(n4), .IN2(n37), .QN(n3) );
endmodule


module partoser_2 ( clk, nrst, load, send, parallel, serial, valid, done );
  input [7:0] parallel;
  input clk, nrst, load, send;
  output serial, valid, done;
  wire   n4, n5, n6, n7, n8, n9, n10, n11, n14, n15, n16, n17, n20, n23, n24,
         n25, n26, n27, n28, n29, n38, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63;

  DFFARX1 done_reg ( .D(n25), .CLK(clk), .RSTB(nrst), .Q(done), .QN(n46) );
  AO222X1 U3 ( .IN1(serial), .IN2(n63), .IN3(parallel[7]), .IN4(n62), .IN5(n61), .IN6(n20), .Q(n45) );
  AO222X1 U4 ( .IN1(n63), .IN2(n17), .IN3(parallel[5]), .IN4(n62), .IN5(n61), 
        .IN6(n16), .Q(n44) );
  AO222X1 U5 ( .IN1(n63), .IN2(n16), .IN3(parallel[4]), .IN4(n62), .IN5(n61), 
        .IN6(n15), .Q(n43) );
  AO222X1 U7 ( .IN1(n63), .IN2(n15), .IN3(parallel[3]), .IN4(n62), .IN5(n61), 
        .IN6(n14), .Q(n38) );
  AO222X1 U9 ( .IN1(n63), .IN2(n14), .IN3(parallel[2]), .IN4(n62), .IN5(n61), 
        .IN6(n11), .Q(n29) );
  AO222X1 U11 ( .IN1(n63), .IN2(n11), .IN3(parallel[1]), .IN4(n62), .IN5(n61), 
        .IN6(n10), .Q(n28) );
  AO22X1 U13 ( .IN1(n63), .IN2(n10), .IN3(parallel[0]), .IN4(n62), .Q(n27) );
  AO222X1 U15 ( .IN1(n63), .IN2(n20), .IN3(parallel[6]), .IN4(n62), .IN5(n61), 
        .IN6(n17), .Q(n26) );
  AOI21X1 U19 ( .IN1(load), .IN2(n4), .IN3(n61), .QN(n63) );
  NAND4X0 U21 ( .IN1(n48), .IN2(n61), .IN3(n6), .IN4(n7), .QN(n59) );
  AO21X1 U22 ( .IN1(n4), .IN2(n8), .IN3(n46), .Q(n60) );
  OAI22X1 U23 ( .IN1(n9), .IN2(n4), .IN3(n61), .IN4(n47), .QN(n24) );
  AO22X1 U25 ( .IN1(send), .IN2(n4), .IN3(valid), .IN4(n58), .Q(n23) );
  OR2X1 U26 ( .IN1(n57), .IN2(n47), .Q(n58) );
  AO21X1 U27 ( .IN1(n61), .IN2(n57), .IN3(n8), .Q(n52) );
  NAND3X0 U29 ( .IN1(n6), .IN2(n7), .IN3(n5), .QN(n57) );
  XOR2X1 U32 ( .IN1(n56), .IN2(n54), .Q(n51) );
  OR2X1 U33 ( .IN1(n55), .IN2(n53), .Q(n56) );
  XOR2X1 U34 ( .IN1(n55), .IN2(n53), .Q(n50) );
  XOR2X1 U36 ( .IN1(n5), .IN2(n61), .Q(n49) );
  DFFARX1 valid_reg ( .D(n23), .CLK(clk), .RSTB(nrst), .Q(valid), .QN(n4) );
  DFFARX1 \mem_reg[7]  ( .D(n45), .CLK(clk), .RSTB(nrst), .Q(serial) );
  DFFARX1 \count_reg[0]  ( .D(n49), .CLK(clk), .RSTB(nrst), .Q(n5), .QN(n48)
         );
  DFFARX1 delay_reg ( .D(n24), .CLK(clk), .RSTB(nrst), .Q(n9), .QN(n47) );
  DFFARX1 a_reg ( .D(n52), .CLK(clk), .RSTB(nrst), .Q(n8) );
  DFFARX1 \count_reg[1]  ( .D(n50), .CLK(clk), .RSTB(nrst), .Q(n6), .QN(n53)
         );
  DFFARX1 \count_reg[2]  ( .D(n51), .CLK(clk), .RSTB(nrst), .Q(n7), .QN(n54)
         );
  DFFARX1 \mem_reg[0]  ( .D(n27), .CLK(clk), .RSTB(nrst), .Q(n10) );
  DFFARX1 \mem_reg[6]  ( .D(n26), .CLK(clk), .RSTB(nrst), .Q(n20) );
  DFFARX1 \mem_reg[5]  ( .D(n44), .CLK(clk), .RSTB(nrst), .Q(n17) );
  DFFARX1 \mem_reg[4]  ( .D(n43), .CLK(clk), .RSTB(nrst), .Q(n16) );
  DFFARX1 \mem_reg[3]  ( .D(n38), .CLK(clk), .RSTB(nrst), .Q(n15) );
  DFFARX1 \mem_reg[2]  ( .D(n29), .CLK(clk), .RSTB(nrst), .Q(n14) );
  DFFARX1 \mem_reg[1]  ( .D(n28), .CLK(clk), .RSTB(nrst), .Q(n11) );
  NAND2X1 U6 ( .IN1(n61), .IN2(n5), .QN(n55) );
  NOR2X0 U8 ( .IN1(n63), .IN2(valid), .QN(n62) );
  NOR2X0 U10 ( .IN1(n4), .IN2(n47), .QN(n61) );
  NAND2X1 U12 ( .IN1(n60), .IN2(n59), .QN(n25) );
endmodule


module partoser_1 ( clk, nrst, load, send, parallel, serial, valid, done );
  input [7:0] parallel;
  input clk, nrst, load, send;
  output serial, valid, done;
  wire   n4, n5, n6, n7, n8, n9, n10, n11, n14, n15, n16, n17, n20, n23, n24,
         n25, n26, n27, n28, n29, n38, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63;

  DFFARX1 done_reg ( .D(n25), .CLK(clk), .RSTB(nrst), .Q(done), .QN(n46) );
  AO222X1 U3 ( .IN1(serial), .IN2(n63), .IN3(parallel[7]), .IN4(n62), .IN5(n61), .IN6(n20), .Q(n45) );
  AO222X1 U4 ( .IN1(n63), .IN2(n17), .IN3(parallel[5]), .IN4(n62), .IN5(n61), 
        .IN6(n16), .Q(n44) );
  AO222X1 U5 ( .IN1(n63), .IN2(n16), .IN3(parallel[4]), .IN4(n62), .IN5(n61), 
        .IN6(n15), .Q(n43) );
  AO222X1 U7 ( .IN1(n63), .IN2(n15), .IN3(parallel[3]), .IN4(n62), .IN5(n61), 
        .IN6(n14), .Q(n38) );
  AO222X1 U9 ( .IN1(n63), .IN2(n14), .IN3(parallel[2]), .IN4(n62), .IN5(n61), 
        .IN6(n11), .Q(n29) );
  AO222X1 U11 ( .IN1(n63), .IN2(n11), .IN3(parallel[1]), .IN4(n62), .IN5(n61), 
        .IN6(n10), .Q(n28) );
  AO22X1 U13 ( .IN1(n63), .IN2(n10), .IN3(parallel[0]), .IN4(n62), .Q(n27) );
  AO222X1 U15 ( .IN1(n63), .IN2(n20), .IN3(parallel[6]), .IN4(n62), .IN5(n61), 
        .IN6(n17), .Q(n26) );
  NAND4X0 U21 ( .IN1(n48), .IN2(n61), .IN3(n6), .IN4(n7), .QN(n59) );
  AO21X1 U22 ( .IN1(n4), .IN2(n8), .IN3(n46), .Q(n60) );
  OAI22X1 U23 ( .IN1(n9), .IN2(n4), .IN3(n61), .IN4(n47), .QN(n24) );
  AO22X1 U25 ( .IN1(send), .IN2(n4), .IN3(valid), .IN4(n58), .Q(n23) );
  OR2X1 U26 ( .IN1(n57), .IN2(n47), .Q(n58) );
  AO21X1 U27 ( .IN1(n61), .IN2(n57), .IN3(n8), .Q(n52) );
  NAND3X0 U29 ( .IN1(n6), .IN2(n7), .IN3(n5), .QN(n57) );
  XOR2X1 U32 ( .IN1(n56), .IN2(n54), .Q(n51) );
  OR2X1 U33 ( .IN1(n55), .IN2(n53), .Q(n56) );
  XOR2X1 U34 ( .IN1(n55), .IN2(n53), .Q(n50) );
  XOR2X1 U36 ( .IN1(n5), .IN2(n61), .Q(n49) );
  DFFARX1 valid_reg ( .D(n23), .CLK(clk), .RSTB(nrst), .Q(valid), .QN(n4) );
  DFFARX1 \mem_reg[7]  ( .D(n45), .CLK(clk), .RSTB(nrst), .Q(serial) );
  DFFARX1 \count_reg[0]  ( .D(n49), .CLK(clk), .RSTB(nrst), .Q(n5), .QN(n48)
         );
  DFFARX1 delay_reg ( .D(n24), .CLK(clk), .RSTB(nrst), .Q(n9), .QN(n47) );
  DFFARX1 a_reg ( .D(n52), .CLK(clk), .RSTB(nrst), .Q(n8) );
  DFFARX1 \count_reg[1]  ( .D(n50), .CLK(clk), .RSTB(nrst), .Q(n6), .QN(n53)
         );
  DFFARX1 \count_reg[2]  ( .D(n51), .CLK(clk), .RSTB(nrst), .Q(n7), .QN(n54)
         );
  DFFARX1 \mem_reg[0]  ( .D(n27), .CLK(clk), .RSTB(nrst), .Q(n10) );
  DFFARX1 \mem_reg[6]  ( .D(n26), .CLK(clk), .RSTB(nrst), .Q(n20) );
  DFFARX1 \mem_reg[5]  ( .D(n44), .CLK(clk), .RSTB(nrst), .Q(n17) );
  DFFARX1 \mem_reg[4]  ( .D(n43), .CLK(clk), .RSTB(nrst), .Q(n16) );
  DFFARX1 \mem_reg[3]  ( .D(n38), .CLK(clk), .RSTB(nrst), .Q(n15) );
  DFFARX1 \mem_reg[2]  ( .D(n29), .CLK(clk), .RSTB(nrst), .Q(n14) );
  DFFARX1 \mem_reg[1]  ( .D(n28), .CLK(clk), .RSTB(nrst), .Q(n11) );
  NAND2X1 U6 ( .IN1(n61), .IN2(n5), .QN(n55) );
  NOR2X0 U8 ( .IN1(n4), .IN2(n47), .QN(n61) );
  NOR2X0 U10 ( .IN1(n63), .IN2(valid), .QN(n62) );
  AOI21X1 U12 ( .IN1(load), .IN2(n4), .IN3(n61), .QN(n63) );
  NAND2X1 U14 ( .IN1(n60), .IN2(n59), .QN(n25) );
endmodule


module sertopar ( clk, nrst, en, serial, parallel, valid_out );
  output [7:0] parallel;
  input clk, nrst, en, serial;
  output valid_out;
  wire   n2, n5, n6, n9, n10, n11, n13, n14, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n1, n3, n4, n7, n8,
         n12;

  DFFARX1 \parallel_reg[0]  ( .D(n23), .CLK(clk), .RSTB(nrst), .Q(parallel[0])
         );
  DFFARX1 \parallel_reg[1]  ( .D(n22), .CLK(clk), .RSTB(nrst), .Q(parallel[1])
         );
  DFFARX1 \parallel_reg[2]  ( .D(n21), .CLK(clk), .RSTB(nrst), .Q(parallel[2])
         );
  DFFARX1 \parallel_reg[3]  ( .D(n20), .CLK(clk), .RSTB(nrst), .Q(parallel[3])
         );
  DFFARX1 \parallel_reg[4]  ( .D(n19), .CLK(clk), .RSTB(nrst), .Q(parallel[4])
         );
  DFFARX1 \parallel_reg[5]  ( .D(n18), .CLK(clk), .RSTB(nrst), .Q(parallel[5])
         );
  DFFARX1 \parallel_reg[6]  ( .D(n17), .CLK(clk), .RSTB(nrst), .Q(parallel[6])
         );
  DFFARX1 \parallel_reg[7]  ( .D(n16), .CLK(clk), .RSTB(nrst), .Q(parallel[7])
         );
  DFFARX1 valid_out_reg ( .D(n28), .CLK(clk), .RSTB(nrst), .Q(valid_out) );
  AO22X1 U3 ( .IN1(parallel[7]), .IN2(n4), .IN3(parallel[6]), .IN4(n2), .Q(n16) );
  AO22X1 U4 ( .IN1(parallel[6]), .IN2(n4), .IN3(parallel[5]), .IN4(n2), .Q(n17) );
  AO22X1 U5 ( .IN1(parallel[5]), .IN2(n4), .IN3(parallel[4]), .IN4(n2), .Q(n18) );
  AO22X1 U6 ( .IN1(parallel[4]), .IN2(n4), .IN3(parallel[3]), .IN4(n2), .Q(n19) );
  AO22X1 U7 ( .IN1(parallel[3]), .IN2(n4), .IN3(parallel[2]), .IN4(n2), .Q(n20) );
  AO22X1 U8 ( .IN1(parallel[2]), .IN2(n4), .IN3(parallel[1]), .IN4(n2), .Q(n21) );
  AO22X1 U9 ( .IN1(parallel[1]), .IN2(n4), .IN3(parallel[0]), .IN4(n2), .Q(n22) );
  AO22X1 U10 ( .IN1(parallel[0]), .IN2(n4), .IN3(serial), .IN4(n2), .Q(n23) );
  XNOR2X1 U11 ( .IN1(n25), .IN2(n1), .Q(n24) );
  AO22X1 U12 ( .IN1(valid_out), .IN2(n3), .IN3(n27), .IN4(n5), .Q(n28) );
  NOR3X0 U14 ( .IN1(n26), .IN2(n14), .IN3(n4), .QN(n5) );
  XNOR2X1 U15 ( .IN1(n6), .IN2(n26), .Q(n29) );
  AO22X1 U16 ( .IN1(n7), .IN2(n8), .IN3(n25), .IN4(n1), .Q(n30) );
  NAND3X0 U19 ( .IN1(n7), .IN2(n12), .IN3(n6), .QN(n11) );
  AO21X1 U22 ( .IN1(n13), .IN2(n6), .IN3(n14), .Q(n10) );
  NOR3X0 U25 ( .IN1(n26), .IN2(n14), .IN3(n27), .QN(n13) );
  XNOR2X1 U26 ( .IN1(n27), .IN2(n2), .Q(n32) );
  DFFARX1 fill_reg ( .D(n30), .CLK(clk), .RSTB(nrst), .Q(n8) );
  DFFARX1 delay_reg ( .D(n24), .CLK(clk), .RSTB(nrst), .QN(n25) );
  DFFARX1 \count_reg[0]  ( .D(n32), .CLK(clk), .RSTB(nrst), .QN(n27) );
  DFFARX1 \count_reg[2]  ( .D(n31), .CLK(clk), .RSTB(nrst), .QN(n14) );
  DFFARX1 \count_reg[1]  ( .D(n29), .CLK(clk), .RSTB(nrst), .Q(n12), .QN(n26)
         );
  INVX0 U13 ( .INP(n2), .ZN(n4) );
  INVX0 U17 ( .INP(n9), .ZN(n1) );
  INVX0 U18 ( .INP(n13), .ZN(n7) );
  NOR2X0 U20 ( .IN1(n25), .IN2(n9), .QN(n2) );
  NOR2X0 U21 ( .IN1(en), .IN2(n8), .QN(n9) );
  NOR2X0 U23 ( .IN1(n4), .IN2(n27), .QN(n6) );
  NAND2X1 U24 ( .IN1(n10), .IN2(n11), .QN(n31) );
  INVX0 U27 ( .INP(n5), .ZN(n3) );
endmodule


module sertopar_slave ( clk, nrst, ready, serial, trigger, parallel, valid_out
 );
  output [7:0] parallel;
  input clk, nrst, ready, serial, trigger;
  output valid_out;
  wire   n2, n8, n9, n10, n12, n17, n18, n19, n20, n21, n22, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n1, n3, n4, n5, n6, n7, n11, n13, n14, n15, n16,
         n23, n24;

  DFFX1 en_reg ( .D(n30), .CLK(trigger), .Q(n1), .QN(n26) );
  DFFARX1 c_reg ( .D(n29), .CLK(trigger), .RSTB(n4), .Q(n3) );
  DFFARX1 valid_out_reg ( .D(n42), .CLK(clk), .RSTB(n4), .Q(valid_out) );
  DFFARX1 \parallel_reg[0]  ( .D(n27), .CLK(clk), .RSTB(n4), .Q(parallel[0])
         );
  DFFARX1 \parallel_reg[1]  ( .D(n41), .CLK(clk), .RSTB(n4), .Q(parallel[1])
         );
  DFFARX1 \parallel_reg[2]  ( .D(n40), .CLK(clk), .RSTB(n4), .Q(parallel[2])
         );
  DFFARX1 \parallel_reg[3]  ( .D(n39), .CLK(clk), .RSTB(n4), .Q(parallel[3])
         );
  DFFARX1 \parallel_reg[4]  ( .D(n38), .CLK(clk), .RSTB(n4), .Q(parallel[4])
         );
  DFFARX1 \parallel_reg[5]  ( .D(n37), .CLK(clk), .RSTB(nrst), .Q(parallel[5])
         );
  DFFARX1 \parallel_reg[6]  ( .D(n36), .CLK(clk), .RSTB(nrst), .Q(parallel[6])
         );
  DFFARX1 \parallel_reg[7]  ( .D(n35), .CLK(clk), .RSTB(nrst), .Q(parallel[7])
         );
  AO22X1 U3 ( .IN1(parallel[0]), .IN2(n7), .IN3(serial), .IN4(n2), .Q(n27) );
  XNOR2X1 U4 ( .IN1(n34), .IN2(n6), .Q(n28) );
  AO22X1 U5 ( .IN1(ready), .IN2(serial), .IN3(n3), .IN4(n24), .Q(n29) );
  AO22X1 U7 ( .IN1(n4), .IN2(ready), .IN3(n1), .IN4(n5), .Q(n30) );
  AO222X1 U9 ( .IN1(parallel[5]), .IN2(n8), .IN3(parallel[6]), .IN4(n9), .IN5(
        parallel[7]), .IN6(n7), .Q(n35) );
  AO222X1 U10 ( .IN1(parallel[4]), .IN2(n8), .IN3(parallel[5]), .IN4(n9), 
        .IN5(parallel[6]), .IN6(n7), .Q(n36) );
  AO222X1 U11 ( .IN1(parallel[3]), .IN2(n8), .IN3(parallel[4]), .IN4(n9), 
        .IN5(parallel[5]), .IN6(n7), .Q(n37) );
  AO222X1 U12 ( .IN1(parallel[2]), .IN2(n8), .IN3(parallel[3]), .IN4(n9), 
        .IN5(parallel[4]), .IN6(n7), .Q(n38) );
  AO222X1 U13 ( .IN1(parallel[1]), .IN2(n8), .IN3(parallel[2]), .IN4(n9), 
        .IN5(parallel[3]), .IN6(n7), .Q(n39) );
  AO222X1 U14 ( .IN1(n8), .IN2(parallel[0]), .IN3(parallel[1]), .IN4(n9), 
        .IN5(parallel[2]), .IN6(n7), .Q(n40) );
  AO222X1 U15 ( .IN1(n8), .IN2(n3), .IN3(n9), .IN4(parallel[0]), .IN5(
        parallel[1]), .IN6(n7), .Q(n41) );
  AO22X1 U19 ( .IN1(n10), .IN2(n14), .IN3(valid_out), .IN4(n12), .Q(n42) );
  AO21X1 U21 ( .IN1(n11), .IN2(n23), .IN3(n10), .Q(n43) );
  AND3X1 U22 ( .IN1(n2), .IN2(n16), .IN3(n32), .Q(n10) );
  AO22X1 U24 ( .IN1(n7), .IN2(n16), .IN3(n18), .IN4(n33), .Q(n44) );
  NAND4X0 U28 ( .IN1(n31), .IN2(n2), .IN3(n16), .IN4(n23), .QN(n20) );
  AO21X1 U29 ( .IN1(n17), .IN2(n23), .IN3(n31), .Q(n19) );
  AO22X1 U34 ( .IN1(n22), .IN2(n15), .IN3(n34), .IN4(n6), .Q(n46) );
  NAND3X0 U39 ( .IN1(n23), .IN2(n14), .IN3(n33), .QN(n22) );
  DFFARX1 fill_reg ( .D(n46), .CLK(clk), .RSTB(n4), .Q(n15) );
  DFFARX1 delay_reg ( .D(n28), .CLK(clk), .RSTB(n4), .QN(n34) );
  DFFARX1 \count_reg[1]  ( .D(n43), .CLK(clk), .RSTB(n4), .Q(n23), .QN(n32) );
  DFFARX1 \count_reg[2]  ( .D(n45), .CLK(clk), .RSTB(n4), .Q(n14), .QN(n31) );
  DFFARX1 \count_reg[0]  ( .D(n44), .CLK(clk), .RSTB(n4), .Q(n16), .QN(n33) );
  INVX0 U6 ( .INP(n5), .ZN(n4) );
  INVX0 U8 ( .INP(n21), .ZN(n6) );
  INVX0 U16 ( .INP(nrst), .ZN(n5) );
  NOR2X0 U17 ( .IN1(n7), .IN2(n1), .QN(n9) );
  INVX0 U18 ( .INP(n22), .ZN(n13) );
  INVX0 U20 ( .INP(n2), .ZN(n7) );
  NOR2X0 U23 ( .IN1(n15), .IN2(n1), .QN(n21) );
  OA21X1 U25 ( .IN1(n16), .IN2(n13), .IN3(n2), .Q(n17) );
  INVX0 U26 ( .INP(n17), .ZN(n11) );
  NOR2X0 U27 ( .IN1(n34), .IN2(n21), .QN(n2) );
  NOR2X0 U30 ( .IN1(n7), .IN2(n26), .QN(n8) );
  NAND2X1 U31 ( .IN1(n19), .IN2(n20), .QN(n45) );
  NOR2X0 U32 ( .IN1(n13), .IN2(n7), .QN(n18) );
  NAND2X1 U33 ( .IN1(n13), .IN2(n2), .QN(n12) );
  INVX0 U35 ( .INP(ready), .ZN(n24) );
endmodule


module reg2_0 ( clk, nrst, en, data_in, data_out );
  input [1:0] data_in;
  output [1:0] data_out;
  input clk, nrst, en;
  wire   n2, n3, n1;

  DFFARX1 \data_out_reg[1]  ( .D(n3), .CLK(clk), .RSTB(nrst), .Q(data_out[1])
         );
  DFFARX1 \data_out_reg[0]  ( .D(n2), .CLK(clk), .RSTB(nrst), .Q(data_out[0])
         );
  AO22X1 U2 ( .IN1(n1), .IN2(data_out[0]), .IN3(en), .IN4(data_in[0]), .Q(n2)
         );
  AO22X1 U3 ( .IN1(n1), .IN2(data_out[1]), .IN3(data_in[1]), .IN4(en), .Q(n3)
         );
  INVX0 U4 ( .INP(en), .ZN(n1) );
endmodule


module reg2_2 ( clk, nrst, en, data_in, data_out );
  input [1:0] data_in;
  output [1:0] data_out;
  input clk, nrst, en;
  wire   n1, n4, n5;

  AO22X1 U2 ( .IN1(n1), .IN2(data_out[0]), .IN3(en), .IN4(data_in[0]), .Q(n5)
         );
  AO22X1 U3 ( .IN1(n1), .IN2(data_out[1]), .IN3(data_in[1]), .IN4(en), .Q(n4)
         );
  DFFARX1 \data_out_reg[0]  ( .D(n5), .CLK(clk), .RSTB(nrst), .Q(data_out[0])
         );
  DFFARX1 \data_out_reg[1]  ( .D(n4), .CLK(clk), .RSTB(nrst), .Q(data_out[1])
         );
  INVX0 U4 ( .INP(en), .ZN(n1) );
endmodule


module reg2_1 ( clk, nrst, en, data_in, data_out );
  input [1:0] data_in;
  output [1:0] data_out;
  input clk, nrst, en;
  wire   n1, n4, n5;

  AO22X1 U2 ( .IN1(n1), .IN2(data_out[0]), .IN3(en), .IN4(data_in[0]), .Q(n5)
         );
  AO22X1 U3 ( .IN1(n1), .IN2(data_out[1]), .IN3(data_in[1]), .IN4(en), .Q(n4)
         );
  DFFARX1 \data_out_reg[1]  ( .D(n4), .CLK(clk), .RSTB(nrst), .Q(data_out[1])
         );
  DFFARX1 \data_out_reg[0]  ( .D(n5), .CLK(clk), .RSTB(nrst), .Q(data_out[0])
         );
  INVX0 U4 ( .INP(en), .ZN(n1) );
endmodule


module controller ( clk, nrst, baud, dev_id, tx_en, tx_rd, tx_cnt, tx_data, 
        tx_fail, busy, rd_addr, rd_data, SCL_in, SDA_in, SCL_out, SDA_out, 
        SCL_tris, SDA_tris );
  input [6:0] dev_id;
  input [1:0] tx_cnt;
  input [7:0] tx_data;
  input [1:0] rd_addr;
  output [7:0] rd_data;
  input clk, nrst, baud, tx_en, tx_rd, SCL_in, SDA_in;
  output tx_fail, busy, SCL_out, SDA_out, SCL_tris, SDA_tris;
  wire   N10, N68, N69, N70, N71, master, \memory[3][7] , \memory[3][6] ,
         \memory[3][5] , \memory[3][4] , \memory[3][3] , \memory[3][2] ,
         \memory[3][1] , \memory[3][0] , \memory[2][7] , \memory[2][6] ,
         \memory[2][5] , \memory[2][4] , \memory[2][3] , \memory[2][2] ,
         \memory[2][1] , \memory[2][0] , \memory[1][7] , \memory[1][6] ,
         \memory[1][5] , \memory[1][4] , \memory[1][3] , \memory[1][2] ,
         \memory[1][1] , \memory[1][0] , \memory[0][7] , \memory[0][6] ,
         \memory[0][5] , \memory[0][4] , \memory[0][3] , \memory[0][2] ,
         \memory[0][1] , \memory[0][0] , clk2, comm_start, clk_sel, read, a,
         valid, valid2, valid3, SDA_reg, SDA_devid, SDA_write, slave_write,
         delay, \ncount[2] , read_done, slave_wr_done, start_timing,
         send_devid, load, store, id_done, wr_done, N245, s_read, _0_net_,
         _2_net_, \_4_net_[7] , \_4_net_[6] , \_4_net_[5] , \_4_net_[4] ,
         \_4_net_[3] , \_4_net_[2] , \_4_net_[1] , \_4_net_[0] , _6_net_,
         _7_net_, _8_net_, _12_net_, n13, n32, n40, n53, n55, n56, n57, n59,
         n60, n61, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n215,
         n216, n217, n218, n219, n220, n221, n222, n223, n224, n225, n226,
         n227, n228, n229, n230, n231, n232, n233, n234, n235, n236, n237,
         n238, n239, n240, n241, n242, n243, n244, n245, n246, n247, n248,
         n249, n250, n251, n252, n253, n254, n255, n256, n257, n258, n259,
         n260, n261, n262, n263, n264, n265, n266, n267, n268, n269, n270,
         n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281,
         n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292,
         n293, n294, n295, n296, n297, n298, n299, n300, n301, n302, n303,
         n304, n305, n306, n307, n308, n309, n310, n311, n312, n313, n314,
         n315, n316, n317, n318, n319, n320, n321, n322, n323, n324, n325,
         n326, n327, n328, n329, n330, n331;
  wire   [5:2] scl_seq;
  wire   [1:0] b;
  wire   [7:0] byte_data;
  wire   [7:0] s_byte;
  wire   [2:0] state;
  assign N68 = rd_addr[0];
  assign N69 = rd_addr[1];

  DFFARX1 busy_reg ( .D(n263), .CLK(clk_sel), .RSTB(nrst), .Q(busy) );
  DFFARX1 \ncount_reg[2]  ( .D(n250), .CLK(clk_sel), .RSTB(nrst), .Q(
        \ncount[2] ) );
  DFFARX1 start_timing_reg ( .D(n257), .CLK(clk_sel), .RSTB(nrst), .Q(
        start_timing) );
  DFFASX1 SCL_tris_reg ( .D(n256), .CLK(clk_sel), .SETB(nrst), .Q(SCL_tris) );
  DFFASX1 SCL_out_reg ( .D(n254), .CLK(clk_sel), .SETB(nrst), .Q(SCL_out) );
  DFFARX1 tx_fail_reg ( .D(n246), .CLK(clk_sel), .RSTB(nrst), .Q(tx_fail) );
  DFFARX1 store_reg ( .D(n253), .CLK(clk_sel), .RSTB(nrst), .Q(store) );
  DFFARX1 load_reg ( .D(n251), .CLK(clk_sel), .RSTB(nrst), .Q(load) );
  DFFARX1 \memory_reg[3][0]  ( .D(n242), .CLK(clk_sel), .RSTB(nrst), .Q(
        \memory[3][0] ) );
  DFFARX1 \memory_reg[2][0]  ( .D(n243), .CLK(clk_sel), .RSTB(nrst), .Q(
        \memory[2][0] ) );
  DFFARX1 \memory_reg[1][0]  ( .D(n244), .CLK(clk_sel), .RSTB(nrst), .Q(
        \memory[1][0] ) );
  DFFARX1 \memory_reg[0][0]  ( .D(n245), .CLK(clk_sel), .RSTB(nrst), .Q(
        \memory[0][0] ) );
  DFFARX1 \memory_reg[3][1]  ( .D(n238), .CLK(clk_sel), .RSTB(nrst), .Q(
        \memory[3][1] ) );
  DFFARX1 \memory_reg[2][1]  ( .D(n239), .CLK(clk_sel), .RSTB(nrst), .Q(
        \memory[2][1] ) );
  DFFARX1 \memory_reg[1][1]  ( .D(n240), .CLK(clk_sel), .RSTB(nrst), .Q(
        \memory[1][1] ) );
  DFFARX1 \memory_reg[0][1]  ( .D(n241), .CLK(clk_sel), .RSTB(nrst), .Q(
        \memory[0][1] ) );
  DFFARX1 \memory_reg[3][2]  ( .D(n234), .CLK(clk_sel), .RSTB(nrst), .Q(
        \memory[3][2] ) );
  DFFARX1 \memory_reg[2][2]  ( .D(n235), .CLK(clk_sel), .RSTB(nrst), .Q(
        \memory[2][2] ) );
  DFFARX1 \memory_reg[1][2]  ( .D(n236), .CLK(clk_sel), .RSTB(nrst), .Q(
        \memory[1][2] ) );
  DFFARX1 \memory_reg[0][2]  ( .D(n237), .CLK(clk_sel), .RSTB(nrst), .Q(
        \memory[0][2] ) );
  DFFARX1 \memory_reg[3][3]  ( .D(n230), .CLK(clk_sel), .RSTB(nrst), .Q(
        \memory[3][3] ) );
  DFFARX1 \memory_reg[2][3]  ( .D(n231), .CLK(clk_sel), .RSTB(nrst), .Q(
        \memory[2][3] ) );
  DFFARX1 \memory_reg[1][3]  ( .D(n232), .CLK(clk_sel), .RSTB(nrst), .Q(
        \memory[1][3] ) );
  DFFARX1 \memory_reg[0][3]  ( .D(n233), .CLK(clk_sel), .RSTB(nrst), .Q(
        \memory[0][3] ) );
  DFFARX1 \memory_reg[3][4]  ( .D(n226), .CLK(clk_sel), .RSTB(nrst), .Q(
        \memory[3][4] ) );
  DFFARX1 \memory_reg[2][4]  ( .D(n227), .CLK(clk_sel), .RSTB(nrst), .Q(
        \memory[2][4] ) );
  DFFARX1 \memory_reg[1][4]  ( .D(n228), .CLK(clk_sel), .RSTB(nrst), .Q(
        \memory[1][4] ) );
  DFFARX1 \memory_reg[0][4]  ( .D(n229), .CLK(clk_sel), .RSTB(nrst), .Q(
        \memory[0][4] ) );
  DFFARX1 \memory_reg[3][5]  ( .D(n222), .CLK(clk_sel), .RSTB(nrst), .Q(
        \memory[3][5] ) );
  DFFARX1 \memory_reg[2][5]  ( .D(n223), .CLK(clk_sel), .RSTB(nrst), .Q(
        \memory[2][5] ) );
  DFFARX1 \memory_reg[1][5]  ( .D(n224), .CLK(clk_sel), .RSTB(nrst), .Q(
        \memory[1][5] ) );
  DFFARX1 \memory_reg[0][5]  ( .D(n225), .CLK(clk_sel), .RSTB(nrst), .Q(
        \memory[0][5] ) );
  DFFARX1 \memory_reg[3][6]  ( .D(n218), .CLK(clk_sel), .RSTB(nrst), .Q(
        \memory[3][6] ) );
  DFFARX1 \memory_reg[2][6]  ( .D(n219), .CLK(clk_sel), .RSTB(nrst), .Q(
        \memory[2][6] ) );
  DFFARX1 \memory_reg[1][6]  ( .D(n220), .CLK(clk_sel), .RSTB(nrst), .Q(
        \memory[1][6] ) );
  DFFARX1 \memory_reg[0][6]  ( .D(n221), .CLK(clk_sel), .RSTB(nrst), .Q(
        \memory[0][6] ) );
  DFFARX1 \memory_reg[3][7]  ( .D(n214), .CLK(clk_sel), .RSTB(nrst), .Q(
        \memory[3][7] ) );
  DFFARX1 \memory_reg[2][7]  ( .D(n215), .CLK(clk_sel), .RSTB(nrst), .Q(
        \memory[2][7] ) );
  DFFARX1 \memory_reg[1][7]  ( .D(n216), .CLK(clk_sel), .RSTB(nrst), .Q(
        \memory[1][7] ) );
  DFFARX1 \memory_reg[0][7]  ( .D(n217), .CLK(clk_sel), .RSTB(nrst), .Q(
        \memory[0][7] ) );
  DFFARX1 send_devid_reg ( .D(n255), .CLK(clk_sel), .RSTB(nrst), .Q(send_devid) );
  DFFASX1 SDA_reg_reg ( .D(n247), .CLK(clk_sel), .SETB(nrst), .Q(SDA_reg) );
  AO22X1 U112 ( .IN1(SDA_tris), .IN2(n67), .IN3(n68), .IN4(n307), .Q(n213) );
  AO221X1 U113 ( .IN1(n69), .IN2(n70), .IN3(n71), .IN4(n72), .IN5(n309), .Q(
        n68) );
  NAND3X0 U114 ( .IN1(n73), .IN2(n329), .IN3(n320), .QN(n72) );
  AO21X1 U115 ( .IN1(n74), .IN2(n61), .IN3(n75), .Q(n70) );
  AND4X1 U116 ( .IN1(n78), .IN2(n79), .IN3(n330), .IN4(n311), .Q(n76) );
  OR3X1 U117 ( .IN1(n61), .IN2(n80), .IN3(n268), .Q(n79) );
  AO22X1 U118 ( .IN1(n297), .IN2(n82), .IN3(\memory[3][7] ), .IN4(n83), .Q(
        n214) );
  AO22X1 U119 ( .IN1(n296), .IN2(n82), .IN3(\memory[2][7] ), .IN4(n84), .Q(
        n215) );
  AO22X1 U120 ( .IN1(n295), .IN2(n82), .IN3(\memory[1][7] ), .IN4(n85), .Q(
        n216) );
  AO22X1 U121 ( .IN1(n294), .IN2(n82), .IN3(\memory[0][7] ), .IN4(n86), .Q(
        n217) );
  AO22X1 U122 ( .IN1(s_byte[7]), .IN2(n268), .IN3(byte_data[7]), .IN4(n273), 
        .Q(n82) );
  AO22X1 U123 ( .IN1(n297), .IN2(n87), .IN3(\memory[3][6] ), .IN4(n83), .Q(
        n218) );
  AO22X1 U124 ( .IN1(n296), .IN2(n87), .IN3(\memory[2][6] ), .IN4(n84), .Q(
        n219) );
  AO22X1 U125 ( .IN1(n295), .IN2(n87), .IN3(\memory[1][6] ), .IN4(n85), .Q(
        n220) );
  AO22X1 U126 ( .IN1(n294), .IN2(n87), .IN3(\memory[0][6] ), .IN4(n86), .Q(
        n221) );
  AO22X1 U127 ( .IN1(s_byte[6]), .IN2(n268), .IN3(byte_data[6]), .IN4(n274), 
        .Q(n87) );
  AO22X1 U129 ( .IN1(n297), .IN2(n88), .IN3(\memory[3][5] ), .IN4(n83), .Q(
        n222) );
  AO22X1 U130 ( .IN1(n296), .IN2(n88), .IN3(\memory[2][5] ), .IN4(n84), .Q(
        n223) );
  AO22X1 U131 ( .IN1(n295), .IN2(n88), .IN3(\memory[1][5] ), .IN4(n85), .Q(
        n224) );
  AO22X1 U132 ( .IN1(n294), .IN2(n88), .IN3(\memory[0][5] ), .IN4(n86), .Q(
        n225) );
  AO22X1 U133 ( .IN1(s_byte[5]), .IN2(n268), .IN3(byte_data[5]), .IN4(n270), 
        .Q(n88) );
  AO22X1 U134 ( .IN1(n297), .IN2(n89), .IN3(\memory[3][4] ), .IN4(n83), .Q(
        n226) );
  AO22X1 U135 ( .IN1(n296), .IN2(n89), .IN3(\memory[2][4] ), .IN4(n84), .Q(
        n227) );
  AO22X1 U136 ( .IN1(n295), .IN2(n89), .IN3(\memory[1][4] ), .IN4(n85), .Q(
        n228) );
  AO22X1 U137 ( .IN1(n294), .IN2(n89), .IN3(\memory[0][4] ), .IN4(n86), .Q(
        n229) );
  AO22X1 U138 ( .IN1(s_byte[4]), .IN2(n268), .IN3(byte_data[4]), .IN4(n274), 
        .Q(n89) );
  AO22X1 U139 ( .IN1(n297), .IN2(n90), .IN3(\memory[3][3] ), .IN4(n83), .Q(
        n230) );
  AO22X1 U140 ( .IN1(n296), .IN2(n90), .IN3(\memory[2][3] ), .IN4(n84), .Q(
        n231) );
  AO22X1 U141 ( .IN1(n295), .IN2(n90), .IN3(\memory[1][3] ), .IN4(n85), .Q(
        n232) );
  AO22X1 U142 ( .IN1(n294), .IN2(n90), .IN3(\memory[0][3] ), .IN4(n86), .Q(
        n233) );
  AO22X1 U143 ( .IN1(s_byte[3]), .IN2(n268), .IN3(byte_data[3]), .IN4(n269), 
        .Q(n90) );
  AO22X1 U144 ( .IN1(n297), .IN2(n91), .IN3(\memory[3][2] ), .IN4(n83), .Q(
        n234) );
  AO22X1 U145 ( .IN1(n296), .IN2(n91), .IN3(\memory[2][2] ), .IN4(n84), .Q(
        n235) );
  AO22X1 U146 ( .IN1(n295), .IN2(n91), .IN3(\memory[1][2] ), .IN4(n85), .Q(
        n236) );
  AO22X1 U147 ( .IN1(n294), .IN2(n91), .IN3(\memory[0][2] ), .IN4(n86), .Q(
        n237) );
  AO22X1 U148 ( .IN1(s_byte[2]), .IN2(n268), .IN3(byte_data[2]), .IN4(n274), 
        .Q(n91) );
  AO22X1 U149 ( .IN1(n297), .IN2(n92), .IN3(\memory[3][1] ), .IN4(n83), .Q(
        n238) );
  AO22X1 U150 ( .IN1(n296), .IN2(n92), .IN3(\memory[2][1] ), .IN4(n84), .Q(
        n239) );
  AO22X1 U151 ( .IN1(n295), .IN2(n92), .IN3(\memory[1][1] ), .IN4(n85), .Q(
        n240) );
  AO22X1 U152 ( .IN1(n294), .IN2(n92), .IN3(\memory[0][1] ), .IN4(n86), .Q(
        n241) );
  AO22X1 U153 ( .IN1(s_byte[1]), .IN2(n268), .IN3(byte_data[1]), .IN4(n270), 
        .Q(n92) );
  AO22X1 U154 ( .IN1(n297), .IN2(n93), .IN3(\memory[3][0] ), .IN4(n83), .Q(
        n242) );
  NAND3X0 U155 ( .IN1(N71), .IN2(N70), .IN3(n94), .QN(n83) );
  AO22X1 U156 ( .IN1(n296), .IN2(n93), .IN3(\memory[2][0] ), .IN4(n84), .Q(
        n243) );
  NAND3X0 U157 ( .IN1(N71), .IN2(n60), .IN3(n94), .QN(n84) );
  AO22X1 U158 ( .IN1(n295), .IN2(n93), .IN3(\memory[1][0] ), .IN4(n85), .Q(
        n244) );
  NAND3X0 U159 ( .IN1(N70), .IN2(n59), .IN3(n94), .QN(n85) );
  AO22X1 U160 ( .IN1(n294), .IN2(n93), .IN3(\memory[0][0] ), .IN4(n86), .Q(
        n245) );
  AO22X1 U161 ( .IN1(s_byte[0]), .IN2(n268), .IN3(byte_data[0]), .IN4(n272), 
        .Q(n93) );
  NAND3X0 U162 ( .IN1(n60), .IN2(n59), .IN3(n94), .QN(n86) );
  AO22X1 U163 ( .IN1(tx_fail), .IN2(n95), .IN3(n96), .IN4(n97), .Q(n246) );
  AOI21X1 U164 ( .IN1(n98), .IN2(n99), .IN3(n309), .QN(n95) );
  AO21X1 U165 ( .IN1(n97), .IN2(a), .IN3(n100), .Q(n99) );
  AO22X1 U166 ( .IN1(SDA_reg), .IN2(n308), .IN3(n101), .IN4(n102), .Q(n247) );
  AO21X1 U167 ( .IN1(n103), .IN2(n104), .IN3(n309), .Q(n101) );
  AO221X1 U168 ( .IN1(n270), .IN2(n105), .IN3(n106), .IN4(n268), .IN5(n107), 
        .Q(n104) );
  NAND3X0 U169 ( .IN1(n73), .IN2(n330), .IN3(n108), .QN(n106) );
  AO221X1 U170 ( .IN1(n110), .IN2(n111), .IN3(n100), .IN4(n57), .IN5(n325), 
        .Q(n105) );
  NAND3X0 U171 ( .IN1(n77), .IN2(n112), .IN3(n113), .QN(n102) );
  OA221X1 U172 ( .IN1(delay), .IN2(n114), .IN3(n115), .IN4(n57), .IN5(n311), 
        .Q(n113) );
  OA221X1 U173 ( .IN1(n275), .IN2(n313), .IN3(n268), .IN4(n117), .IN5(n329), 
        .Q(n114) );
  AO21X1 U174 ( .IN1(n118), .IN2(n119), .IN3(n61), .Q(n117) );
  OAI21X1 U175 ( .IN1(n120), .IN2(n59), .IN3(n121), .QN(n248) );
  NAND3X0 U176 ( .IN1(N70), .IN2(n59), .IN3(n292), .QN(n121) );
  AO22X1 U177 ( .IN1(n291), .IN2(N70), .IN3(n292), .IN4(n60), .Q(n249) );
  AO22X1 U178 ( .IN1(n291), .IN2(\ncount[2] ), .IN3(n292), .IN4(n124), .Q(n250) );
  XNOR2X1 U179 ( .IN1(\ncount[2] ), .IN2(n125), .Q(n124) );
  NAND3X0 U180 ( .IN1(n126), .IN2(n123), .IN3(n103), .QN(n122) );
  NAND4X0 U181 ( .IN1(n293), .IN2(n127), .IN3(n128), .IN4(n129), .QN(n123) );
  NAND4X0 U182 ( .IN1(slave_wr_done), .IN2(n109), .IN3(delay), .IN4(n71), .QN(
        n130) );
  NOR4X0 U183 ( .IN1(n305), .IN2(n61), .IN3(n131), .IN4(delay), .QN(n94) );
  AO22X1 U184 ( .IN1(load), .IN2(n132), .IN3(n133), .IN4(n103), .Q(n251) );
  AOI21X1 U185 ( .IN1(n320), .IN2(n330), .IN3(n132), .QN(n133) );
  OA22X1 U186 ( .IN1(n135), .IN2(n57), .IN3(delay), .IN4(n322), .Q(n134) );
  AO221X1 U187 ( .IN1(n136), .IN2(byte_data[0]), .IN3(tx_rd), .IN4(_0_net_), 
        .IN5(n137), .Q(n252) );
  NOR4X0 U188 ( .IN1(_0_net_), .IN2(n136), .IN3(n290), .IN4(n40), .QN(n137) );
  AND4X1 U189 ( .IN1(n325), .IN2(a), .IN3(n138), .IN4(n139), .Q(n136) );
  AO22X1 U190 ( .IN1(store), .IN2(n140), .IN3(n141), .IN4(n103), .Q(n253) );
  AOI221X1 U191 ( .IN1(n142), .IN2(delay), .IN3(n98), .IN4(n331), .IN5(n309), 
        .QN(n140) );
  NAND4X0 U192 ( .IN1(n300), .IN2(n127), .IN3(n144), .IN4(n145), .QN(n254) );
  NAND4X0 U193 ( .IN1(SCL_out), .IN2(n299), .IN3(n148), .IN4(n316), .QN(n147)
         );
  AO21X1 U194 ( .IN1(n321), .IN2(n149), .IN3(n305), .Q(n144) );
  AO22X1 U195 ( .IN1(n301), .IN2(n315), .IN3(send_devid), .IN4(n150), .Q(n255)
         );
  OA221X1 U196 ( .IN1(n302), .IN2(n119), .IN3(n57), .IN4(n146), .IN5(n127), 
        .Q(n150) );
  AO22X1 U197 ( .IN1(SCL_tris), .IN2(n299), .IN3(n151), .IN4(n152), .Q(n256)
         );
  AO22X1 U198 ( .IN1(n153), .IN2(delay), .IN3(n154), .IN4(n155), .Q(n258) );
  AND4X1 U199 ( .IN1(n148), .IN2(n77), .IN3(n156), .IN4(n115), .Q(n153) );
  NAND3X0 U200 ( .IN1(n275), .IN2(n100), .IN3(delay), .QN(n156) );
  AO22X1 U201 ( .IN1(n298), .IN2(state[1]), .IN3(n158), .IN4(n103), .Q(n259)
         );
  OA22X1 U202 ( .IN1(n268), .IN2(n319), .IN3(n160), .IN4(n161), .Q(n159) );
  NAND3X0 U203 ( .IN1(n162), .IN2(n163), .IN3(n131), .QN(n126) );
  OA22X1 U204 ( .IN1(n164), .IN2(n272), .IN3(n73), .IN4(n268), .Q(n131) );
  AO22X1 U205 ( .IN1(n298), .IN2(state[0]), .IN3(n166), .IN4(n167), .Q(n260)
         );
  AO22X1 U206 ( .IN1(n71), .IN2(n168), .IN3(n69), .IN4(n169), .Q(n166) );
  NAND4X0 U207 ( .IN1(state[0]), .IN2(n170), .IN3(n164), .IN4(n319), .QN(n169)
         );
  AO22X1 U208 ( .IN1(n298), .IN2(state[2]), .IN3(n172), .IN4(n103), .Q(n261)
         );
  OA22X1 U209 ( .IN1(n274), .IN2(n174), .IN3(n175), .IN4(n268), .Q(n173) );
  NOR4X0 U210 ( .IN1(n176), .IN2(n331), .IN3(n74), .IN4(n171), .QN(n175) );
  AO21X1 U211 ( .IN1(n97), .IN2(n310), .IN3(n109), .Q(n176) );
  NOR3X0 U212 ( .IN1(n177), .IN2(n74), .IN3(n157), .QN(n174) );
  NAND3X0 U213 ( .IN1(n128), .IN2(n127), .IN3(n179), .QN(n167) );
  OA22X1 U214 ( .IN1(n180), .IN2(n302), .IN3(n181), .IN4(n300), .Q(n179) );
  OA222X1 U215 ( .IN1(n163), .IN2(n317), .IN3(delay), .IN4(n182), .IN5(n321), 
        .IN6(n56), .Q(n181) );
  NOR3X0 U216 ( .IN1(n81), .IN2(n97), .IN3(n183), .QN(n182) );
  NAND3X0 U217 ( .IN1(n184), .IN2(n185), .IN3(n186), .QN(n116) );
  XNOR3X1 U218 ( .IN1(N71), .IN2(b[1]), .IN3(b[0]), .Q(n186) );
  XNOR2X1 U219 ( .IN1(n60), .IN2(b[0]), .Q(n185) );
  XOR2X1 U220 ( .IN1(n187), .IN2(\ncount[2] ), .Q(n184) );
  AO21X1 U221 ( .IN1(a), .IN2(n188), .IN3(n331), .Q(n81) );
  NAND3X0 U222 ( .IN1(n322), .IN2(n164), .IN3(n189), .QN(n188) );
  NAND3X0 U223 ( .IN1(n103), .IN2(n193), .IN3(n318), .QN(n192) );
  AO22X1 U224 ( .IN1(n274), .IN2(n195), .IN3(n196), .IN4(n268), .Q(n193) );
  AO222X1 U225 ( .IN1(slave_wr_done), .IN2(n109), .IN3(read_done), .IN4(n325), 
        .IN5(s_read), .IN6(n326), .Q(n196) );
  AO221X1 U226 ( .IN1(SDA_in), .IN2(n324), .IN3(read_done), .IN4(n331), .IN5(
        n197), .Q(n195) );
  AO22X1 U227 ( .IN1(wr_done), .IN2(n326), .IN3(id_done), .IN4(n325), .Q(n197)
         );
  NAND3X0 U228 ( .IN1(a), .IN2(n194), .IN3(n77), .QN(n191) );
  AO21X1 U229 ( .IN1(n80), .IN2(n198), .IN3(n57), .Q(n194) );
  NAND3X0 U230 ( .IN1(n56), .IN2(n55), .IN3(state[2]), .QN(n73) );
  OR2X1 U231 ( .IN1(n324), .IN2(n75), .Q(n178) );
  NAND3X0 U232 ( .IN1(n55), .IN2(n53), .IN3(n56), .QN(n119) );
  NAND3X0 U233 ( .IN1(state[1]), .IN2(n53), .IN3(state[0]), .QN(n164) );
  AO22X1 U234 ( .IN1(busy), .IN2(n303), .IN3(n199), .IN4(n200), .Q(n263) );
  AO21X1 U235 ( .IN1(n327), .IN2(n103), .IN3(n315), .Q(n199) );
  NAND3X0 U236 ( .IN1(n201), .IN2(n128), .IN3(n77), .QN(n200) );
  NAND3X0 U237 ( .IN1(n202), .IN2(n32), .IN3(n146), .QN(n127) );
  NAND3X0 U238 ( .IN1(n69), .IN2(tx_en), .IN3(n327), .QN(n128) );
  AO21X1 U239 ( .IN1(n111), .IN2(n61), .IN3(n100), .Q(n203) );
  AO21X1 U240 ( .IN1(n270), .IN2(n139), .IN3(_0_net_), .Q(n264) );
  NAND3X0 U241 ( .IN1(n202), .IN2(n314), .IN3(n204), .QN(n265) );
  NAND3X0 U242 ( .IN1(n56), .IN2(n53), .IN3(state[1]), .QN(n163) );
  AO21X1 U243 ( .IN1(n306), .IN2(n268), .IN3(store), .Q(_6_net_) );
  NAND4X0 U244 ( .IN1(SCL_in), .IN2(scl_seq[2]), .IN3(SDA_in), .IN4(n205), 
        .QN(n139) );
  NOR3X0 U245 ( .IN1(scl_seq[3]), .IN2(scl_seq[5]), .IN3(scl_seq[4]), .QN(n205) );
  NOR3X0 U246 ( .IN1(n32), .IN2(busy), .IN3(n316), .QN(_2_net_) );
  OAI21X1 U247 ( .IN1(n202), .IN2(start_timing), .IN3(n314), .QN(_12_net_) );
  NAND4X0 U248 ( .IN1(scl_seq[4]), .IN2(scl_seq[2]), .IN3(scl_seq[5]), .IN4(
        n206), .QN(n202) );
  NOR3X0 U249 ( .IN1(SCL_in), .IN2(scl_seq[3]), .IN3(SDA_in), .QN(n206) );
  AO22X1 U250 ( .IN1(n207), .IN2(n208), .IN3(n312), .IN4(SDA_reg), .Q(SDA_out)
         );
  AO221X1 U251 ( .IN1(SDA_devid), .IN2(n56), .IN3(n269), .IN4(state[2]), .IN5(
        n209), .Q(n208) );
  OAI221X1 U252 ( .IN1(n273), .IN2(n210), .IN3(n211), .IN4(n55), .IN5(n330), 
        .QN(n209) );
  AO21X1 U253 ( .IN1(valid3), .IN2(n268), .IN3(n212), .Q(n207) );
  AND2X1 U254 ( .IN1(baud), .IN2(comm_start), .Q(N10) );
  partoser_0 DATA ( .clk(clk_sel), .nrst(nrst), .load(_0_net_), .send(
        send_devid), .parallel({tx_data[6:0], tx_rd}), .serial(SDA_devid), 
        .valid(valid), .done(id_done) );
  partoser_2 SEND ( .clk(clk_sel), .nrst(nrst), .load(_2_net_), .send(_2_net_), 
        .parallel(tx_data), .serial(SDA_write), .valid(valid2), .done(wr_done)
         );
  partoser_1 SLAVE_SEND ( .clk(clk_sel), .nrst(nrst), .load(load), .send(load), 
        .parallel({\_4_net_[7] , \_4_net_[6] , \_4_net_[5] , \_4_net_[4] , 
        \_4_net_[3] , \_4_net_[2] , \_4_net_[1] , \_4_net_[0] }), .serial(
        slave_write), .valid(valid3), .done(slave_wr_done) );
  sertopar STORE ( .clk(clk_sel), .nrst(_7_net_), .en(_6_net_), .serial(SDA_in), .parallel(byte_data), .valid_out(read_done) );
  sertopar_slave SLAVE ( .clk(clk_sel), .nrst(_7_net_), .ready(_8_net_), 
        .serial(SDA_in), .trigger(SCL_in), .parallel(s_byte), .valid_out(
        s_read) );
  reg2_0 BIT_CHECK1 ( .clk(clk_sel), .nrst(nrst), .en(1'b1), .data_in({SDA_in, 
        SCL_in}), .data_out(scl_seq[3:2]) );
  reg2_2 BIT_CHECK2 ( .clk(clk_sel), .nrst(nrst), .en(1'b1), .data_in(
        scl_seq[3:2]), .data_out(scl_seq[5:4]) );
  reg2_1 CNT_SAVE ( .clk(clk_sel), .nrst(nrst), .en(_12_net_), .data_in(tx_cnt), .data_out(b) );
  DFFASX1 SDA_tris_reg ( .D(n213), .CLK(clk_sel), .SETB(nrst), .Q(SDA_tris) );
  DFFARX1 clk2_reg ( .D(n13), .CLK(clk), .RSTB(nrst), .Q(clk2), .QN(n13) );
  DFFARX1 master_reg ( .D(n264), .CLK(clk_sel), .RSTB(nrst), .Q(master), .QN(
        n268) );
  DFFARX1 comm_start_reg ( .D(n265), .CLK(clk_sel), .RSTB(nrst), .Q(comm_start), .QN(n32) );
  DFFARX1 read_reg ( .D(n252), .CLK(clk_sel), .RSTB(nrst), .Q(read), .QN(n40)
         );
  DFFARX1 a_reg ( .D(n262), .CLK(clk_sel), .RSTB(nrst), .Q(a), .QN(n61) );
  DFFARX1 delay_reg ( .D(n258), .CLK(clk_sel), .RSTB(nrst), .Q(delay), .QN(n57) );
  DFFARX1 \ncount_reg[0]  ( .D(n249), .CLK(clk_sel), .RSTB(nrst), .Q(N70), 
        .QN(n60) );
  DFFARX1 \ncount_reg[1]  ( .D(n248), .CLK(clk_sel), .RSTB(nrst), .Q(N71), 
        .QN(n59) );
  DFFARX1 \state_reg[2]  ( .D(n261), .CLK(clk_sel), .RSTB(nrst), .Q(state[2]), 
        .QN(n53) );
  DFFARX1 \state_reg[1]  ( .D(n259), .CLK(clk_sel), .RSTB(nrst), .Q(state[1]), 
        .QN(n55) );
  DFFARX1 \state_reg[0]  ( .D(n260), .CLK(clk_sel), .RSTB(nrst), .Q(state[0]), 
        .QN(n56) );
  INVX0 U255 ( .INP(n152), .ZN(n299) );
  INVX0 U256 ( .INP(n71), .ZN(n300) );
  NAND2X1 U257 ( .IN1(n77), .IN2(n300), .QN(n152) );
  INVX0 U258 ( .INP(n148), .ZN(n323) );
  NOR2X0 U259 ( .IN1(n315), .IN2(n309), .QN(n77) );
  NOR2X0 U260 ( .IN1(n305), .IN2(n275), .QN(n71) );
  INVX0 U261 ( .INP(n122), .ZN(n292) );
  NOR2X0 U262 ( .IN1(n178), .IN2(n331), .QN(n148) );
  NOR2X0 U263 ( .IN1(n331), .IN2(n75), .QN(n190) );
  INVX0 U264 ( .INP(n118), .ZN(n324) );
  OA21X1 U265 ( .IN1(n310), .IN2(n320), .IN3(n328), .Q(n135) );
  INVX0 U266 ( .INP(n107), .ZN(n311) );
  INVX0 U267 ( .INP(n103), .ZN(n305) );
  INVX0 U268 ( .INP(n127), .ZN(n309) );
  INVX0 U269 ( .INP(n85), .ZN(n295) );
  INVX0 U270 ( .INP(n83), .ZN(n297) );
  INVX0 U271 ( .INP(n86), .ZN(n294) );
  INVX0 U272 ( .INP(n84), .ZN(n296) );
  INVX0 U273 ( .INP(n97), .ZN(n330) );
  INVX0 U274 ( .INP(n167), .ZN(n298) );
  NOR2X0 U275 ( .IN1(n310), .IN2(n320), .QN(n183) );
  INVX0 U276 ( .INP(n69), .ZN(n304) );
  INVX0 U277 ( .INP(n139), .ZN(n290) );
  INVX0 U278 ( .INP(n146), .ZN(n315) );
  INVX0 U279 ( .INP(n202), .ZN(n306) );
  INVX0 U280 ( .INP(n123), .ZN(n291) );
  INVX0 U281 ( .INP(_0_net_), .ZN(n314) );
  INVX0 U282 ( .INP(n98), .ZN(n302) );
  INVX0 U283 ( .INP(n266), .ZN(n269) );
  INVX0 U284 ( .INP(n267), .ZN(n271) );
  INVX0 U285 ( .INP(n268), .ZN(n273) );
  INVX0 U286 ( .INP(n116), .ZN(n310) );
  NOR2X0 U287 ( .IN1(n109), .IN2(n97), .QN(n118) );
  INVX0 U288 ( .INP(n73), .ZN(n331) );
  NAND2X1 U289 ( .IN1(n164), .IN2(n119), .QN(n75) );
  INVX0 U290 ( .INP(n119), .ZN(n325) );
  NOR2X0 U291 ( .IN1(n75), .IN2(n109), .QN(n80) );
  INVX0 U292 ( .INP(n157), .ZN(n320) );
  INVX0 U293 ( .INP(n100), .ZN(n321) );
  INVX0 U294 ( .INP(n164), .ZN(n326) );
  INVX0 U295 ( .INP(n109), .ZN(n322) );
  NOR2X0 U296 ( .IN1(n116), .IN2(n115), .QN(n107) );
  NOR2X0 U297 ( .IN1(n111), .IN2(n126), .QN(n161) );
  INVX0 U298 ( .INP(n163), .ZN(n327) );
  INVX0 U299 ( .INP(n74), .ZN(n328) );
  NAND2X1 U300 ( .IN1(n111), .IN2(n310), .QN(n170) );
  NAND2X1 U301 ( .IN1(n272), .IN2(n100), .QN(n112) );
  INVX0 U302 ( .INP(n111), .ZN(n329) );
  INVX0 U303 ( .INP(n171), .ZN(n319) );
  INVX0 U304 ( .INP(n268), .ZN(n274) );
  INVX0 U305 ( .INP(n267), .ZN(n270) );
  INVX0 U306 ( .INP(n268), .ZN(n272) );
  NOR2X0 U307 ( .IN1(n290), .IN2(n276), .QN(_7_net_) );
  NOR2X0 U308 ( .IN1(n274), .IN2(n163), .QN(_8_net_) );
  INVX0 U309 ( .INP(n94), .ZN(n293) );
  OA21X1 U310 ( .IN1(n119), .IN2(n305), .IN3(n130), .Q(n129) );
  NOR2X0 U311 ( .IN1(n316), .IN2(comm_start), .QN(_0_net_) );
  NOR2X0 U312 ( .IN1(start_timing), .IN2(_0_net_), .QN(n146) );
  NOR2X0 U313 ( .IN1(n305), .IN2(n268), .QN(n69) );
  NOR2X0 U314 ( .IN1(n304), .IN2(delay), .QN(n98) );
  NOR2X0 U315 ( .IN1(n165), .IN2(state[2]), .QN(n97) );
  NAND2X1 U316 ( .IN1(state[0]), .IN2(n55), .QN(n165) );
  NAND2X1 U317 ( .IN1(N245), .IN2(n325), .QN(n189) );
  OA21X1 U318 ( .IN1(comm_start), .IN2(n306), .IN3(n146), .Q(n103) );
  NAND2X1 U319 ( .IN1(comm_start), .IN2(n139), .QN(n204) );
  NOR2X0 U320 ( .IN1(delay), .IN2(n146), .QN(n257) );
  NOR2X0 U321 ( .IN1(n270), .IN2(_0_net_), .QN(n138) );
  INVX0 U322 ( .INP(n150), .ZN(n301) );
  NOR2X0 U323 ( .IN1(n118), .IN2(n140), .QN(n141) );
  NOR2X0 U324 ( .IN1(n143), .IN2(n304), .QN(n142) );
  INVX0 U325 ( .INP(n81), .ZN(n313) );
  OA21X1 U326 ( .IN1(SDA_in), .IN2(n322), .IN3(n330), .Q(n143) );
  NOR2X0 U327 ( .IN1(n95), .IN2(n305), .QN(n96) );
  INVX0 U328 ( .INP(master), .ZN(n267) );
  NAND2X1 U329 ( .IN1(n81), .IN2(n268), .QN(n78) );
  INVX0 U330 ( .INP(tx_en), .ZN(n316) );
  OA21X1 U331 ( .IN1(delay), .IN2(n146), .IN3(n147), .Q(n145) );
  NAND2X1 U332 ( .IN1(delay), .IN2(n323), .QN(n149) );
  NAND2X1 U333 ( .IN1(n146), .IN2(n305), .QN(n155) );
  NOR2X0 U334 ( .IN1(delay), .IN2(n153), .QN(n154) );
  NAND2X1 U335 ( .IN1(state[0]), .IN2(n328), .QN(n168) );
  OA21X1 U336 ( .IN1(valid), .IN2(valid2), .IN3(n271), .Q(n212) );
  NAND2X1 U337 ( .IN1(n98), .IN2(n203), .QN(n201) );
  INVX0 U338 ( .INP(byte_data[2]), .ZN(n288) );
  NOR2X0 U339 ( .IN1(n159), .IN2(n298), .QN(n158) );
  OA21X1 U340 ( .IN1(state[0]), .IN2(n55), .IN3(n165), .Q(n160) );
  NOR2X0 U341 ( .IN1(n298), .IN2(n173), .QN(n172) );
  INVX0 U342 ( .INP(master), .ZN(n266) );
  INVX0 U343 ( .INP(n102), .ZN(n308) );
  INVX0 U344 ( .INP(n67), .ZN(n307) );
  OA21X1 U345 ( .IN1(n76), .IN2(delay), .IN3(n77), .Q(n67) );
  NAND2X1 U346 ( .IN1(n305), .IN2(n127), .QN(n151) );
  NAND2X1 U347 ( .IN1(n191), .IN2(n192), .QN(n262) );
  INVX0 U348 ( .INP(n194), .ZN(n318) );
  OA21X1 U349 ( .IN1(n190), .IN2(n61), .IN3(n118), .Q(n180) );
  NAND2X1 U350 ( .IN1(N71), .IN2(N70), .QN(n125) );
  INVX0 U351 ( .INP(n200), .ZN(n303) );
  NOR2X0 U352 ( .IN1(SDA_write), .IN2(n56), .QN(n211) );
  NOR2X0 U353 ( .IN1(slave_write), .IN2(n165), .QN(n210) );
  INVX0 U354 ( .INP(n207), .ZN(n312) );
  OA21X1 U355 ( .IN1(n134), .IN2(n300), .IN3(n127), .Q(n132) );
  OA21X1 U356 ( .IN1(N70), .IN2(n122), .IN3(n123), .Q(n120) );
  INVX0 U357 ( .INP(dev_id[1]), .ZN(n287) );
  INVX0 U358 ( .INP(SCL_in), .ZN(n317) );
  INVX0 U359 ( .INP(byte_data[1]), .ZN(n289) );
  NOR2X0 U360 ( .IN1(n165), .IN2(n53), .QN(n109) );
  NAND2X1 U361 ( .IN1(n109), .IN2(n268), .QN(n162) );
  NOR2X0 U362 ( .IN1(n53), .IN2(n55), .QN(n100) );
  NOR2X0 U363 ( .IN1(n330), .IN2(read), .QN(n111) );
  NAND2X1 U364 ( .IN1(n157), .IN2(n268), .QN(n115) );
  NOR2X0 U365 ( .IN1(n321), .IN2(state[0]), .QN(n157) );
  NOR2X0 U366 ( .IN1(n40), .IN2(n330), .QN(n74) );
  NOR2X0 U367 ( .IN1(n61), .IN2(n118), .QN(n171) );
  NOR2X0 U368 ( .IN1(a), .IN2(n310), .QN(n110) );
  NAND2X1 U369 ( .IN1(n271), .IN2(n323), .QN(n198) );
  NAND2X1 U370 ( .IN1(n109), .IN2(n310), .QN(n108) );
  NAND2X1 U371 ( .IN1(b[1]), .IN2(b[0]), .QN(n187) );
  OA21X1 U372 ( .IN1(state[2]), .IN2(n326), .IN3(n178), .Q(n177) );
  INVX0 U373 ( .INP(n268), .ZN(n275) );
  INVX0 U374 ( .INP(nrst), .ZN(n276) );
  MUX41X1 U375 ( .IN1(\memory[0][0] ), .IN3(\memory[2][0] ), .IN2(
        \memory[1][0] ), .IN4(\memory[3][0] ), .S0(N69), .S1(N68), .Q(
        rd_data[0]) );
  MUX41X1 U376 ( .IN1(\memory[0][1] ), .IN3(\memory[2][1] ), .IN2(
        \memory[1][1] ), .IN4(\memory[3][1] ), .S0(N69), .S1(N68), .Q(
        rd_data[1]) );
  MUX41X1 U377 ( .IN1(\memory[0][2] ), .IN3(\memory[2][2] ), .IN2(
        \memory[1][2] ), .IN4(\memory[3][2] ), .S0(N69), .S1(N68), .Q(
        rd_data[2]) );
  MUX41X1 U378 ( .IN1(\memory[0][3] ), .IN3(\memory[2][3] ), .IN2(
        \memory[1][3] ), .IN4(\memory[3][3] ), .S0(N69), .S1(N68), .Q(
        rd_data[3]) );
  MUX41X1 U379 ( .IN1(\memory[0][4] ), .IN3(\memory[2][4] ), .IN2(
        \memory[1][4] ), .IN4(\memory[3][4] ), .S0(N69), .S1(N68), .Q(
        rd_data[4]) );
  MUX41X1 U380 ( .IN1(\memory[0][5] ), .IN3(\memory[2][5] ), .IN2(
        \memory[1][5] ), .IN4(\memory[3][5] ), .S0(N69), .S1(N68), .Q(
        rd_data[5]) );
  MUX41X1 U381 ( .IN1(\memory[0][6] ), .IN3(\memory[2][6] ), .IN2(
        \memory[1][6] ), .IN4(\memory[3][6] ), .S0(N69), .S1(N68), .Q(
        rd_data[6]) );
  MUX41X1 U382 ( .IN1(\memory[0][7] ), .IN3(\memory[2][7] ), .IN2(
        \memory[1][7] ), .IN4(\memory[3][7] ), .S0(N69), .S1(N68), .Q(
        rd_data[7]) );
  MUX41X1 U383 ( .IN1(\memory[0][0] ), .IN3(\memory[2][0] ), .IN2(
        \memory[1][0] ), .IN4(\memory[3][0] ), .S0(N71), .S1(N70), .Q(
        \_4_net_[0] ) );
  MUX41X1 U384 ( .IN1(\memory[0][1] ), .IN3(\memory[2][1] ), .IN2(
        \memory[1][1] ), .IN4(\memory[3][1] ), .S0(N71), .S1(N70), .Q(
        \_4_net_[1] ) );
  MUX41X1 U385 ( .IN1(\memory[0][2] ), .IN3(\memory[2][2] ), .IN2(
        \memory[1][2] ), .IN4(\memory[3][2] ), .S0(N71), .S1(N70), .Q(
        \_4_net_[2] ) );
  MUX41X1 U386 ( .IN1(\memory[0][3] ), .IN3(\memory[2][3] ), .IN2(
        \memory[1][3] ), .IN4(\memory[3][3] ), .S0(N71), .S1(N70), .Q(
        \_4_net_[3] ) );
  MUX41X1 U387 ( .IN1(\memory[0][4] ), .IN3(\memory[2][4] ), .IN2(
        \memory[1][4] ), .IN4(\memory[3][4] ), .S0(N71), .S1(N70), .Q(
        \_4_net_[4] ) );
  MUX41X1 U388 ( .IN1(\memory[0][5] ), .IN3(\memory[2][5] ), .IN2(
        \memory[1][5] ), .IN4(\memory[3][5] ), .S0(N71), .S1(N70), .Q(
        \_4_net_[5] ) );
  MUX41X1 U389 ( .IN1(\memory[0][6] ), .IN3(\memory[2][6] ), .IN2(
        \memory[1][6] ), .IN4(\memory[3][6] ), .S0(N71), .S1(N70), .Q(
        \_4_net_[6] ) );
  MUX41X1 U390 ( .IN1(\memory[0][7] ), .IN3(\memory[2][7] ), .IN2(
        \memory[1][7] ), .IN4(\memory[3][7] ), .S0(N71), .S1(N70), .Q(
        \_4_net_[7] ) );
  MUX21X1 U391 ( .IN1(clk), .IN2(clk2), .S(N10), .Q(clk_sel) );
  XOR2X1 U392 ( .IN1(dev_id[2]), .IN2(byte_data[3]), .Q(n282) );
  XOR2X1 U393 ( .IN1(dev_id[3]), .IN2(byte_data[4]), .Q(n281) );
  NOR2X0 U394 ( .IN1(n289), .IN2(dev_id[0]), .QN(n277) );
  OA22X1 U395 ( .IN1(n277), .IN2(n287), .IN3(byte_data[2]), .IN4(n277), .Q(
        n280) );
  AND2X1 U396 ( .IN1(dev_id[0]), .IN2(n289), .Q(n278) );
  OA22X1 U397 ( .IN1(dev_id[1]), .IN2(n278), .IN3(n278), .IN4(n288), .Q(n279)
         );
  OR4X1 U398 ( .IN1(n282), .IN2(n281), .IN3(n280), .IN4(n279), .Q(n286) );
  XOR2X1 U399 ( .IN1(dev_id[6]), .IN2(byte_data[7]), .Q(n285) );
  XOR2X1 U400 ( .IN1(dev_id[4]), .IN2(byte_data[5]), .Q(n284) );
  XOR2X1 U401 ( .IN1(dev_id[5]), .IN2(byte_data[6]), .Q(n283) );
  NOR4X0 U402 ( .IN1(n286), .IN2(n285), .IN3(n284), .IN4(n283), .QN(N245) );
endmodule

