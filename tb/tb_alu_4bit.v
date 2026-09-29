`timescale 1ns/1ps

module tb_alu_4bit;

    reg  [3:0] A;
    reg  [3:0] B;
    reg  [2:0] ALU_SEL;

    wire [3:0] RESULT;
    wire       CARRY;
    wire       ZERO;

    alu_4bit DUT (
        .A(A),
        .B(B),
        .ALU_SEL(ALU_SEL),
        .RESULT(RESULT),
        .CARRY(CARRY),
        .ZERO(ZERO)
    );

    initial begin

        $display("========================================");
        $display("        4-BIT ALU TESTBENCH");
        $display("========================================");

        // Addition: 5 + 3 = 8
        A = 4'd5;
        B = 4'd3;
        ALU_SEL = 3'b000;
        #10;
        $display("ADD : A=%d B=%d RESULT=%d CARRY=%b",
                 A, B, RESULT, CARRY);

        // Subtraction: 7 - 2 = 5
        A = 4'd7;
        B = 4'd2;
        ALU_SEL = 3'b001;
        #10;
        $display("SUB : A=%d B=%d RESULT=%d",
                 A, B, RESULT);

        // AND
        A = 4'b1100;
        B = 4'b1010;
        ALU_SEL = 3'b010;
        #10;
        $display("AND : RESULT=%b", RESULT);

        // OR
        ALU_SEL = 3'b011;
        #10;
        $display("OR  : RESULT=%b", RESULT);

        // XOR
        ALU_SEL = 3'b100;
        #10;
        $display("XOR : RESULT=%b", RESULT);

        // NOT A
        ALU_SEL = 3'b101;
        #10;
        $display("NOT : RESULT=%b", RESULT);

        // Increment
        A = 4'd5;
        ALU_SEL = 3'b110;
        #10;
        $display("INC : A=%d RESULT=%d",
                 A, RESULT);

        // Decrement
        A = 4'd5;
        ALU_SEL = 3'b111;
        #10;
        $display("DEC : A=%d RESULT=%d",
                 A, RESULT);

        // Zero flag test
        A = 4'd0;
        B = 4'd0;
        ALU_SEL = 3'b000;
        #10;
        $display("ZERO FLAG TEST : RESULT=%d ZERO=%b",
                 RESULT, ZERO);

        $display("========================================");
        $display("          TEST COMPLETED");
        $display("========================================");

        $finish;

    end

endmodule
