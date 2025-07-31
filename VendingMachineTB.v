`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Description: Testbench for Vending Machine
//////////////////////////////////////////////////////////////////////////////////

module VendingMachineTB;

// Inputs
reg CLK;
reg RST;
reg START;
reg CANCEL;
reg [2:0] PRODUCT_CODE;
reg ONLINE_PAYMENT;
reg [6:0] COINS;

// Outputs
wire [3:0] STATE;
wire DISPENSE_PRODUCT;
wire [6:0] RETURN_CHANGE_VALUE;
wire [6:0] PRODUCT_PRICE_VALUE;

// Clock generation (10ns period)
always #5 CLK = ~CLK;

// DUT - Design Under Test
vendingmachine DUT (
    .i_clk(CLK),
    .i_rst(RST),
    .i_start(START),
    .i_cancel(CANCEL),
    .i_product_code(PRODUCT_CODE),
    .i_online_payment(ONLINE_PAYMENT),
    .i_total_coin_value(COINS),
    .o_state(STATE),
    .o_dispense_product(DISPENSE_PRODUCT),
    .o_return_change(RETURN_CHANGE_VALUE),
    .o_product_price(PRODUCT_PRICE_VALUE)
);

// Simulation and stimulus
initial begin
    // Initialize signals
    CLK = 0;                // Clock must be initialized
    RST = 1;                // Assert reset
    START = 0;
    CANCEL = 0;
    COINS = 7'd0;
    ONLINE_PAYMENT = 0;
    PRODUCT_CODE = 3'b000;

    // Hold reset for 100ns
    #100 RST = 0;
    #20;

    // --- Test 1: PEN (online payment) ---
    START = 1; PRODUCT_CODE = 3'b000; ONLINE_PAYMENT = 1;
    #20 START = 0; ONLINE_PAYMENT = 0;
    #100;

    // --- Test 2: Notebook with coins ---
    START = 1; PRODUCT_CODE = 3'b001; COINS = 7'd60;
    #20 START = 0;
    #100;
    COINS = 7'd0;

    // --- Test 3: Water Bottle with coins ---
    START = 1; PRODUCT_CODE = 3'b100; COINS = 7'd30;
    #20 START = 0;
    #100;
    COINS = 7'd0;

    // --- Test 4: Cancel after product selection ---
    START = 1; PRODUCT_CODE = 3'b010; // Coke
    #20 START = 0; CANCEL = 1;
    #20 CANCEL = 0;
    #100;

    $finish;
end

// Optional: Monitor signals in simulation log
initial begin
  $monitor("Time=%t | State=%b | ProductCode=%b | Dispense=%b | Change=%d | Price=%d", 
           $time, STATE, PRODUCT_CODE, DISPENSE_PRODUCT, RETURN_CHANGE_VALUE, PRODUCT_PRICE_VALUE);
end

endmodule