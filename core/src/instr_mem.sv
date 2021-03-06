import definitions::*;

// A synchronous instruction memory
module instr_mem #(
        parameter addr_width_p = 10
    )
    (
        input clk,
        input [addr_width_p-1:0] addr_i,
        input instruction_s instruction_i,
        input wen_i,
        output instruction_s instruction_o
    );

    instruction_s [0:(2**addr_width_p)-1] mem;
    
    always_ff @ (posedge clk)
        begin
        if (wen_i)
            begin
            mem[addr_i] <= instruction_i;
        end
        
        instruction_o <= mem[addr_i];
    end
    
endmodule
