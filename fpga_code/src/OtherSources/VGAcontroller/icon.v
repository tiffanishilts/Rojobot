`define COL_SCALE       8
`define ROW_SCALE       6

module icon 
#(
    parameter ICON_SCALE = 1,   // Whole number scaling factor
    parameter CENT_CORR = 0     // Center Correction (boolean)
 )
 (
    input wire [9:0]   pixel_row, pixel_column,
    input wire [7:0]   botinfo_reg, locx_reg, locy_reg,
    output reg [1:0]   icon
);

// Icon Size Parameters
localparam icon_width = 16*ICON_SCALE;
localparam icon_height = 16*ICON_SCALE;

// Calculate Correction Values
localparam x_correct_l = CENT_CORR ? (icon_width/2) - 1 : 0;
localparam y_correct_l = CENT_CORR ? (icon_height/2) - 1 : 0;
localparam x_correct_u = CENT_CORR ? (x_correct_l + 2) : icon_width;
localparam y_correct_u = CENT_CORR ? (y_correct_l + 2) : icon_height;

reg [1:0] corgi_n   [0:255];
reg [1:0] corgi_ne  [0:255];
reg [1:0] corgi_e   [0:255];
reg [1:0] corgi_se  [0:255];
reg [1:0] corgi_s   [0:255];
reg [1:0] corgi_sw  [0:255];
reg [1:0] corgi_w   [0:255];
reg [1:0] corgi_nw  [0:255];

initial begin
    $readmemb("pokeballN.mem", corgi_n);
    $readmemb("pokeballNE.mem", corgi_ne);
    $readmemb("pokeballE.mem", corgi_e);
    $readmemb("pokeballSE.mem", corgi_se);
    $readmemb("pokeballS.mem", corgi_s);
    $readmemb("pokeballSW.mem", corgi_sw);
    $readmemb("pokeballW.mem", corgi_w);
    $readmemb("pokeballNW.mem", corgi_nw);
end

reg [8:0] locx_512, locy_512, ico_col_d, ico_row_d;
reg [7:0] idx;


always @(pixel_column or pixel_row) begin 

    ico_col_d = (pixel_column - pixel_column%2)/2;
    ico_row_d = (pixel_row - pixel_row%2)/2;
    locx_512 = locx_reg * 4;     // Scale to 512x384
    locy_512 = locy_reg * 3;

    // Check if scaled down vga column and row falls within rojobot location
    if ((ico_col_d >= (locx_512-x_correct_l)) && (ico_col_d < (locx_512 + x_correct_u)) 
        && (ico_row_d >= (locy_512-y_correct_l)) && (ico_row_d < (locy_512 + y_correct_u))) begin
        idx = (ico_col_d-(locx_512-x_correct_l)) + (ico_row_d-(locy_512-y_correct_l))*5'd16;            // Identify Icon Array Index
        case (botinfo_reg[2:0])     // Check Rojobot Orientation
            3'h0:   icon <= corgi_n[idx];     // North
            3'h1:   icon <= corgi_ne[idx];    // Northeast
            3'h2:   icon <= corgi_e[idx];     // East
            3'h3:   icon <= corgi_se[idx];    // Southeast
            3'h4:   icon <= corgi_s[idx];     // South
            3'h5:   icon <= corgi_sw[idx];    // Southwest
            3'h6:   icon <= corgi_w[idx];     // West
            3'h7:   icon <= corgi_nw[idx];    // Northwest
            default:        icon <= 2'b00;
        endcase
    end else begin
        icon <= 2'b00;
    end
end


endmodule