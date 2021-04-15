module PeriodCounter (
	input iClk,
	input iRst,
	input iSignal,
	output [3:0] oCycles
);

reg [13:0]rCycles_D;
reg [13:0]rCycles_Q;

reg [1:0]rSignal_D;
reg [1:0]rSignal_Q;

reg [3:0]Count_Q = 4'd0;
reg [3:0]Count_D = 4'd0;

always @ (posedge iClk)
begin
if(iRst)
	begin
	rCycles_Q <= rCycles_D;
	end
else if(Count_Q < 4)
	begin
	rSignal_D[Count_D] <= iSignal;
	end
else
	begin
	Count_D = 4'd0;
	end
Count_D = Count_Q + 4'd1;
rSignal_Q <= rSignal_D;
end

always @ *
begin
	if(rSignal_Q[0] == 2'b0 & rSignal_Q[1] == 2'b1) //flancos de reloj 
		begin
			if(rCycles_D > 14'd9999)
			begin // agregar un valor a nuestra variable 
			rCycles_D = 14'd10000;
			end
			else
			begin
			rCycles_D = rCycles_Q + 14'd1;
			end
		end
	else
		begin
		rCycles_D = rCycles_Q;
		end
end
endmodule

/*rFrec_D = 1/((rT_Q)*(0.0000000002));
	
	rCentenas_D = rFrec_Q/100;
	rDecenas_D = (rFrec_Q - (rCentenas_Q*100))/10;
	rUnidades_D = (rFrec_Q - (rCentenas_Q*100) - rDecenas_Q*10);*/
	
	