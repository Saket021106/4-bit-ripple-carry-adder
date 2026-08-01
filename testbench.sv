module tb_binary_adder;

  // Testbench signals
  reg [3:0] A;
  reg [3:0] B;
  reg Cin;
  
  wire [3:0] Cout;
  wire [3:0] Sum;

  // Instantiate the Device Under Test (DUT)
  binary_adder dut (
    .A(A),
    .B(B),
    .Cin(Cin),
    .Cout(Cout),
    .Sum(Sum)
  );

  initial begin
    // Setup waveform dumping (useful if you are using EDA Playground or GTKWave)
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_binary_adder);

    // Monitor changes and print them to the console automatically
    $monitor("Time=%0t | Cin=%b A=%b B=%b | Sum=%b Cout=%b (Final Carry=%b)", 
             $time, Cin, A, B, Sum, Cout, Cout[3]);

    // -------------------------------------------------
    // Apply Test Vectors
    // -------------------------------------------------
    
    // Test 1: Initialize at zero
    A = 4'b0000; B = 4'b0000; Cin = 1'b0;
    #10;
    
    // Test 2: Simple addition without carry over (1 + 2 = 3)
    A = 4'b0001; B = 4'b0010; Cin = 1'b0;
    #10;
    
    // Test 3: Ripple carry effect (7 + 1 = 8)
    A = 4'b0111; B = 4'b0001; Cin = 1'b0;
    #10;
    
    // Test 4: Maximum 4-bit addition triggering final carry out (15 + 1 = 16)
    // Sum should be 0000, Cout[3] should be 1
    A = 4'b1111; B = 4'b0001; Cin = 1'b0;
    #10;
    
    // Test 5: Testing initial Carry In (10 + 5 + 1 = 16)
    // Sum should be 0000, Cout[3] should be 1
    A = 4'b1010; B = 4'b0101; Cin = 1'b1;
    #10;
    
    // Test 6: Maximum possible value (15 + 15 + 1 = 31)
    // Sum should be 1111, Cout[3] should be 1
    A = 4'b1111; B = 4'b1111; Cin = 1'b1;
    #10;

    // End simulation
    $finish;
  end

endmodule
