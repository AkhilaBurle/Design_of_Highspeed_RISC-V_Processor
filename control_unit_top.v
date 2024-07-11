
module control_unit_top(op,zero,immsrc,regwrite,alusrc,memwrite,resultsrc,pcsrc,branch,funct3,funct7,alucontrol);

  input [6:0]op,funct7;
    input [2:0]funct3;
  input zero;
    output regwrite,alusrc,memwrite,branch,pcsrc;
  output [1:0]immsrc,resultsrc;
  output [2:0]alucontrol;
  wire [1:0]aluop;

   
  
// Instantiate main_decoder module
  main_decoder main_decoder1(
    .op(op),
    .zero(zero),
    .pcsrc(pcsrc),
    .resultsrc(resultsrc),
    .memwrite(memwrite),
    .alusrc(alusrc),
    .immsrc(immsrc),
    .branch(branch),
    .regwrite(regwrite),
    .aluop(aluop)
  );

  // Instantiate alu_decoder module
  alu_decoder alu_decoder1(
    .funct7(funct7),
    .funct3(funct3),
    .aluop(aluop),
    .alucontrol(alucontrol)
  );

endmodule