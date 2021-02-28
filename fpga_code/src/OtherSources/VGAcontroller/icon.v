module icon
(
    input wire [9:0]   pixel_row, pixel_column,
    input wire [7:0]   botinfo_reg, locx_reg, locy_reg,
    output reg [1:0]   icon
);

// Calculate Correction Values
localparam x_correct_l = 7;
localparam y_correct_l = 7;
localparam x_correct_u = 9;
localparam y_correct_u = 9;

reg [8:0] locx_512, locy_512, ico_col_d, ico_row_d;
reg [7:0] idx;

reg [1:0] pokeballN   [0:255];
reg [1:0] pokeballNE  [0:255];
reg [1:0] pokeballE   [0:255];
reg [1:0] pokeballSE  [0:255];
reg [1:0] pokeballS   [0:255];
reg [1:0] pokeballSW  [0:255];
reg [1:0] pokeballW   [0:255];
reg [1:0] pokeballNW  [0:255];

initial begin
    $readmemb("pokeballN.mem", pokeballN);
    $readmemb("pokeballNE.mem", pokeballNE);
    $readmemb("pokeballE.mem", pokeballE);
    $readmemb("pokeballSE.mem", pokeballSE);
    $readmemb("pokeballS.mem", pokeballS);
    $readmemb("pokeballSW.mem", pokeballSW);
    $readmemb("pokeballW.mem", pokeballW);
    $readmemb("pokeballNW.mem", pokeballNW);
end

always @(pixel_column or pixel_row)

begin 

    ico_col_d = (pixel_column - pixel_column%2)/2;
    ico_row_d = (pixel_row - pixel_row%2)/2;
    locx_512 = locx_reg * 4;     // Scale to 512x384
    locy_512 = locy_reg * 3;

    // Check if scaled down vga column and row falls within rojobot location
    if ((ico_col_d >= (locx_512-x_correct_l)) 
        && (ico_col_d < (locx_512 + x_correct_u)) 
        && (ico_row_d >= (locy_512-y_correct_l)) 
        && (ico_row_d < (locy_512 + y_correct_u)))

        begin

        idx = (ico_col_d-(locx_512-x_correct_l)) + (ico_row_d-(locy_512-y_correct_l)) * 5'd16;            // Identify Icon Array Index

        case (botinfo_reg[2:0])     // Check Rojobot Orientation
            3'h0:   icon <= pokeballN[idx];     // North
            3'h1:   icon <= pokeballNE[idx];    // Northeast
            3'h2:   icon <= pokeballE[idx];     // East
            3'h3:   icon <= pokeballSE[idx];    // Southeast
            3'h4:   icon <= pokeballS[idx];     // South
            3'h5:   icon <= pokeballSW[idx];    // Southwest
            3'h6:   icon <= pokeballW[idx];     // West
            3'h7:   icon <= pokeballNW[idx];    // Northwest
            default:        icon <= 2'b00;
        endcase
    end else begin
        icon <= 2'b00;
    end
end


endmodule