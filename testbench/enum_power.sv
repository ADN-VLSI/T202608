module enum_power;

  
  typedef enum logic [1:0] {
    IDLE  = 2'b00,
    READ  = 2'b01,
    WRITE = 2'b10,
    ERROR = 2'b11
  } state_t;

  
  state_t current_state, next_state;

  
  logic clk;
  logic reset;

  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  
  always_comb begin

    next_state = current_state;

    case (current_state)

      IDLE: begin
        next_state = READ;
      end

      READ: begin
        next_state = WRITE;
      end

      WRITE: begin
        next_state = IDLE;
      end

      ERROR: begin
        next_state = IDLE;
      end

      default: begin
        next_state = ERROR;
      end

    endcase

  end

  
  always_ff @(posedge clk or posedge reset) begin

    if (reset)
      current_state <= IDLE;
    else
      current_state <= next_state;

  end

  
  initial begin

    reset = 1;

    #2;
    reset = 0;

    #50;

    $finish;

  end

  
  always @(posedge clk) begin
    $display("Time=%0t | Current State=%s | Next State=%s",
             $time,
             current_state.name(),
             next_state.name());
  end

endmodule
