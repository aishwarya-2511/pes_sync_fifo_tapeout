// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0
`include pes_ripple_counter.v
`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * user_proj_example
 *
 * This is an example of a (trivially simple) user project,
 * showing how the user project can connect to the logic
 * analyzer, the wishbone bus, and the I/O pads.
 *
 * This project generates an integer count, which is output
 * on the user area GPIO pads (digital output only).  The
 * wishbone connection allows the project to be controlled
 * (start and stop) from the management SoC program.
 *
 * See the testbenches in directory "mprj_counter" for the
 * example programs that drive this user project.  The three
 * testbenches are "io_ports", "la_test1", and "la_test2".
 *
 *-------------------------------------------------------------
 */


module iiitb_sfifo(
`ifdef USE_POWER_PINS
	input        CLK,
	input        RSTn,
	input        write,
	input        read,
	input  [7:0] iData,
	
	output [7:0] oData,
	output       full,
	output       empty
`endif
);


iiitb_sfifo fifo (.CLK(CLK),
				  .RSTn(RSTn),
				  .write(write),
				  .read(read),
				  .iData(iData),
				  .full(full),
				  .empty(empty),
				  .oData(oData));

/*
always @ ( posedge CLK or negedge RSTn )
begin                  //write to RAM
	if (!RSTn)
	begin
		wp <= 5'b0;
	end
	else if ( write )
	begin
		RAM[wp[3:0]] <= iData;
		wp <= wp + 1'b1;
	end
end

always @ ( posedge CLK or negedge RSTn )
begin                  // read from RAM
	if (!RSTn)
	begin
		rp <= 5'b0;
		oData_reg <= 8'b0;
	end
	else if ( read  )
	begin
		oData_reg <= RAM[rp[3:0]];
		rp <= rp + 1'b1;
	end
end


assign full = ( wp[4] ^ rp[4] & wp[3:0] == rp[3:0] );
assign empty = ( wp == rp );
assign oData = oData_reg;


*/
endmodule

`default_nettype wire