`define COL_SCALE 8
`define ROW_SCALE 6

module scale (
    // input wire clk, rst,
    input wire  [19:0]  pixel_addr,
    output reg  [13:0]  vid_addr
);

wire [9:0] pixel_col, pixel_row;
wire [6:0] vid_col, vid_row;

assign {pixel_col[9:0], pixel_row[9:0]} = pixel_addr[19:0];         // Break up pixel_addr into column and row addresses
assign vid_col = (pixel_col - (pixel_col%`COL_SCALE))/`COL_SCALE;     // Scale down pixel column address
assign vid_row = (pixel_row - (pixel_row%`ROW_SCALE))/`ROW_SCALE;     // Scale down pixel row address

always @(pixel_addr) begin

    vid_addr <= {vid_row[6:0],vid_col[6:0]};                      // Output world map address

end

endmodule