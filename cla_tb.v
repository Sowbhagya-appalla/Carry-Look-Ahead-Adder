`include "cla.v" 
//`include "ff1_tb.v" 
//`include "ff2_tb.v"
//`include "ff3_tb.v"

module cla_tb;
reg [15:0] a,b; 
wire [15:0] sum;
wire [1:0]carry;
wire [33:0]kpg;
wire [16:0]sum_final;
wire [31:0]rec1;
wire [31:0]rec2;
wire [31:0]rec3;
wire [31:0]rec4;
CLA mod1(a,b,carry,sum,sum_final,kpg,rec1,rec2,rec3,rec4);
initial
begin
$dumpfile("a1t.vcd");
$dumpvars(0,cla_tb);
a = 16'b0110101010011000;
b = 16'b0010101010011010;


#2
a = 16'b1101010100110100;
b = 16'b1101010100110101;

#4 
a = 16'b1101010100111100;

#6
b = 16'b1111110100110101;


end
 always
 begin
#9 
$finish;
end  

initial
$monitor($time," a=%d,b=%d,carry=%b,sum=%d,sum_final=%d",a,b,carry[0],sum,sum_final);
endmodule