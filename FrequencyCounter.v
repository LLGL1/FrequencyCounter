module FrequencyCounter(
     input iClk,
	  //input irst,
	  input iSenal,
	  //output oUnidades
	  output [6:0]oS1,
	  output [6:0]oS2,
	  output [6:0]oS3,
	  output [6:0]oS4
	  ); 


wire wDivFrec;
wire wCleanSignal;
wire [3:0]wPeriodo;
wire [15:0]wFrec;


wire [3:0]wU;
wire [3:0]wD;
wire [3:0]wC;
wire [3:0]wUM;


Debouncing Debouncing_Module(
.iClk (iClk),
.iArrangement (iSenal),
.oSalida (wCleanSignal)
);



DivF FrecDiv(
.iClk (iClk),
.irst (irst),
.oSalidas(wDivFrec)
);



PeriodCounter TCounter(
.iClk (iClk),
.iRst (wDivFrec),
.iSignal (wCleanSignal),
.oCycles (wFrec) //oUnidades
);


BitShift bitshift(
.iClk (iClk),
.iFrec (wFrec),
.oU (wU),
.oD (wD),
.oC (wC),
.oUM (wUM)
);



BCD #(.N(7))Unidades(
.iClk (iClk),
.iBCD (wU),
.oSeg (oS1)
);



BCD #(.N(7))Decenas(
.iClk (iClk),
.iBCD (wD),
.oSeg (oS2)
);



BCD#(.N(7))Centenas(
.iClk (iClk),
.iBCD (wC),
.oSeg (oS3)
);


BCD #(.N(7))Millares(
.iClk (iClk),
.iBCD (wUM),
.oSeg (oS4)
);


endmodule 