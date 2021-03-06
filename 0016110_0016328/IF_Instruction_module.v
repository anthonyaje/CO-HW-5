//Subject:     CO project 2 - IF_instruction_module
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      Luke
//----------------------------------------------
//Date:        2010/8/17
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------
     
module IF_instruction_module(
               data0_i
			   data1_i
			   select_i
			   forward1_o,
               forward2_o
               );


input [5-1:0] 	exmem_rd_i;
input 	exmem_rw_i;
input [5-1:0]   memwb_rd_i;
input 	memwb_rw_i;
			   
input     [5-1:0]    idex_rs_i;
input     [5-1:0]    idex_rt_i;

output reg [1:0] forward1_o;
output reg [1:0] forward2_o;
		
always@(*)begin
	//forward from exmem
	if((exmem_rw_i) && (exmem_rd_i !=0) && (exmem_rd_i == idex_rs_i) )begin
		forward1_o = 2'b01;
	end
	else if( (memwb_rw_i) && (memwb_rd_i!=0) && (memwb_rd_i == idex_rs_i) )begin
		forward1_o = 2'b10;
	end
	else begin
		forward1_o = 0;
	end
	
	if((exmem_rw_i) && (exmem_rd_i !=0) && (exmem_rd_i == idex_rt_i) )begin
		forward2_o = 2'b01;
	end
	else if( (memwb_rw_i) && (memwb_rd_i!=0) && (memwb_rd_i == idex_rt_i) )begin
		forward2_o = 2'b10;
	end
	else begin
		forward2_o = 0;
	end
end
endmodule      
          
          