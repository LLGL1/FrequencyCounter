module FrequencyCounter_tb();

	 reg iClk;
    reg iSenal;
    wire oUnidades;
    
    integer seed = 3;
    
    FrequencyCounter  uut(
        .iClk            (iClk),
        .iSenal        (iSenal),
        .oUnidades    (oUnidades)
    );
    
    initial
    begin
        repeat (20)
        begin
            // Cero Estable
            iClk = 0;
            iSenal = 0;
            #400;
            // Ruido
            repeat (10)
            begin
                iSenal = $random(seed)%2;
                $display("iSenal %d",iSenal);
                #20;
            end
            // Uno Estable
            iSenal = 1;
            #400;
        end
    end
    
    always
    begin
        forever
        begin
            iClk = ~iClk;
            #20;
        end
    end
	 
	 endmodule 