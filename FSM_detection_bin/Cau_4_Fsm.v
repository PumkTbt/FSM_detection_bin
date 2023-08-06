module Cau_4_Fsm(ck,rs, data,y1,y2);
parameter start = 3'b000;
parameter s1 = 3'b001;
parameter s11 = 3'b010;
parameter s10 = 3'b001;
parameter s110 = 3'b011;
parameter s101 = 3'b100;
parameter s1100 = 3'b101; 
parameter s1011 = 3'b110; 
input ck,rs,data;
output y1,y2;
reg [2:0]bandau, ketiep;
reg y1,y2;
always @(*)
begin 
case (bandau)
start: 
begin
	if (data) ketiep = s1;
	else ketiep = bandau;
end
s1: 
begin
	if (data) ketiep = s11;
	else ketiep = s10;
end	
s11: 
begin
	if (!data) ketiep = s110;
	else ketiep = bandau;
end	
s10: 
begin
	if (data) ketiep = s101;
	else ketiep = start;
end	
s110: 
begin
	if (!data) ketiep = s1100;
	else ketiep = s101;
end	
s1100: 
begin
	if (data) ketiep = s1;
	else ketiep = start;
end	
s101: 
begin
	if (data) ketiep = s1011;
	else ketiep = s10;
end	
 s1011: 
begin
	if (data) ketiep = s11;
	else ketiep = s110;
end	
 default: ketiep = start;	
endcase
end
always @(posedge ck)
begin
if (rs) bandau <= start;
else bandau <= ketiep;
end
always @(*)
begin
if (bandau == s1100)
	y2 = 1'b1;
else
	y2 = 1'b0;
if (bandau == s1011)
	y1 = 1'b1;	
else
	y1 = 1'b0;
end  endmodule