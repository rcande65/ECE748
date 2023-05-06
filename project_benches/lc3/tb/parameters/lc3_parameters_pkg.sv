//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// DESCRIPTION: This package contains test level parameters
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//


package lc3_parameters_pkg;

  import uvmf_base_pkg_hdl::*;

  // pragma uvmf custom package_imports_additional begin 
  // pragma uvmf custom package_imports_additional end


  // These parameters are used to uniquely identify each interface.  The monitor_bfm and
  // driver_bfm are placed into and retrieved from the uvm_config_db using these string 
  // names as the field_name. The parameter is also used to enable transaction viewing 
  // from the command line for selected interfaces using the UVM command line processing.
  parameter string fetch_fetch_in_agent_BFM  = "fetch_fetch_in_agent_BFM"; /* [0] */
  parameter string fetch_fetch_out_agent_BFM  = "fetch_fetch_out_agent_BFM"; /* [1] */
  parameter string decode_decode_in_agent_BFM  = "decode_decode_in_agent_BFM"; /* [2] */
  parameter string decode_decode_out_agent_BFM  = "decode_decode_out_agent_BFM"; /* [3] */
  parameter string writeback_writeback_in_agent_BFM  = "writeback_writeback_in_agent_BFM"; /* [4] */
  parameter string writeback_writeback_out_agent_BFM  = "writeback_writeback_out_agent_BFM"; /* [5] */
  parameter string memaccess_memaccess_in_agent_BFM  = "memaccess_memaccess_in_agent_BFM"; /* [6] */
  parameter string memaccess_memaccess_out_agent_BFM  = "memaccess_memaccess_out_agent_BFM"; /* [7] */
  parameter string control_control_in_agent_BFM  = "control_control_in_agent_BFM"; /* [8] */
  parameter string control_control_out_agent_BFM  = "control_control_out_agent_BFM"; /* [9] */
  parameter string execute_execute_in_agent_BFM  = "execute_execute_in_agent_BFM"; /* [10] */
  parameter string execute_execute_out_agent_BFM  = "execute_execute_out_agent_BFM"; /* [11] */
  parameter string inst_mem_agent_BFM  = "inst_mem_agent_BFM"; /* [12] */
  parameter string data_mem_agent_BFM  = "data_mem_agent_BFM"; /* [13] */

  // pragma uvmf custom package_item_additional begin
  // pragma uvmf custom package_item_additional end

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

