module BCD#(parameter N=7)(
input iClk,
input [3:0] iBCD,
output [N-1:0] oSeg
);

reg [N-1:0]rsalida_D;
reg [N-1:0]rsalida_Q;

assign oSeg=rsalida_Q; 

always @(posedge iClk )
begin
     rsalida_Q <= rsalida_D;

end 

always @ *
begin
case (iBCD)
4'd0 : rsalida_D = 7'b0000001;
4'd1 : rsalida_D = 7'b1001111;
4'd2 : rsalida_D = 7'b0010010;
4'd3 : rsalida_D = 7'b0000110;
4'd4 : rsalida_D = 7'b1001100;
4'd5 : rsalida_D = 7'b0100100;
4'd6 : rsalida_D = 7'b0100000;
4'd7 : rsalida_D = 7'b0001111;
4'd8 : rsalida_D = 7'b0000000;
4'd9 : rsalida_D = 7'b0000100;
default : rsalida_D = 7'b1111111;
endcase
end

endmodule 