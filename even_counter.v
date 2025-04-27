module tff(t,clk,qn,qnbar);
input t,clk;
output reg qn=0;
output qnbar;
always@(posedge clk) begin
case(t)
1'b0:qn<=qn;
1'b1:qn<=~qn;
endcase
end
assign qnbar = ~qn;
endmodule

module even_counter(clk,qn,qnbar);
input clk;
output [4:1]qn;
output [4:1]qnbar;
assign qnbar=~qn;
wire t1,t2,t3,t4;
assign t4=(qn[3])&(qn[2]);
assign t3=qn[2]&qnbar[1];
assign t2=1;
assign t1=0;
tff tff1(t1,clk,qn[1],qnbar[1]);
tff tff2(t2,clk,qn[2],qnbar[2]);
tff tff3(t3,clk,qn[3],qnbar[3]);
tff tff4(t4,clk,qn[4],qnbar[4]);
endmodule