`define BLACK   12'b0000_0000_0000
`define BKGD    12'b1000_1011_0101  // light green 0x8B5
`define PATH    12'b1001_1000_0110  // light brown 0x986
`define OBST    12'b0100_1000_0101  // dark green 0x485
`define RED     12'b1111_0000_0000  // red red 0xF00
`define WHITE   12'b1111_1111_1111  // white 0xFFF

module colorizer (
    input wire video_on,
    input wire [1:0] world_pixel, icon,
    output reg [3:0] vgaRed, vgaGreen, vgaBlue
);

always @(world_pixel or icon) begin
    if (video_on) begin
        case ({icon, world_pixel}) inside
            4'b0000: {vgaRed, vgaGreen, vgaBlue} <= `BKGD;    // Background
            4'b0001: {vgaRed, vgaGreen, vgaBlue} <= `PATH;    // Path
            4'b0010: {vgaRed, vgaGreen, vgaBlue} <= `OBST;    // Obstruction
            4'b01??: {vgaRed, vgaGreen, vgaBlue} <= `BLACK;   // Icon Color 1
            4'b10??: {vgaRed, vgaGreen, vgaBlue} <= `RED;    // Icon Color 2
            4'b11??: {vgaRed, vgaGreen, vgaBlue} <= `WHITE;  // Icon Color 3
            default: {vgaRed, vgaGreen, vgaBlue} <= `BKGD;    // Default to Background
        endcase
    end else begin
        {vgaRed, vgaGreen, vgaBlue} <= `BLACK;
    end
end

endmodule