module alu_4bit (
    input  wire [3:0] A,
    input  wire [3:0] B,
    input  wire [2:0] ALU_SEL,

    output reg  [3:0] RESULT,
    output reg        CARRY,
    output reg        ZERO
);

always @(*) begin

    // Default values
    RESULT = 4'b0000;
    CARRY  = 1'b0;

    case (ALU_SEL)

        3'b000: begin
            // Addition
            {CARRY, RESULT} = A + B;
        end

        3'b001: begin
            // Subtraction
            RESULT = A - B;
        end

        3'b010: begin
            // AND
            RESULT = A & B;
        end

        3'b011: begin
            // OR
            RESULT = A | B;
        end

        3'b100: begin
            // XOR
            RESULT = A ^ B;
        end

        3'b101: begin
            // NOT A
            RESULT = ~A;
        end

        3'b110: begin
            // Increment A
            RESULT = A + 1'b1;
        end

        3'b111: begin
            // Decrement A
            RESULT = A - 1'b1;
        end

        default: begin
            RESULT = 4'b0000;
            CARRY  = 1'b0;
        end

    endcase

    // Zero flag
    if (RESULT == 4'b0000)
        ZERO = 1'b1;
    else
        ZERO = 1'b0;

end

endmodule
