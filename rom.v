module rom(
   clk_i,
	pin_i,
	rst_i,
	wenable_i,
	pin_o,
	led1_o
);

input wire clk_i;
input wire	rst_i, wenable_i, pin_i;
output reg	led1_o;
output reg [15:0] pin_o;

reg [15:0] stored_key1;

// CASO PRECISE MANIPULAR A stored_key1 E/OU stored_key2
//write = 1
always @(posedge clk_i or posedge rst_i) 
begin
   if (rst_i) begin
     stored_key1 <= 16'b0;
   end else if (wenable_i) begin
     stored_key1 <= pin_i;
   end
end


always @(posedge clk_i) begin
   pin_o <= stored_key1;
end


always @(posedge clk_i) begin
	if (stored_key1 == 16'b0)
		led1_o <= 1;
	else
		led1_o <= 0;
end


endmodule

