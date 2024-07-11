module alu(a,b,alucontrol,overflow,carry,negative,zero,result);
  input [31:0]a,b;
  input [2:0]alucontrol;
  output overflow,carry,negative,zero;
  output [31:0]result;
  //Internal wires
  wire [31:0] a_and_b;
  wire [31:0] a_or_b;
  wire [31:0] not_b;
  wire [31:0] mux1;
  wire [31:0]extend;
  wire [31:0]tempadd;
  wire [31:0]tempmul;
   wire [15:0]tempmul1;
  wire cout;
  //operations
  assign a_and_b=a&b;
  assign a_or_b=a|b;
  assign not_b=~b;
  
//logic design
  //mux
  assign mux1=(alucontrol[0]==1'b0)?b:not_b;
  assign {cout,tempadd}=a+mux1+alucontrol[0];
  //adder
  //thirty_two_bit_RCA r1(.a(a),.b(mux1),.cin(alucontrol[0]),.sum(tempadd),.cout(cout));

  
  //Multiplier

assign tempmul= a*b;
//multiplier8array m1(.A(a[7:0]),.B(b[7:0]),.product(tempmul1[15:0]));

  //addition/subtraction operation
  
//  assign {cout,sum}=a+mux1+alucontrol[0];
  
  
  //zero extension
  assign extend={31'd0,tempadd[31]};
  //mux2(4:1)
  assign result=(alucontrol[2:0]==3'b000)?tempadd:
    (alucontrol[2:0]==3'b001)?tempadd:
    (alucontrol[2:0]==3'b010)? a_and_b:
    (alucontrol[2:0]==3'b011)?a_or_b:
    (alucontrol[2:0]==3'd4)?tempmul:
    (alucontrol[2:0]==3'b101)?extend:31'dx;
  
  //flags assignment
  assign negative=result[31];//0 indicatives positive ,1 indicates negative
  assign zero=&(~result);
  assign overflow=(~(alucontrol[0]^a[31]^b[31]))&(a[31]^tempadd[31])&(~alucontrol[1]);
  assign carry=(~alucontrol[1])&(cout);
endmodule