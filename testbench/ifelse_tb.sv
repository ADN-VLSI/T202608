module ifelse_tb(
    input  logic [6:0] marks,
    output logic [1:0] grade
);

    always_comb begin
        if (marks >= 90)
            grade = 2'b11;  // A
        else if (marks >= 75)
            grade = 2'b10;  // B
        else if (marks >= 50)
            grade = 2'b01;  // C
        else
            grade = 2'b00;  // Fail
    end

endmodule
