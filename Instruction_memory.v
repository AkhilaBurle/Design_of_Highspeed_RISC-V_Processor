module Instruction_memory(a, rst, rd);

  input [31:0] a;
  input rst;  
  output reg [31:0] rd;
integer i;
  // Internal memory
  reg [31:0] mem[31:0]; // Memory of size 32 with each word of length 32

  always@(*) begin
  rd<=32'h0;
    if (!rst) begin
      for (i=0; i<32; i=i+1) begin
        mem[i] <= 32'd0;
      end
    end else begin
      case (a)
        32'd0: rd <= 32'h00800113;
        32'd4: rd <= 32'h00400093;
        32'd8: rd <= 32'h002081b3;
        32'd12: rd <= 32'h40208233;
        32'd16: rd <= 32'h022082b3;
        
//        32'd0: rd <= 32'h01800493;
//32'd4: rd <= 32'h00600293;
//32'd8: rd <= 32'h00a00393;
//32'd12: rd <= 32'hfe74ae23;
//32'd16: rd <= 32'hffc4a303;
//32'd20: rd <= 32'h00638463;
//32'd24: rd <= 32'h00638133;
//32'd28: rd <= 32'hfe9ff0ef;
        default: rd <= 32'h0;
      endcase
    end
  end

endmodule