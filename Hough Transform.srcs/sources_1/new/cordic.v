module cordic(x,cosx,sinx);
input [23:0] x;
output[23:0] cosx,sinx;

reg [23:0] arctan [0:15];

initial begin
  // Gán giá tr? cho m?ng
  arctan[0] = 24'b000000000000000000000000;
  arctan[1] = 24'b000000000000000000000001;
  arctan[2] = 24'b000000000000000000000010;
  arctan[3] = 24'b000000000000000000000011;
  arctan[4] = 24'b000000000000000000000100;
  arctan[5] = 24'b000000000000000000000101;
  arctan[6] = 24'b000000000000000000000110;
  arctan[7] = 24'b000000000000000000000111;
  arctan[8] = 24'b000000000000000000001000;
  arctan[9] = 24'b000000000000000000001001;
  arctan[10] = 24'b000000000000000000001010;
  arctan[11] = 24'b000000000000000000001011;
  arctan[12] = 24'b000000000000000000001100;
  arctan[13] = 24'b000000000000000000001101;
  arctan[14] = 24'b000000000000000000001110;
  arctan[15] = 24'b000000000001000000001110;
end

wire [23:0] xx [0:15];
wire [23:0] yy [0:15];
wire [23:0] zz [0:15];
cordic_layer layer0 ( x ,24'b0,24'b0,arctan[0],0,xx[0],yy[0],zz[0]);
cordic_layer layer1 ( xx[0] ,yy[0],zz[0],arctan[1],1,xx[1],yy[1],zz[1]);
cordic_layer layer2 ( xx[1] ,yy[1],zz[1],arctan[2],2,xx[2],yy[2],zz[2]);
cordic_layer layer3 ( xx[2] ,yy[2],zz[2],arctan[3],3,xx[3],yy[3],zz[3]);
cordic_layer layer4 ( xx[3] ,yy[3],zz[3],arctan[4],4,xx[4],yy[4],zz[4]);
cordic_layer layer5 ( xx[4] ,yy[4],zz[4],arctan[5],5,xx[5],yy[5],zz[5]);
cordic_layer layer6 ( xx[5] ,yy[5],zz[5],arctan[6],6,xx[6],yy[6],zz[6]);
cordic_layer layer7 ( xx[6] ,yy[6],zz[6],arctan[7],7,xx[7],yy[7],zz[7]);
cordic_layer layer8 ( xx[7] ,yy[7],zz[7],arctan[8],8,xx[8],yy[8],zz[8]);
cordic_layer layer9 ( xx[8] ,yy[8],zz[8],arctan[9],9,xx[9],yy[9],zz[9]);
cordic_layer layer10 ( xx[9] ,yy[9],zz[9],arctan[10],10,xx[10],yy[10],zz[10]);
cordic_layer layer11 ( xx[10] ,yy[10],zz[10],arctan[11],11,xx[11],yy[11],zz[11]);
endmodule 

//layer
module cordic_layer(x,y,z,arctan,i,xx,yy,zz);
input [23:0] x,y,z,arctan;
input [3:0] i; // t?ng layer th? i
output[23:0] xx,yy,zz;
wire [23:0] x_shift,y_shift;

right_shifter xs(x,i,x_shift);
right_shifter ys(y,i,y_shift);
addsub #(23) addsubx (x,y_shift,~z[23],xx,);
addsub #(23) addsuby (y,x_shift,z[23],yy,);
addsub #(23) addsubz (z,arctan,~z[23],zz,);
endmodule 

// Shifter
module right_shifter (
  input [23:0] data_in,
  input [3:0] shift_amount,
  output [23:0] data_out
);

  reg [23:0] data_reg;
  reg [3:0] shift_reg;
  reg [23:0] data_out_reg;

  always @(*) begin
    data_reg = data_in;
    shift_reg = shift_amount;
    data_out_reg = 0;
    if (shift_reg > 23) begin
      data_out_reg = 0;
    end else begin
      data_out_reg = data_reg >> shift_reg;
    end
  end

  assign data_out = data_out_reg;

endmodule 