`include "pcla.v" 

module pcla_tb;
reg [15:0] a,b; 
wire [1:0]carry;
wire [16:0]sum_final;
reg clk,reset;
CLA mod1(a,b,carry,sum_final,clk,reset);
initial
begin
$dumpfile("a1t.vcd");
$dumpvars(0,pcla_tb);
reset=1'b0; 
clk=1'b0;
a = 16'b0110101010011000;
b = 16'b0010101010011010;

#2
a = 16'b1101010100110100;
b = 16'b1101010000110101;

#2
a = 16'b1101010100111100;
reset=1'b0;

#2
b = 16'b1111110100110101;
reset=1'b0;
 
end
always
begin
#1 clk=~clk; 

end
always
begin
#60
$finish;
end  

initial
$monitor($time," a=%d,b=%d,carry=%b,sum_final=%d",a,b,carry[0],sum_final);
endmodule