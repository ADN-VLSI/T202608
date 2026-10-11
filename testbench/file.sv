module file;
int fd;
logic [3:0] mem [8];

initial begin
    fd = $fopen("log.txt", "w");
    $display("value of fd %d", fd);

    $fdisplay(fd, "Simulation started ");
    #100;
    $fdisplay(fd, "Simulation Started Time: %t", $time);
    $fwrite (fd, "Val1: %h ", 'h12);
    $fwrite (fd, "Val2: %h ", 'h34);
    $fwrite (fd, "Val3: %h ", 'h56);

    $fdisplay(fd, "Atiya + Chaity ");
    $fdisplay(fd, "Value");

    $fclose(fd);

    $readmemb("/projects/atiya/T202608/testbench/mem.bin", mem);

    foreach(mem[i]) begin
        $display("Value of mem[%d] = %b", i, mem[i]);
    end

end

endmodule