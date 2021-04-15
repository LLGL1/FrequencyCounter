module Debouncing(
     input iClk,
	  input iArrangement,
	  output[3:0]oSalida 
	  );
	  
reg rSave_Q; 
reg rSave_D;

reg [3:0]rSignal_D;
reg [3:0]rSignal_Q;

reg [3:0]Count_Q = 4'd0;
reg [3:0]Count_D = 4'd0;


	
assign oSalida = rSave_Q;	

always @ (posedge iClk)
begin
	rSave_Q <= rSave_D;	
		 
if(Count_Q < 4)
	begin
	rSignal_D[Count_D] <= iArrangement;
	end
else
	begin
	Count_D = 4'd0;
	end
Count_D = Count_Q + 4'd1;
rSignal_Q <= rSignal_D;
end	 
 
	  
always @ *
 
 if (rSignal_Q == 4'b0000)
   begin
	   rSave_D =4'd0;
   end 
else if (rSignal_Q == 4'b1111)
  begin 
     rSave_D =4'd1;
  end 
 else //if (iArrangement != 4'd0 && iArrangement != 4'd15)
   begin 
	   // lo mantengo en el estado anterior
       rSave_D = rSave_Q; 
	end
 
 endmodule 
	  