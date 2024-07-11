
module riscv_single_core(clk,rst,overflow,carry,negative,branch);
  input clk,rst;
  output  overflow,carry,negative,branch;
//wires  
  wire [31:0]pctop,rdtop,rd1top,Immexttop,aluresulttop,readdata,pcnext,rd2top,srcb,result,pcplus4,pctar1;
wire [2:0]alucontroltop;
wire regwrite,memwrite,zero,alusrc,pcsrc;
  wire [1:0]immsrc,resultsrc;
  wire [4:0]a1,a2;
  wire [4:0]a3;
  wire [31:7]extendin;
  wire [6:0]op;
  wire [14:12]funct3;
  wire [31:25]funct7;
  assign a1=rdtop[19:15];
  assign a2=rdtop[24:20];
  assign a3=rdtop[11:7];
  assign extendin=rdtop[31:7];
  assign op=rdtop[6:0];
  assign funct3=rdtop[14:12];
  assign funct7=rdtop[31:25];
  
  programme_counter programme_counter1(
    .pc_next(pcnext),
    .rst(rst),
    .clk(clk),
    .pc(pctop)
  );
  
   pc_adder pcadder1(
    .a(pctop),
    .b(32'd4),
    .c(pcplus4)
   );
   
   mux programmcounter_and_pcsrc(
     .a(pcplus4),
    .b(pctar1),
    .s(pcsrc),
    .c(pcnext)
  );

   Instruction_memory Instruction_memory1(
    .a(pctop),
    .rst(rst),
    .rd(rdtop)
  );
  
 
  registerfile registerfile1(
    .a1(a1),
    .a2(a2),    //24:20
    .a3(a3),
    .we3(regwrite),
    .clk(clk),
    .rst(rst),
    .rd1(rd1top),
    .rd2(rd2top),
    .wd3(result)
  );
  

  
  extend extend1(
    .in(extendin),
    .immsrc(immsrc),
    .Immext(Immexttop)
  );
  
  alu alu1(
    .a(rd1top),
    .b(srcb),
    .alucontrol(alucontroltop),
    .overflow(overflow),
    .carry(carry),
    .negative(negative),
    .zero(zero),
    .result(aluresulttop)
  );
  
    mux mux_registerfile_to_alu(
    .a(rd2top),
    .b(Immexttop),
    .s(alusrc),
    .c(srcb)
  );
   
  
  control_unit_top control_unit_top1(
    .op(op),
    .zero(zero),
    .pcsrc(pcsrc),
    .immsrc(immsrc),
    .regwrite(regwrite),
    .alusrc(alusrc),
    .memwrite(memwrite),
    .resultsrc(resultsrc),
    .branch(branch),
    .funct3(funct3),
    .funct7(funct7),
    .alucontrol(alucontroltop)
  );
  
  data_memory datamemory1(
    .a(aluresulttop),
    .wd(rd2top),
    .clk(clk),
    .rst(rst),
    .we(memwrite),
    .rd(readdata)
  );
  
  
    mux4 mux_datamemory_to_registerfile(
    .a(aluresulttop),
    .b(readdata),
    .c(pcplus4),
    .sel(resultsrc),
    .d(result)
  );
  
  pctarget pctarget1(
   .PC(pctop),
   .ImmExt(Immexttop),
   .Pctarget1(pctar1)
  );
  
   
  
  endmodule