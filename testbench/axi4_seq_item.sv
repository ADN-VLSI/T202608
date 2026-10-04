class axi_seq_item;

  // Trasaction size shall be (2**SIZE) * (len + 1)
  //                               3        8

  // address shall be the multiple of 2^SIZE in case of wrap burst only
  // len shall be 1, 3, 7, 15 in case of wrap burst only
  // Transaction shall not cross 4KB boundary
  // burst shall be 0, 1, 2 only

  rand logic               tp;
  rand logic [   3:0]      id;
  rand logic [  31:0]      addr;   // TODO CONSTRAINT 
  rand logic [   7:0]      len;    // TODO CONSTRAINT
  rand logic [   2:0]      size;   // TODO CONSTRAINT
  rand logic [   1:0]      burst;  // TODO CONSTRAINT
  rand logic [4095:0][7:0] wdata;

  constraint c_burst {
    burst inside {0,1,2};
    // burst == 0 ---->  Fixed 
    // burst == 1 ---->  Incr. 
    // burst == 2 ---->  Wrap
    }
  constraint c_size {
         size <= 3;     // 64 bit data bus  
  }

  constraint c_len {
    if (burst == 2){
        len inside {1,3,7,15};

    }
    if (burst==0) {
        len <= 15;
    }
  }

  constraint c_add {
    if (burst == 2) {
        addr % (2 ** size) == 0;
}
  }

  constraint c_4kb {
    if (burst==1){
        (addr % 4096) + ((int'(len) + 1) * (1<<size)) <= 4096; //1<<size
    }
    if (burst == 0){
        (addr % 4096) + (1<<size)<= 4096;   
    }
  }

  function automatic void print();

        $display("tp = %b || id = %b || addr = %b || len = %d size = %d || burst = %d ||",tp,id,addr,len,size,burst);



  endfunction


endclass


module tb;
    axi_seq_item ax;
    initial begin
        ax = new();

        repeat(15) begin
            ax.randomize();
            ax.print();


        end


    end


endmodule
