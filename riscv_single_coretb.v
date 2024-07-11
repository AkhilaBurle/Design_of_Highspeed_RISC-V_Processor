
 module riscv_single_coretb;
    
    reg clk=1'b1,rst;

    riscv_single_core Single_Cycle_Top(
                                .clk(clk),
                                .rst(rst)
    );

    initial begin
        $dumpfile("Single Cycle.vcd");
        $dumpvars(0);
    end

    always 
    begin
        clk = ~ clk;
        #5;  
        
    end
    
    initial
    begin
        rst <= 1'b0;
        #150;

        rst <=1'b1;
        #900;
        $finish;
    end
endmodule