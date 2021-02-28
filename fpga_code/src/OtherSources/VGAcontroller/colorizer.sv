`define BLACK   12'h000   // black
`define BKGD    12'h8B5   // light forest green
`define PATH    12'h986   // light path brown color
`define OBST    12'h485   // dark forest green
`define RED     12'hF00   // red
`define WHITE   12'hFFF   // white

module colorizer 
(
    input wire video_on,
    input wire [1:0] world_pixel, icon,
    output reg [3:0] vgaRed, vgaGreen, vgaBlue
);

always @(world_pixel or icon) begin
    if (video_on) begin
        case ({icon, world_pixel})
            4'b0000: {vgaRed, vgaGreen, vgaBlue} <= `BKGD;    // Background
            4'b0001: {vgaRed, vgaGreen, vgaBlue} <= `PATH;    // Path
            4'b0010: {vgaRed, vgaGreen, vgaBlue} <= `OBST;    // Obstruction
            4'b01??: {vgaRed, vgaGreen, vgaBlue} <= `BLACK;   // Icon Color 1
            4'b10??: {vgaRed, vgaGreen, vgaBlue} <= `RED;     // Icon Color 2
            4'b11??: {vgaRed, vgaGreen, vgaBlue} <= `WHITE;   // Icon Color 3
            default: {vgaRed, vgaGreen, vgaBlue} <= `BKGD;    // default background color
        endcase
    end else begin
        {vgaRed, vgaGreen, vgaBlue} <= `BLACK;
    end
end

endmodule