module alu_decoder(
  input  [6:0]funct7,
  input [2:0] funct3,
  input [1:0] aluop,
  output reg [2:0] alucontrol
);
   always @(*) begin
    
    if (aluop == 2'b00) begin
      alucontrol <= 3'b000;
    end
    
    else if (aluop == 2'b01) begin
      alucontrol <= 3'b001;  
    end
    
    else if (aluop == 2'b10) begin
               if (funct3 == 3'b000) begin
//                 if (concat == 2'b00 | concat == 2'b01) begin alucontrol <= 3'b000; end
//                 else if(concat == 2'b10) begin alucontrol<=3'b100; end
//                              else begin alucontrol <= 3'b001;  end
                   if(funct7==7'b0000001)  begin alucontrol<=3'b100;  end //multiply
                   else if(funct7==7'b00000)  begin alucontrol<=3'b000;  end //add
                   else if(funct7==7'b0100000)  begin alucontrol<=3'b001;  end //sub
                   else begin alucontrol<=3'b000; end
                end
      
                else if (funct3 == 3'b010) begin
                alucontrol <= 3'b101;  
                   end
      
                else if (funct3 == 3'b110) begin
                 alucontrol <= 3'b011; 
                  end
      
                else if (funct3 == 3'b111) begin
                 alucontrol <= 3'b010;      
                   end
      
              else begin
         alucontrol <= 3'b000;
                 end
      
    end
    
    else begin   
      alucontrol <= 3'b000;
    end
  end
endmodule