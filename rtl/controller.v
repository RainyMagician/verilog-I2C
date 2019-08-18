`timescale 1ns/1ps
module controller(
  input             clk,
  input             nrst,
  input             baud,
  input       [6:0] dev_id,
  input             tx_en,
  input             tx_rd,
  input       [1:0] tx_cnt,
  input       [7:0] tx_data,
  output reg        tx_fail,
  output reg        busy,
  input       [1:0] rd_addr,
  output reg  [7:0] rd_data,
  input             SCL_in,
  input             SDA_in,
  output reg        SCL_out,
  output reg        SDA_out,
  output reg        SCL_tris,
  output reg        SDA_tris
  );
  
  reg [7:0] memory [3:0];
  wire [7:0] mem_sel;
  reg comm_start;
  wire SDA_devid, SDA_write, slave_write, id_done, wr_done, read_done, s_read, slave_wr_done;
  wire [5:0] scl_seq;
  wire start_bit, stop_bit;
  assign scl_seq[1:0] = {SDA_in, SCL_in};
  assign start_bit = scl_seq == 6'b110100;
  assign stop_bit = scl_seq == 6'b000111;
  
  reg master, read;
  wire [1:0] b;
  wire [2:0] byte_count;
  wire [7:0] byte_data;
  wire [7:0] s_byte;
  reg [2:0] ncount;
  assign byte_count = b + 1;
  reg [2:0] state;
  reg delay, start_timing, store;
  reg a;
  reg send_devid, load;
  

  assign mem_sel = master ? byte_data : s_byte;

  always@(*) begin
    rd_data <= memory[rd_addr];
  end

  reg clk2;
  wire clk_sel;
  
  // clk/2
  always@(posedge clk or negedge nrst) begin
    if (!nrst)
      clk2 <= 0;
    else
      clk2 <= ~clk2;
  end
  
  // clock selector
  assign clk_sel = baud&comm_start ? clk2 : clk;
  
  always@(posedge clk_sel or negedge nrst) begin
    if (!nrst)
      comm_start <= 0;
    else
      if ( (tx_en&!comm_start) || start_bit )
        comm_start <= 1;
      else
        if (stop_bit)
          comm_start <= 0;
  end
  
  always@(posedge clk_sel or negedge nrst) begin
    if (!nrst) begin
      master <= 0;
      read <= 0;
    end else begin
      if ( tx_en&!comm_start ) begin
        master <= 1;
        read <= tx_rd;
      end else
        if (stop_bit) begin
          master <= 0;
          read <= 0;
        end else begin
          if (!master && state==3'd0 && a)
            read <= byte_data[0];
        end
    end
  end
  
  reg SDA_reg, SDA_inst;
  wire inst, valid, valid2, valid3;
  assign inst = master&(valid|valid2) || !master&valid3;
  always@(*) begin
    if (inst) begin
      SDA_out <= SDA_inst;
    end else
      SDA_out <= SDA_reg;
  end
  
  always@(*) begin
    if (master)
      case (state)
      3'd0:
          SDA_inst = SDA_devid;
      3'd3:
          SDA_inst = SDA_write;
      default:
          SDA_inst = 1;
      endcase
    else
      case (state)
      3'd5:
        SDA_inst = slave_write;
      default:
        SDA_inst = 1;
      endcase
  end

  always@(posedge clk_sel or negedge nrst) begin
    if (!nrst) begin
      state <= 0;
      delay <= 0;
      start_timing <= 0;
      send_devid <= 0;
      load <= 0;
      store <= 0;
      //SDA_out <= 1;
      SDA_reg <= 1;
      SCL_out <= 1;
      SDA_tris <= 1;
      SCL_tris <= 1;
      tx_fail <= 0;
      busy <= 0;
      ncount <= 0;
      a <= 0;
      memory[0] <= 0;
      memory[1] <= 0;
      memory[2] <= 0;
      memory[3] <= 0;
    end else begin
      if ( tx_en&!comm_start || start_timing ) begin
        busy <= 1;
        SCL_tris <= 0;
        SDA_tris <= 0;
        a <= 0;
        if (!delay) begin
          SDA_reg <= 0;
          SCL_out <= 1;
          delay <= 1;
          start_timing <= 1;
        end else begin
          SDA_reg <= 0;
          SCL_out <= 0;
          delay <= 0;
          start_timing <= 0;
          send_devid <= 1;
        end
      end else begin
        if (comm_start || start_bit) begin
          if (master) begin
            case (state)
            3'd0: // send dev_id
              begin
              SCL_out <= delay;
              // SDA_out <= SDA_devid;
              ncount <= 0;
              if (delay) begin
                a <= id_done;
                delay <= 0;
              end else begin
                send_devid <= 0;
                delay <= 1;
                if (a) begin
                  state <= state + 1;
                  SDA_tris <= 1;
                  SDA_reg <= 1;
                end
              end
              end
            3'd1: // read slave ack
              begin
              if (delay) begin
                SCL_out <= delay;
                delay <= 0;
                a <= SDA_in;
                store <= 1;
              end else begin
                delay <= 1;
                SCL_out <= 0;
                if (a) begin
                  // error
                  state <= 3'd7;
                  tx_fail <= 1;
                  SDA_reg <= 0;
                  // SCL_out <= 0;
                  SDA_tris <= 0;
                end else begin
                  if (read) begin
                    state <= 3'd4;
                    SDA_tris <= 1;
                  end else begin
                    SDA_tris <= 0;
                    // SCL_out <= 0;
                    busy <= 0;
                    if (byte_count == ncount) begin
                      state <= 3'd7;
                      SDA_reg <= 0;
                      // SCL_out <= 0;
                      SDA_tris <= 0;
                    end else begin
                      SDA_reg <= 1;
                      state <= 3'd2;
                    end
                  end
                end
              end
              end
            3'd2: // wait for input data
              begin
              if (tx_en) begin
                state <= state + 1;
                SCL_out <= 0;
                busy <= 1;
                ncount <= ncount + 1;
              end
              end
            3'd3:
              begin
              SCL_out <= delay;
              if (delay) begin
                delay <= 0;
                a <= wr_done;
              end else begin
                delay <= 1;
                if (a) begin
                  state <= 3'd1;
                  SDA_tris <= 1;
                end
              end
              end
            3'd4:
              begin
              SCL_out <= delay;
              if (delay) begin
                delay <= 0;
                a <= read_done;
              end else begin
                store <= 0;
                delay <= 1;
                if (a) begin
                  memory[ncount[1:0]] <= mem_sel;
                  state <= state + 1;
                  ncount <= ncount + 1;
                end
              end
              end
            3'd5:
              begin
              SCL_out <= delay;
              if (delay) begin
                delay <= 0;
                a <= SDA_in;
                if (!SDA_in)
                  store <= 1;
              end else begin
                delay <= 1;
                if (a) begin
                  state <= 3'd7;
                  SDA_tris <= 0;
                  SDA_reg <= 0;
                  //SCL_out <= 0;
                end else begin
                  state <= state - 1;
                end
              end
              end
            default:
              begin
              if (delay) begin
                SCL_out <= 1;
                SDA_reg <= 0;
                delay <= 0;
              end else begin
                SCL_out <= 1;
                SDA_reg <= 1;
                busy <= 0;
                tx_fail <= 0;
              end
              end
            endcase
          end else begin
            SCL_tris <= 1;
            SCL_out <= 1;
            case (state)
            3'd0: // read dev_id
              begin
                ncount <= 0;
                if (delay) begin
                  delay <= 0;
                  a <= read_done;
                end else begin
                  delay <= 1;
                  if (a) begin
                    if (byte_data[7:1] == dev_id) begin
                      SDA_tris <= 0;
                      SDA_reg <= 0;
                      state <= state + 1;
                    end
                  end
                end
              end
            3'd1: // send ack
              begin
                if (delay) begin
                  delay <= 0;
                  if (read) begin
                    load <= 1;
                  end else begin
                    // store <= 1;
                  end
                end else begin
                  delay <= 1;
                  if (read) begin
                    state <= 3'd5;
                    SDA_tris <= 0;
                  end else begin
                    SDA_tris <= 1;
                    SDA_reg <= 1;
                    state <= state + 1;
                  end
                end
              end
            3'd2: // wait for input
              begin
                if (SCL_in)
                  state <= state + 1;
              end
            3'd3: // read from master
              begin
                if (delay) begin
                  delay <= 0;
                  a <= s_read;
                end else begin
                  delay <= 1;
                  // store <= 0;
                  if (a) begin
                    memory[ncount[1:0]] <= mem_sel;
                    state <= state + 1;
                    ncount <= ncount + 1;
                    SDA_tris <= 0;
                    SDA_reg <= 0;
                  end
                end
              end
            3'd4: // send ack
              begin
                if (delay) begin
                  delay <= 0;
                end else begin
                  delay <= 1;
                  SDA_tris <= 1;
                  SDA_reg <= 1;
                  state <= 3'd1;
                end
              end
            3'd5: // send to master
              begin
              if (delay) begin
                delay <= 0;
                a <= slave_wr_done;
                if (slave_wr_done)
                  ncount <= ncount + 1;
              end else begin
                delay <= 1;
                load <= 0;
                if (a) begin
                  state <= state + 1;
                  SDA_tris <= 0;
                  if (byte_count == ncount)
                    SDA_reg <= 1;
                  else
                    SDA_reg <= 0;
                end
              end
              end
            3'd6:
              begin
                if (delay) begin
                  delay <= 0;
                  if (byte_count == ncount) begin
                    SDA_reg <= 1;
                  end else begin
                    SDA_reg <= 0;
                    load <= 1;
                  end
                end else begin
                  delay <= 1;
                  if (byte_count == ncount) begin
                    SDA_tris <= 1;
                    SDA_reg <= 1;
                  end else begin
                    state <= state - 1;
                  end
                end
              end
            default:
              state <= 0;
            endcase
          end
        end else begin
          state <= 0;
          delay <= 0;
          start_timing <= 0;
          send_devid <= 0;
          load <= 0;
          store <= 0;
          SDA_reg <= 1;
          SCL_out <= 1;
          SDA_tris <= 1;
          SCL_tris <= 1;
          tx_fail <= 0;
          busy <= 0;
          ncount <= 0;
          a <= 0;
        end
      end
    end
  end
  
 
  
/*********************
 ***    MODULES    ***
 *********************/
  // save inputs
  partoser DATA (
    .clk(clk_sel),
    .nrst(nrst),
    .load(tx_en&!comm_start),
    .send(send_devid),
    .parallel( {tx_data[6:0], tx_rd} ),
    .serial(SDA_devid),
    .valid(valid),
    .done(id_done)
  );
  
  partoser SEND (
    .clk(clk_sel),
    .nrst(nrst),
    .load(tx_en&comm_start&(!busy)),
    .send(tx_en&comm_start&(!busy)),
    .parallel(tx_data),
    .serial(SDA_write),
    .valid(valid2),
    .done(wr_done)
  );
  
  partoser SLAVE_SEND (
    .clk(clk_sel),
    .nrst(nrst),
    .load(load),
    .send(load),
    .parallel(memory[ncount[1:0]]),
    .serial(slave_write),
    .valid(valid3),
    .done(slave_wr_done)
  );

  sertopar STORE (
    .clk(clk_sel),
    .nrst(nrst&!stop_bit),
    .en(store || start_bit&!master),
    .valid_out(read_done),
    .serial(SDA_in),
    .parallel(byte_data)
  );
  
  sertopar_slave SLAVE (
    .clk(clk_sel),
    .nrst(nrst&!stop_bit),
    .ready((state==3'd2)&!master),
    .trigger(SCL_in),
    .valid_out(s_read),
    .serial(SDA_in),
    .parallel(s_byte)
  );
  
  /* 2'b reg
  * checks if a start/stop bit is sent */
  reg2 BIT_CHECK1 (
    .clk(clk_sel),
    .nrst(nrst),
    .en(1'b1),
    .data_in( {SDA_in, SCL_in} ),
    .data_out(scl_seq[3:2])
  );
  reg2 BIT_CHECK2 (
    .clk(clk_sel),
    .nrst(nrst),
    .en(1'b1),
    .data_in( scl_seq[3:2] ),
    .data_out(scl_seq[5:4])
  );
  
  reg2 CNT_SAVE (
    .clk(clk_sel),
    .nrst(nrst),
    .en( (tx_en&!comm_start) || start_bit&!start_timing ),
    .data_in(tx_cnt),
    .data_out(b)
  );
  
endmodule

module partoser (
  input clk,
  input nrst,
  input load,
  input send,
  input [7:0] parallel,
  output serial,
  output reg valid,
  output reg done
  );
  
  reg [2:0] count;
  reg [7:0] mem;
  reg delay;
  assign serial = mem[7];
  reg a;
    
  always@(posedge clk or negedge nrst) begin
    if (!nrst) begin
      valid <= 0;
      count <= 0;
      mem <= 0;
      done <= 0;
      delay <= 0;
      a <= 0;
    end else begin
      if (!valid) begin
        case( {send, load} )
          2'b11: begin
            mem <= parallel;
            valid <= 1;
          end
          2'b10:
            valid <= 1;
          2'b01:
            mem <= parallel;
          2'b00:
            mem <= mem;
        endcase
        if (a) begin
          done <= 0;
          a <= 1;
        end
      end else begin
        if (delay) begin
          delay <= 0;
          mem <= mem << 1;
          if (&count) begin
            count <= 0;
            valid <= 0;
            delay <= 0;
          end else begin
            count <= count + 1;
            if (count==3'd6)
              done <= 1;
              a <= 1;
          end
        end else begin
          delay <= 1;
        end
      end
    end
  end
endmodule

module sertopar (
  input clk,
  input nrst,
  input en,
  input serial,
  output reg [7:0] parallel,
  output reg valid_out
  );
  
  reg [2:0] count;
  reg delay;
  reg fill;
    
  always@(posedge clk or negedge nrst) begin
    if (!nrst) begin
      valid_out <= 0;
      count <= 0;
      parallel <= 0;
      delay <= 0;
      fill <= 0;
    end else begin
      if (en|fill) begin
        if (delay) begin
          delay <= 0;
          parallel <= {parallel[6:0], serial};
          count <= count + 1;
          if (&count) begin
            count <= 0;
            fill <= 0;
            valid_out <= 0;
          end else begin
            if (count==3'd6)
              valid_out <= 1;
          end
        end else begin
          parallel <= parallel;
          delay <= 1;
          fill <= 1;
        end
      end
    end
  end
endmodule

module sertopar_slave (
  input clk,
  input nrst,
  input ready,
  input serial,
  input trigger,
  output reg [7:0] parallel,
  output reg valid_out
  );
  
  reg [2:0] count;
  reg delay;
  reg fill;
  reg c, en;
  wire z;

  always@(posedge trigger or negedge nrst) begin
    if (!nrst) begin
      c <= 0;
    end else begin
      if (ready) begin
        en <= 1;
        c <= serial;
      end else
        en <= 0;
    end
  end
  
  always@(posedge clk or negedge nrst) begin
    if (!nrst) begin
      valid_out <= 0;
      count <= 0;
      parallel <= 0;
      delay <= 0;
      fill <= 0;
    end else begin
      if (en|fill) begin
        if (delay) begin
          delay <= 0;
          if (en)
            parallel <= {parallel[5:0], {c, serial}};
          else
            parallel <= {parallel[6:0], serial};
          count <= count + 1;
          if (count==3'd6) begin
            count <= 0;
            fill <= 0;
            valid_out <= 0;
          end else begin
            if (count==3'd5)
              valid_out <= 1;
          end
        end else begin
          parallel <= parallel;
          delay <= 1;
          fill <= 1;
        end
      end
    end
  end
endmodule

module reg2 (
  input clk,
  input nrst,
  input en,
  input [1:0] data_in,
  output reg [1:0] data_out
  );
  
  always @(posedge clk or negedge nrst) begin
    if (!nrst)
      data_out <= 0;
    else
      if (en)
        data_out <= data_in;
  end
endmodule
