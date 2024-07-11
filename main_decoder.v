module main_decoder(op,zero,pcsrc,resultsrc,memwrite,alusrc,immsrc,branch,regwrite,aluop);
 input zero;
  input [6:0]op;
  output   pcsrc;
  output reg memwrite,alusrc,regwrite;
  output reg [1:0]resultsrc;
  output reg [1:0]immsrc;  
  output reg [1:0]aluop;
 output reg branch;
  reg jump;
  
  always@(*)begin
    
    if(op==7'b0000011) begin // lw I type
      regwrite<=1'b1;
      immsrc<=2'b00;
      alusrc<=1'b1;
      memwrite<=1'b0;
      resultsrc<=2'b01;
      branch<=1'b0;
      aluop<=2'b00;
      jump<=1'b0;
    // pcsrc<=1'b0;
    end
    
    else if(op==7'b0100011)begin //S type 
       regwrite<=1'b0;
      immsrc<=2'b01;
      alusrc<=1'b1;
      memwrite<=1'b1;
      resultsrc<=2'b00;
      branch<=1'b0;
      aluop<=2'b00;
      jump<=1'b0;
  //   pcsrc<=1'b0;
    end
    
    else if(op==7'b0110011)begin //R type
           regwrite<=1'b1;
      immsrc<=2'b00;
      alusrc<=1'b0;
      memwrite<=1'b0;
      resultsrc<=2'b00;
      branch<=1'b0;
      aluop<=2'b10;
      jump<=1'b0;
    //   pcsrc<=1'b0;
    end
    
    else if(op==7'b1100011)begin  //branch if equal
      regwrite<=1'b0;
      immsrc<=2'b10;
      alusrc<=1'b0;
      memwrite<=1'b0;
      resultsrc<=2'b00;
      branch<=1'b1;
      aluop<=2'b01;
      jump<=1'b0;
  //    pcsrc<=1'b1;
    end
    
    else if(op==7'b0010011) begin //I type addi
    regwrite<=1'b1;
      immsrc<=2'b00;
      alusrc<=1'b1;
      memwrite<=1'b0;
      resultsrc<=2'b00;
      branch<=1'b0;
      aluop<=2'b00;
      jump<=1'b0;
   //   pcsrc<=1'b0;
     end   
    
    
    else if(op==7'b1101111) begin //jump instruction
    regwrite<=1'b1;
      immsrc<=2'b11;
      alusrc<=1'b1;
      memwrite<=1'b0;
      resultsrc<=2'b10;
      branch<=1'b0;
      aluop<=2'b00;
      jump<=1'b1;
    //  pcsrc<=1'b1;
     end   
    
    else begin
     regwrite<=1'b0;
      immsrc<=2'b00;
      alusrc<=1'b0;
      memwrite<=1'b0;
      resultsrc<=2'b00;
      branch<=1'b0;
      aluop<=2'b00;
      jump<=1'b0;
  //    pcsrc<=1'b0;
    end
    
  end
  
  assign pcsrc=((zero&branch)|jump);
  
endmodule