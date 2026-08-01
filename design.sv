module binary_adder (
  input [3:0] A,
  input [3:0] B,
  input Cin,
  output [3:0] Cout,
  output [3:0] Sum
);
  
  genvar i;
  
  generate
    for(i = 0; i < 4; i = i + 1) begin : adder_chain
      if(i == 0) begin
        full_adder FA (
          .a(A[i]),
          .b(B[i]),
          .cin(Cin),
          .cout(Cout[i]),
          .sum(Sum[i])
        );
      end else begin
        full_adder FA (
          .a(A[i]),
          .b(B[i]),
          .cin(Cout[i-1]),
          .cout(Cout[i]),
          .sum(Sum[i])
        );
      end
    end
  endgenerate
  
endmodule

module full_adder (
  input a,
  input b,
  input cin,
  output cout,
  output sum
);
  
  wire ha1_sum, ha1_carry;
  wire ha2_carry;
  
  half_adder HA1 (
    .a(a),
    .b(b),
    .sum(ha1_sum),
    .carry(ha1_carry)
  );
  
  half_adder HA2 (
    .a(ha1_sum),
    .b(cin),
    .sum(sum),
    .carry(ha2_carry)
  );
  
  assign cout = ha1_carry | ha2_carry;
  
endmodule

module half_adder (
  input a,
  input b,
  output carry,
  output sum
);
  
  assign sum = a ^ b;
  assign carry = a & b;
  
endmodule
