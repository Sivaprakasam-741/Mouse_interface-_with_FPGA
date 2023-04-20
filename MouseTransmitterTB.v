`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.04.2023 13:53:42
// Design Name: 
// Module Name: MouseTransmitterTB
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module MouseTransmitterTB(
    );
    
    // Inputs
    reg RESET;
    reg CLK;
    reg CLK_MOUSE_IN;
    reg DATA_MOUSE_IN;
    reg SEND_BYTE;
    reg [7:0] BYTE_TO_SEND;
    
    // Outputs
    wire CLK_MOUSE_OUT_EN;
    wire DATA_MOUSE_OUT;
    wire DATA_MOUSE_OUT_EN;
    wire BYTE_SENT;
    
    // Instantiate the uut
    MouseTransmitter uut (
        .RESET(RESET),
        .CLK(CLK),
        .CLK_MOUSE_IN(CLK_MOUSE_IN),
        .CLK_MOUSE_OUT_EN(CLK_MOUSE_OUT_EN),
        .DATA_MOUSE_IN(DATA_MOUSE_IN),
        .DATA_MOUSE_OUT(DATA_MOUSE_OUT),
        .DATA_MOUSE_OUT_EN(DATA_MOUSE_OUT_EN),
        .SEND_BYTE(SEND_BYTE),
        .BYTE_TO_SEND(BYTE_TO_SEND),
        .BYTE_SENT(BYTE_SENT)
    );
    
    always
        #10 CLK = !CLK;
        
    initial begin
        $monitor("Time = %d \t BYTE_SENT = %b \t SEND_BYTE = %b \t BYTE_TO_SEND = %b \t DATA_MOUSE_OUT = %b",$time, BYTE_SENT, SEND_BYTE, BYTE_TO_SEND, DATA_MOUSE_OUT);
    end
    
    initial begin 
        // Initialize inputs
        #100; // global reset
        RESET = 0;
        CLK = 0;
        CLK_MOUSE_IN = 1;
        DATA_MOUSE_IN = 1;
        SEND_BYTE = 0;
        BYTE_TO_SEND = 0;
        
        $display("Begin");
        
        // Wait 100ns for global reset to finish
        SEND_BYTE = 1;
        BYTE_TO_SEND = 8'hFA;
        $display("Byte to send: %h", BYTE_TO_SEND);
        
        // Simulate Mouse Clock
        CLK_MOUSE_IN = 0;
        #30000;
        CLK_MOUSE_IN = 1;
        #30000;
        CLK_MOUSE_IN = 0;
        #30000;
        CLK_MOUSE_IN = 1;
        #30000;
        CLK_MOUSE_IN = 0;
        #30000;
        CLK_MOUSE_IN = 1;
        #30000;
        CLK_MOUSE_IN = 0;
        #30000;
        CLK_MOUSE_IN = 1;
        #30000;
        CLK_MOUSE_IN = 0;
        #30000;
        CLK_MOUSE_IN = 1;
        #30000;
        CLK_MOUSE_IN = 0;
        #30000;
        CLK_MOUSE_IN = 1;
        #30000;
        CLK_MOUSE_IN = 0;
        #30000;
        CLK_MOUSE_IN = 1;
        #30000;
        CLK_MOUSE_IN = 0;
        #30000;
        CLK_MOUSE_IN = 1;
        #30000;
        CLK_MOUSE_IN = 0;
        #30000;
        CLK_MOUSE_IN = 1;
        #30000;
        CLK_MOUSE_IN = 0;
        #30000;
        CLK_MOUSE_IN = 1;
        #30000;
        CLK_MOUSE_IN = 0;
        #30000;
        CLK_MOUSE_IN = 1;
        #30000;
        CLK_MOUSE_IN = 0;
        #30000;
        CLK_MOUSE_IN = 1;
        #30000;
        CLK_MOUSE_IN = 0;
        #30000;
        CLK_MOUSE_IN = 1;
        #30000;
        
        #30000;
        DATA_MOUSE_IN = 0;
        $display("Bring Data Low: DATA_MOUSE_IN = %b", DATA_MOUSE_IN);
        #10000;
        CLK_MOUSE_IN = 0;
        $display("Bring Clock Low: CLK_MOUSE_IN = %b", CLK_MOUSE_IN);
        #30000;
        CLK_MOUSE_IN = 1;
        $display("Release Clock Line: CLK_MOUSE_IN = %b", CLK_MOUSE_IN);
        #10000;
        DATA_MOUSE_IN = 1;
        $display("Release Data Line: DATA_MOUSE_IN = %b", DATA_MOUSE_IN);
        
        //Display current BYTE_SENT
        #20;
        $display("Byte Sent = %b", BYTE_SENT);
        
        #60000;
        
        $display("End");
    end
    
endmodule
