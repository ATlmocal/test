`timescale 1ns / 1ps
module testbench ;

reg CLK ;
reg nRST ;
reg [(8*8)-1:0] x = 64'b011111000001110100000111010000010111111110000010000000000100001 ;
wire d3 ;

bq8 bq8(
  .CLK(CLK),
  .nRST(nRST),
  .x(x),
  .d3(d3)
  );

  initial begin
    CLK = 0 ;
    nRST = 1 ;
    #10 nRST = 0 ;
    forever begin
      #10 CLK = ~CLK ;
    end
  end

  initial begin
    $dumpfile("bq8test.vcd") ;
    $dumpvars(0, testbench) ;
  end
endmodule
