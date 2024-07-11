module pctarget(input [31:0]PC,ImmExt,
output [31:0]Pctarget1
    );
   
    assign Pctarget1=PC+ImmExt;
    
endmodule