module verdic_mul_4b(
input   wire    [3:0] in1,
input   wire    [3:0] in2,
output  wire    [7:0] out
    );
wire [3:0] out_mul1,out_mul2,out_mul3,out_mul4,out_add1,out_add2;
wire c1,c2;
verdic_mul_2b mul1 (in1[1:0],in2[1:0],out_mul1);
verdic_mul_2b mul2 (in1[1:0],in2[3:2],out_mul2);
verdic_mul_2b mul3 (in1[3:2],in2[1:0],out_mul3);
verdic_mul_2b mul4 (in1[3:2],in2[3:2],out_mul4);
adder #(4) add1 (out_mul2,out_mul3,0,out_add1,c1);
adder #(4) add2 (out_add1,{2'b0,out_mul1[3:2]},0,out_add2,c2);
adder #(4) add3 (out_mul4,{1'b0,c1||c2,out_add2[3:2]},0,out[7:4],);
assign out[3:2]=out_add2[1:0];
assign out[1:0]=out_mul1[1:0];
endmodule
