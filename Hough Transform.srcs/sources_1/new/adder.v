module adder #(parameter N=4) (
input [N-1:0] a,b,
input c_in,
output[N-1:0] s,
output  c_out
);
wire [N-2:0] c;
FA full_adder [N-1:0] (a,b,{c[N-2:0],c_in},s,{c_out,c[N-2:0]});
endmodule 
module FA(a,b,c_in,s,c_out);
input   a,b,c_in;
output  s,c_out;
wire s0,c0,c1;
HA ha1(a,b,s0,c0);
HA ha2(s0,c_in,s,c1);
assign c_out=c1||c0;
endmodule 