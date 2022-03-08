`include "dflipflop1.v"
`include "dflipflop2.v"
`include "dflipflop3.v"
module mux4212(a,b,c,d,s1,out);
input [1:0]a,b,c,d;
input [1:0]s1;
output [1:0]out;
assign out[0]=(((~s1[1])&(~s1[0])&a[0])|((~s1[1])&s1[0]&b[0])|(s1[1]&(~s1[0])&c[0])|(s1[1]&s1[0]&d[0]));
assign out[1]=(((~s1[1])&((~s1[0]))&a[1])|(((~s1[1]))&s1[0]&b[1])|(s1[1]&((~s1[0]))&c[1])|(s1[1]&s1[0]&d[1]));
endmodule 


module CLA(a,b,sum);
input [15:0]a,b;
output [15:0]sum; //16 bit 
wire [33:0]kpg;
wire [31:0]rec1;
wire [31:0]rec2;
wire [31:0]rec3;
wire [31:0]rec4;                    
wire [1:0]carry ;             	
wire [16:0]sum_final;

////Stage 0
assign kpg[1:0]=2'b00;
assign kpg[3:2]={a[0],b[0]};
assign kpg[5:4]={a[1],b[1]};
assign kpg[7:6]={a[2],b[2]};
assign kpg[9:8]={a[3],b[3]};
assign kpg[11:10]={a[4],b[4]};
assign kpg[13:12]={a[5],b[5]};
assign kpg[15:14]={a[6],b[6]};
assign kpg[17:16]={a[7],b[7]};
assign kpg[19:18]={a[8],b[8]};
assign kpg[21:20]={a[9],b[9]};
assign kpg[23:22]={a[10],b[10]};
assign kpg[25:24]={a[11],b[11]};
assign kpg[27:26]={a[12],b[12]};
assign kpg[29:28]={a[13],b[13]};
assign kpg[31:30]={a[14],b[14]};
assign kpg[33:32]={a[15],b[15]}; 

wire [33:0] qkpg;   
wire [15:0] qa,qb;
dflipflop2 mod51(kpg[33:0],qkpg,clk,reset); 
dflipflop1 mod52(a,qa,clk,reset);
dflipflop1 mod65(b,qb,clk,reset);

////stage 1
assign rec1[1:0]=qkpg[1:0];
mux4212 mod1(2'b00,qkpg[1:0],qkpg[1:0],2'b11,qkpg[3:2],rec1[3:2]);
mux4212 mod2(2'b00,qkpg[3:2],qkpg[3:2],2'b11,qkpg[5:4],rec1[5:4]);
mux4212 mod3(2'b00,qkpg[5:4],qkpg[5:4],2'b11,qkpg[7:6],rec1[7:6]);
mux4212 mod4(2'b00,qkpg[7:6],qkpg[7:6],2'b11,qkpg[9:8],rec1[9:8]);
mux4212 mod5(2'b00,qkpg[9:8],qkpg[9:8],2'b11,qkpg[11:10],rec1[11:10]);
mux4212 mod6(2'b00,qkpg[11:10],qkpg[11:10],2'b11,qkpg[13:12],rec1[13:12]);
mux4212 mod7(2'b00,qkpg[13:12],qkpg[13:12],2'b11,qkpg[15:14],rec1[15:14]);
mux4212 mod8(2'b00,qkpg[15:14],qkpg[15:14],2'b11,qkpg[17:16],rec1[17:16]);
mux4212 mod9(2'b00,qkpg[17:16],qkpg[17:16],2'b11,qkpg[19:18],rec1[19:18]);
mux4212 mod10(2'b00,qkpg[19:18],qkpg[19:18],2'b11,qkpg[21:20],rec1[21:20]);
mux4212 mod11(2'b00,qkpg[21:20],qkpg[21:20],2'b11,qkpg[23:22],rec1[23:22]);
mux4212 mod12(2'b00,qkpg[23:22],qkpg[23:22],2'b11,qkpg[25:24],rec1[25:24]);
mux4212 mod13(2'b00,qkpg[25:24],qkpg[25:24],2'b11,qkpg[27:26],rec1[27:26]);
mux4212 mod14(2'b00,qkpg[27:26],qkpg[27:26],2'b11,qkpg[29:28],rec1[29:28]);
mux4212 mod15(2'b00,qkpg[29:28],qkpg[29:28],2'b11,qkpg[31:30],rec1[31:30]);      

wire [31:0]qrec1;   
wire [15:0]qa1,qb1;
dflipflop3 mod53(rec1[31:0],qrec1,clk,reset); 
dflipflop1 mod54(qa,qa1,clk,reset);     
dflipflop1 mod64(qb,qb1,clk,reset);

////stage 2
assign rec2[3:0]=qrec1[3:0];
mux4212 mod16(2'b00,qrec1[1:0],qrec1[1:0],2'b11,qrec1[5:4],rec2[5:4]);
mux4212 mod17(2'b00,qrec1[3:2],qrec1[3:2],2'b11,qrec1[7:6],rec2[7:6]);
mux4212 mod18(2'b00,qrec1[5:4],qrec1[5:4],2'b11,qrec1[9:8],rec2[9:8]);
mux4212 mod19(2'b00,qrec1[7:6],qrec1[7:6],2'b11,qrec1[11:10],rec2[11:10]);
mux4212 mod20(2'b00,qrec1[9:8],qrec1[9:8],2'b11,qrec1[13:12],rec2[13:12]);
mux4212 mod21(2'b00,qrec1[11:10],qrec1[11:10],2'b11,qrec1[15:14],rec2[15:14]);
mux4212 mod22(2'b00,qrec1[13:12],qrec1[13:12],2'b11,qrec1[17:16],rec2[17:16]);
mux4212 mod23(2'b00,qrec1[15:14],qrec1[15:14],2'b11,qrec1[19:18],rec2[19:18]);
mux4212 mod24(2'b00,qrec1[17:16],qrec1[17:16],2'b11,qrec1[21:20],rec2[21:20]);
mux4212 mod25(2'b00,qrec1[19:18],qrec1[19:18],2'b11,qrec1[23:22],rec2[23:22]);
mux4212 mod26(2'b00,qrec1[21:20],qrec1[21:20],2'b11,qrec1[25:24],rec2[25:24]);
mux4212 mod27(2'b00,qrec1[23:22],qrec1[23:22],2'b11,qrec1[27:26],rec2[27:26]);
mux4212 mod28(2'b00,qrec1[25:24],qrec1[25:24],2'b11,qrec1[29:28],rec2[29:28]);
mux4212 mod29(2'b00,qrec1[27:26],qrec1[27:26],2'b11,qrec1[31:30],rec2[31:30]); 

wire [31:0]qrec2;   
wire [15:0]qa2,qb2;
dflipflop3 mod55(rec2[31:0],qrec2,clk,reset); 
dflipflop1 mod56(qa1,qa2,clk,reset);
dflipflop1 mod63(qb1,qb2,clk,reset);

///Stage 3 
assign rec3[7:0]=rec2[7:0];
mux4212 mod30(2'b00,qrec2[1:0],qrec2[1:0],2'b11,qrec2[9:8],rec3[9:8]);
mux4212 mod31(2'b00,qrec2[3:2],qrec2[3:2],2'b11,qrec2[11:10],rec3[11:10]);
mux4212 mod32(2'b00,qrec2[5:4],qrec2[5:4],2'b11,qrec2[13:12],rec3[13:12]);
mux4212 mod33(2'b00,qrec2[7:6],qrec2[7:6],2'b11,qrec2[15:14],rec3[15:14]);
mux4212 mod34(2'b00,qrec2[9:8],qrec2[9:8],2'b11,qrec2[17:16],rec3[17:16]);
mux4212 mod35(2'b00,qrec2[11:10],qrec2[11:10],2'b11,qrec2[19:18],rec3[19:18]);
mux4212 mod36(2'b00,qrec2[13:12],qrec2[13:12],2'b11,qrec2[21:20],rec3[21:20]);
mux4212 mod37(2'b00,qrec2[15:14],qrec2[15:14],2'b11,qrec2[23:22],rec3[23:22]);
mux4212 mod38(2'b00,qrec2[17:16],qrec2[17:16],2'b11,qrec2[25:24],rec3[25:24]);
mux4212 mod39(2'b00,qrec2[19:18],qrec2[19:18],2'b11,qrec2[27:26],rec3[27:26]);
mux4212 mod40(2'b00,qrec2[21:20],qrec2[21:20],2'b11,qrec2[29:28],rec3[29:28]);
mux4212 mod41(2'b00,qrec2[23:22],qrec2[23:22],2'b11,qrec2[31:30],rec3[31:30]);

wire [31:0]qrec3;   
wire [15:0]qa3,qb3;
dflipflop3 mod57(rec3[31:0],qrec3,clk,reset); 
dflipflop1 mod58(qa2,qa3,clk,reset);
dflipflop1 mod62(qb2,qb3,clk,reset);



///Stage 4
assign rec4[15:0]=qrec3[15:0];
mux4212 mod42(2'b00,qrec3[1:0],qrec3[1:0],2'b11,qrec3[17:16],rec4[17:16]);
mux4212 mod43(2'b00,qrec3[3:2],qrec3[3:2],2'b11,qrec3[19:18],rec4[19:18]);
mux4212 mod44(2'b00,qrec3[5:4],qrec3[5:4],2'b11,qrec3[21:20],rec4[21:20]);
mux4212 mod45(2'b00,qrec3[7:6],qrec3[7:6],2'b11,qrec3[23:22],rec4[23:22]);
mux4212 mod46(2'b00,qrec3[9:8],qrec3[9:8],2'b11,qrec3[25:24],rec4[25:24]);
mux4212 mod47(2'b00,qrec3[11:10],qrec3[11:10],2'b11,qrec3[27:26],rec4[27:26]);
mux4212 mod48(2'b00,qrec3[13:12],qrec3[13:12],2'b11,qrec3[29:28],rec4[29:28]);
mux4212 mod49(2'b00,qrec3[15:14],qrec3[15:14],2'b11,qrec3[31:30],rec4[31:30]);   

wire [31:0]qrec4;   
wire [15:0]qa4,qb4;
dflipflop3 mod59(rec4[31:0],qrec4,clk,reset); 
dflipflop1 mod60(qa3,qa4,clk,reset); 
dflipflop1 mod61(qb3,qb4,clk,reset);

///Stage 5

assign sum[0] = qa4[0]^qb4[0]^qrec4[0];
assign sum[1] = qa4[1]^qb4[1]^qrec4[2];
assign sum[2] = qa4[2]^qb4[2]^qrec4[4];
assign sum[3] = qa4[3]^qb4[3]^qrec4[6];
assign sum[4] = qa4[4]^qb4[4]^qrec4[8];
assign sum[5] = qa4[5]^qb4[5]^qrec4[10];
assign sum[6] = qa4[6]^qb4[6]^qrec4[12];
assign sum[7] = qa4[7]^qb4[7]^qrec4[14];
assign sum[8] = qa4[8]^qb4[8]^qrec4[16];
assign sum[9] = qa4[9]^qb4[9]^qrec4[18];
assign sum[10] = qa4[10]^qb4[10]^qrec4[20];
assign sum[11] = qa4[11]^qb4[11]^qrec4[22];
assign sum[12] = qa4[12]^qb4[12]^qrec4[24];
assign sum[13] = qa4[13]^qb4[13]^qrec4[26];
assign sum[14] = qa4[14]^qb4[14]^qrec4[28];
assign sum[15] = qa4[15]^qb4[15]^qrec4[30];
//assign carry = rec4[30]^kgp[30];
mux4212 mod50(2'b00,qrec4[31:30],qrec4[31:30],2'b11,qkpg[33:32],carry[1:0]);
assign sum_final={carry[1],sum[15:0]};

endmodule

