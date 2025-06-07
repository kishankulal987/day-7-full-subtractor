`timescale 1ns / 1ps

module full_subtractor(input a,b,bin,output d,bout);
xor x1(d,a,b,bin);
//borrow expression (~ab)+(~a+b)bin
wire na,t0,t1,t2;
not n1(na,a);
and a1(t0,na,b);
and a2(t2,t1,bin);
or o1(t1,na,b);
or o2(bout,t0,t2);
endmodule

module testbench_sub();
reg a,b,bin;
wire d,bout;
full_subtractor m1(a,b,bin,d,bout);
initial begin
$monitor("a=%b b=%b bin=%b d=%b bout=%b",a,b,bin,d,bout);
for(integer i=0;i<8;i=i+1)
begin
{a,b,bin}=i;
#10;
end
$finish;
end
endmodule

