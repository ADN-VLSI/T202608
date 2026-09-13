interface ctrl_if;

  logic arst_n;
  logic clk;

  task automatic apply_reset(input realtime duration = 100ns);
    arst_n <= '0;
    clk    <= '0;
    #(duration);
    arst_n <= '1;
  endtask

  task automatic start_clock(input realtime timeperiod = 10ns);
    fork
      forever begin
        clk <= '1;
        #(timeperiod / 2);
        clk <= '0;
        #(timeperiod / 2);
      end
    join_none
    @(posedge clk);
  endtask

endinterface
