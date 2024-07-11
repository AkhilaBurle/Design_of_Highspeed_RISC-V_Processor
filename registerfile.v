module registerfile(a1,a2,a3,we3,clk,rst,rd1,rd2,wd3);
  input [4:0]a1,a2,a3;
  input we3,clk,rst;
  input [31:0]wd3;
  output [31:0]rd1,rd2;
 integer i;
  //Internal memory
  reg [31:0] registers[31:0];
//  always@(posedge clk)begin
//    if(!rst) begin 
//      for(i=0;i<32;i=i+1) begin
//      registers[i]=0;
//      end
//    end
   
//    else begin  
////      rd1<=registers[a1];  
////      rd2<=registers[a2];  
//      registers[a3]<=(we3==1'b1)?wd3:32'd0;
//    end
    
//  end
  
  always @ (posedge clk)
    begin
        if(!rst) begin 
             for(i=0;i<32;i=i+1) begin  registers[i]=0;  end
         end
      else begin
        if(we3)  registers[a3] <= wd3;
        end
    end
    
assign rd1 = (!rst) ? 32'd0 : registers[a1];
assign rd2 = (!rst) ? 32'd0 : registers[a2];
//assign registers[a3]=(we3==1)?wd3:32'd0;
  
  
  
endmodule