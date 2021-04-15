module DivF(
   input iClk,
	input irst,
   output oSalidas	  
	 );
	 
reg rSalidaQ_div;
reg rSalidaD_div;

//reg rSalida_div = 1'b0;
reg [25:0] rBitsQ;
reg [25:0] rBitsD;

assign oSalidas = rSalidaQ_div;


always @(posedge iClk)
begin
    if (!irst)
	 begin
	   rSalidaQ_div= 1'd0;//reset 
	   rBitsQ <= 1'd0;
	 end 
	 else
    begin
    rSalidaQ_div <= rSalidaD_div;
	 rBitsQ <= rBitsD;
	 end 
end 


always @ *
begin 
     if (rBitsQ==26'd50_000_000)
	  begin 
	    rSalidaD_div = 1'b1; // corra a uno  
	    rBitsD=26'd0; // reset 
	  end 
	  else 
	  begin 
	    rBitsD=rBitsQ + 1'b1; // sumando 
		 rSalidaD_div=  1'b0; //no hay señal 
	  end  
end 
	  
endmodule 