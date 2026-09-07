module casez_ex (
  input  logic [3:0] request,
  output logic [1:0] source
);
  initial begin
    casez (request)
      4'b1???: begin source = 2'd3; $display("Matched:1???"); end // Any request beginning with 1
      4'b01??: begin source = 2'd2; $display("Matched:01??"); end// Any request from source 01
      4'b001?: begin source = 2'd1; $display("Matched:001?"); end// Any request from source 001
      default: begin source = 2'd0; $display("Matched:default"); end
    endcase
  end
endmodule
