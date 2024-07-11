module programme_counter(pc_next,rst,clk,pc);
  input [31:0]pc_next;
  input clk,rst;
  output reg [31:0]pc;
  
  always@(posedge clk)begin
    if(!rst) begin    pc<=32'd0;  end
    else begin      pc<=pc_next;   end
  end
  
endmodule