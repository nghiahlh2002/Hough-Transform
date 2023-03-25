module verdic_mul_2b(
input   wire    [1:0] in1,
input   wire    [1:0] in2,
output  wire    [3:0] out
    );
wire carry;           
assign out[0]=in1[0]&in2[0];
HA ha1 (in1[0]&in2[1],in1[1]&in2[0],out[1],carry); // a,b,s,c
HA ha2 (in1[1]&in2[1],carry,out[2],out[3]);
endmodule

module HA (
input a,b,
output s,c
);
assign  s=a^b;
assign  c=a&b;
endmodule 