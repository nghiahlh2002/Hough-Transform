module verdic_mul_8b(
input   wire    [7:0] in1,
input   wire    [7:0] in2,
output  wire    [15:0] out
    );
wire [7:0] out_mul1,out_mul2,out_mul3,out_mul4,out_add1,out_add2;
wire  c1,c2;
verdic_mul_4b mul1 (in1[3:0],in2[3:0],out_mul1);
verdic_mul_4b mul2 (in1[3:0],in2[7:4],out_mul2);
verdic_mul_4b mul3 (in1[7:4],in2[3:0],out_mul3);
verdic_mul_4b mul4 (in1[7:4],in2[7:4],out_mul4);
adder #(8) add1 (out_mul2,out_mul3,0,out_add1,c1);
adder #(8) add2 (out_add1,{4'b0,out_mul1[7:4]},0,out_add2,c2);
adder #(8) add3 (out_mul4,{3'b0,c1||c2,out_add2[7:4]},0,out[15:8],);
assign out[7:4]=out_add2[3:0];
assign out[3:0]=out_mul1[3:0];
endmodule