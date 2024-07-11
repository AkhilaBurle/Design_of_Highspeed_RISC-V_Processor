module mux4(a,b,c,sel,d);
  input [31:0]a,b,c;
  input [1:0]sel;
  output reg [31:0]d;
  
  always@(*)begin
    case(sel)
      2'b00:d=a;
      2'b01:d=b;
      2'b10:d=c;
      2'b11:d=0;
    endcase
  end
  
endmodule