module addsub #(parameter N=4) (a,b,ctrl,s,c); //ctrl 0=add 1=sub
input [N-1:0] a,b;
input ctrl;
output[N-1:0] s;
output  c;

adder #(N) add(a,b^{N{ctrl}},ctrl,s,c);
endmodule 
