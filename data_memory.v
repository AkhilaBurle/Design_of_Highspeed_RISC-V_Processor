module data_memory(a,wd,clk,rst,we,rd);
  input [31:0]a,wd;
  input clk,rst;
  input we;
  output  [31:0]rd;
  
  //Internal memory
  reg[31:0] data_mem[31:0];
  integer i;
  
  
  always@(posedge clk)begin
    
    if(!rst) begin
    for(i=0;i<32;i=i+1) begin  data_mem[i]=32'd0;   end
    end
    
    else begin
      data_mem[a]<=(we==1'b1)?wd:32'd0;
    end
    
  end
  
  assign rd=(we==1'b0)?data_mem[a]:32'd0;
  
endmodule