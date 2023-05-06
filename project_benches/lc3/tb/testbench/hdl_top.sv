//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------                     
//               
// Description: This top level module instantiates all synthesizable
//    static content.  This and tb_top.sv are the two top level modules
//    of the simulation.  
//
//    This module instantiates the following:
//        DUT: The Design Under Test
//        Interfaces:  Signal bundles that contain signals connected to DUT
//        Driver BFM's: BFM's that actively drive interface signals
//        Monitor BFM's: BFM's that passively monitor interface signals
//
//----------------------------------------------------------------------

//----------------------------------------------------------------------
//

module hdl_top;

import lc3_parameters_pkg::*;
import uvmf_base_pkg_hdl::*;

  // pragma attribute hdl_top partition_module_xrtl                                            
// pragma uvmf custom clock_generator begin
  bit clk;
  // Instantiate a clk driver 
  // tbx clkgen
  initial begin
    clk = 0;
    #9ns;
    forever begin
      clk = ~clk;
      #5ns;
    end
  end
// pragma uvmf custom clock_generator end

// pragma uvmf custom reset_generator begin
  bit rst;
  // Instantiate a rst driver
  // tbx clkgen
  initial begin
    rst = 1; 
    #200ns;
    rst =  0; 
  end
// pragma uvmf custom reset_generator end

  // pragma uvmf custom module_item_additional begin
  // pragma uvmf custom module_item_additional end

  // Instantiate the signal bundle, monitor bfm and driver bfm for each interface.
  // The signal bundle, _if, contains signals to be connected to the DUT.
  // The monitor, monitor_bfm, observes the bus, _if, and captures transactions.
  // The driver, driver_bfm, drives transactions onto the bus, _if.
  fetch_in_if  fetch_fetch_in_agent_bus(
     // pragma uvmf custom fetch_fetch_in_agent_bus_connections begin
     .clock(clk), .reset(rst), .br_taken(DUT.br_taken), .taddr(DUT.pcout), .enable_updatePC(DUT.enable_updatePC), .enable_fetch(DUT.enable_fetch)
     // pragma uvmf custom fetch_fetch_in_agent_bus_connections end
     );
  wire new_instrmem_rd;
  assign new_instrmem_rd = DUT.instrmem_rd;
  fetch_out_if  fetch_fetch_out_agent_bus(
     // pragma uvmf custom fetch_fetch_out_agent_bus_connections begin
     .clock(clk), .reset(rst), .instrmem_rd(new_instrmem_rd), .pc(DUT.pc), .npc(DUT.npc_out_fetch)
     // pragma uvmf custom fetch_fetch_out_agent_bus_connections end
     );
  decode_in_if  decode_decode_in_agent_bus(
     // pragma uvmf custom decode_decode_in_agent_bus_connections begin
     .clock(clk), .reset(rst), .enable_decode(DUT.enable_decode), .Instr_dout(DUT.Instr_dout), .npc_in(DUT.npc_out_fetch), .psr(DUT.psr)
     // pragma uvmf custom decode_decode_in_agent_bus_connections end
     );
  decode_out_if  decode_decode_out_agent_bus(
     // pragma uvmf custom decode_decode_out_agent_bus_connections begin
     .clock(clk), .reset(rst), .IR(DUT.IR), .npc_out(DUT.npc_out_dec), .E_control(DUT.E_Control), .W_control(DUT.W_Control), .Mem_control(DUT.Mem_Control)
     // pragma uvmf custom decode_decode_out_agent_bus_connections end
     );
  writeback_in_if  writeback_writeback_in_agent_bus(
     // pragma uvmf custom writeback_writeback_in_agent_bus_connections begin
	  .clock(clk), .reset(rst), .npc_in(DUT.npc_out_dec), .W_Control_in(DUT.W_Control_out), .aluout(DUT.aluout), .pcout(DUT.pcout), .memout(DUT.memout), .enable_writeback(DUT.enable_writeback), .sr1(DUT.sr1), .sr2(DUT.sr2), .dr(DUT.dr)
     // pragma uvmf custom writeback_writeback_in_agent_bus_connections end
     );
  writeback_out_if  writeback_writeback_out_agent_bus(
     // pragma uvmf custom writeback_writeback_out_agent_bus_connections begin
	  .clock(clk), .reset(rst), .psr(DUT.psr), .VSR1(DUT.VSR1), .VSR2(DUT.VSR2), .enable_writeback_status(DUT.enable_writeback)
     // pragma uvmf custom writeback_writeback_out_agent_bus_connections end
     );
	
  memaccess_in_if  memaccess_memaccess_in_agent_bus(
     // pragma uvmf custom memaccess_memaccess_in_agent_bus_connections begin
     .clock(clk), .reset(rst), 
	 .mem_state(DUT.mem_state),
	 .M_Control(DUT.M_Control),
	 .M_Data(DUT.M_Data),
	 .M_addr(DUT.MemAccess.M_Addr),
	 .DMem_dout(DUT.Data_dout)
     // pragma uvmf custom memaccess_memaccess_in_agent_bus_connections end
     );
	 
  memaccess_out_if  memaccess_memaccess_out_agent_bus(
     // pragma uvmf custom memaccess_memaccess_out_agent_bus_connections begin
     .clock(clk), .reset(rst), 
	 .DMem_addr(DUT.Data_addr),
	 .DMem_rd(DUT.Data_rd),
	 .DMem_din(DUT.Data_din),
	 .memout(DUT.memout)
     // pragma uvmf custom memaccess_memaccess_out_agent_bus_connections end
     );
	 
	 
	 
	 
  control_in_if  control_control_in_agent_bus(
     // pragma uvmf custom control_control_in_agent_bus_connections begin
     .clock(clk), .reset(rst), .complete_data(DUT.Ctrl.complete_data), .complete_instr(DUT.Ctrl.complete_instr), .IR(DUT.Ctrl.IR), .psr(DUT.Ctrl.psr), .IR_Exec(DUT.Ctrl.IR_Exec), .Instr_dout(DUT.Ctrl.Instr_dout), .NZP(DUT.Ctrl.NZP)
     // pragma uvmf custom control_control_in_agent_bus_connections end
     );

  control_out_if  control_control_out_agent_bus(
     // pragma uvmf custom control_control_out_agent_bus_connections begin
     .clock(clk), .reset(rst), .enable_updatePC(DUT.Ctrl.enable_updatePC), .enable_fetch(DUT.Ctrl.enable_fetch), .enable_decode(DUT.Ctrl.enable_decode), .enable_execute(DUT.Ctrl.enable_execute), .enable_writeback(DUT.Ctrl.enable_writeback), .bypass_alu_1(DUT.bypass_alu_1), .bypass_alu_2(DUT.bypass_alu_2), .bypass_mem_1(DUT.bypass_mem_1), .bypass_mem_2(DUT.bypass_mem_2), .mem_state(DUT.mem_state), .br_taken(DUT.br_taken)
     // pragma uvmf custom control_control_out_agent_bus_connections end
     );
  
  execute_in_if  execute_execute_in_agent_bus(
     // pragma uvmf custom execute_execute_in_agent_bus_connections begin
     .clock(clk), .reset(rst), .enable_execute(DUT.Ex.enable_execute), .W_Control_in(DUT.Ex.W_Control_in), .Mem_Control_in(DUT.Ex.Mem_Control_in), .E_Control(DUT.Ex.E_Control),.IR(DUT.Ex.IR), .npc_in(DUT.Ex.npc), .VSR1(DUT.Ex.VSR1), .VSR2(DUT.Ex.VSR2), .Mem_Bypass_Val(DUT.Ex.Mem_Bypass_Val), .bypass_alu_1(DUT.Ex.bypass_alu_1), .bypass_alu_2(DUT.Ex.bypass_alu_2), .bypass_mem_1(DUT.Ex.bypass_mem_1), .bypass_mem_2(DUT.Ex.bypass_mem_2)
     // pragma uvmf custom execute_execute_in_agent_bus_connections end
     );

  execute_out_if  execute_execute_out_agent_bus(
     // pragma uvmf custom execute_execute_out_agent_bus_connections begin
     .clock(clk), .reset(rst), .aluout(DUT.Ex.aluout), .pcout(DUT.Ex.pcout), .W_Control_out(DUT.W_Control_out), .Mem_Control_out(DUT.Mem_Control_out), .NZP(DUT.NZP), .IR_Exec(DUT.IR_Exec), .sr1(DUT.sr1), .sr2(DUT.sr2), .dr(DUT.dr), .M_Data(DUT.M_Data), .enable_execute_out(DUT.enable_execute)
     // pragma uvmf custom execute_execute_out_agent_bus_connections end
     );

  inst_mem_if  inst_mem_agent_bus(
     // pragma uvmf custom inst_mem_agent_bus_connections begin
     .clock(clk), .reset(rst), .PC(), .instrmem_rd(), .instr_dout(), .complete_instr()
     // pragma uvmf custom inst_mem_agent_bus_connections end
     );
  data_mem_if  data_mem_agent_bus(
     // pragma uvmf custom data_mem_agent_bus_connections begin
     .clock(clk), .reset(rst), .Data_dout(), .Data_din(), .Data_rd(), .Data_addr(), .complete_data()
     // pragma uvmf custom data_mem_agent_bus_connections end
     );
  fetch_in_monitor_bfm  fetch_fetch_in_agent_mon_bfm(fetch_fetch_in_agent_bus.monitor_port);
  fetch_out_monitor_bfm  fetch_fetch_out_agent_mon_bfm(fetch_fetch_out_agent_bus.monitor_port);
  decode_in_monitor_bfm  decode_decode_in_agent_mon_bfm(decode_decode_in_agent_bus.monitor_port);
  decode_out_monitor_bfm  decode_decode_out_agent_mon_bfm(decode_decode_out_agent_bus.monitor_port);
  writeback_in_monitor_bfm  writeback_writeback_in_agent_mon_bfm(writeback_writeback_in_agent_bus.monitor_port);
  writeback_out_monitor_bfm  writeback_writeback_out_agent_mon_bfm(writeback_writeback_out_agent_bus.monitor_port);
  memaccess_in_monitor_bfm  memaccess_memaccess_in_agent_mon_bfm(memaccess_memaccess_in_agent_bus.monitor_port);
  memaccess_out_monitor_bfm  memaccess_memaccess_out_agent_mon_bfm(memaccess_memaccess_out_agent_bus.monitor_port);
  control_in_monitor_bfm  control_control_in_agent_mon_bfm(control_control_in_agent_bus.monitor_port);
  control_out_monitor_bfm  control_control_out_agent_mon_bfm(control_control_out_agent_bus.monitor_port);
  execute_in_monitor_bfm  execute_execute_in_agent_mon_bfm(execute_execute_in_agent_bus.monitor_port);
  execute_out_monitor_bfm  execute_execute_out_agent_mon_bfm(execute_execute_out_agent_bus.monitor_port);
  inst_mem_monitor_bfm  inst_mem_agent_mon_bfm(inst_mem_agent_bus.monitor_port);
  data_mem_monitor_bfm  data_mem_agent_mon_bfm(data_mem_agent_bus.monitor_port);
  inst_mem_driver_bfm  inst_mem_agent_drv_bfm(inst_mem_agent_bus.responder_port);
  data_mem_driver_bfm  data_mem_agent_drv_bfm(data_mem_agent_bus.responder_port);

  // pragma uvmf custom dut_instantiation begin
  // UVMF_CHANGE_ME : Add DUT and connect to signals in _bus interfaces listed above
  // Instantiate your DUT here
  LC3 DUT (	.clock(clk),
            .reset(rst),
            .pc(inst_mem_agent_bus.PC),
            .instrmem_rd(inst_mem_agent_bus.instrmem_rd),
            .Instr_dout(inst_mem_agent_bus.instr_dout),
            .Data_addr(data_mem_agent_bus.Data_addr),
            .complete_instr(inst_mem_agent_bus.complete_instr),
            .complete_data(data_mem_agent_bus.complete_data),
            .Data_din(data_mem_agent_bus.Data_din),
            .Data_dout(data_mem_agent_bus.Data_dout),
            .Data_rd(data_mem_agent_bus.Data_rd)			
			);

  // pragma uvmf custom dut_instantiation end

  initial begin      // tbx vif_binding_block 
    import uvm_pkg::uvm_config_db;
    // The monitor_bfm and driver_bfm for each interface is placed into the uvm_config_db.
    // They are placed into the uvm_config_db using the string names defined in the parameters package.
    // The string names are passed to the agent configurations by test_top through the top level configuration.
    // They are retrieved by the agents configuration class for use by the agent.
    uvm_config_db #( virtual fetch_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , fetch_fetch_in_agent_BFM , fetch_fetch_in_agent_mon_bfm ); 
    uvm_config_db #( virtual fetch_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , fetch_fetch_out_agent_BFM , fetch_fetch_out_agent_mon_bfm ); 
    uvm_config_db #( virtual decode_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , decode_decode_in_agent_BFM , decode_decode_in_agent_mon_bfm ); 
    uvm_config_db #( virtual decode_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , decode_decode_out_agent_BFM , decode_decode_out_agent_mon_bfm ); 
    uvm_config_db #( virtual writeback_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , writeback_writeback_in_agent_BFM , writeback_writeback_in_agent_mon_bfm ); 
    uvm_config_db #( virtual writeback_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , writeback_writeback_out_agent_BFM , writeback_writeback_out_agent_mon_bfm ); 
    uvm_config_db #( virtual memaccess_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , memaccess_memaccess_in_agent_BFM , memaccess_memaccess_in_agent_mon_bfm ); 
    uvm_config_db #( virtual memaccess_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , memaccess_memaccess_out_agent_BFM , memaccess_memaccess_out_agent_mon_bfm ); 
    uvm_config_db #( virtual control_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , control_control_in_agent_BFM , control_control_in_agent_mon_bfm ); 
    uvm_config_db #( virtual control_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , control_control_out_agent_BFM , control_control_out_agent_mon_bfm ); 
    uvm_config_db #( virtual execute_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , execute_execute_in_agent_BFM , execute_execute_in_agent_mon_bfm ); 
    uvm_config_db #( virtual execute_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , execute_execute_out_agent_BFM , execute_execute_out_agent_mon_bfm ); 
    uvm_config_db #( virtual inst_mem_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , inst_mem_agent_BFM , inst_mem_agent_mon_bfm ); 
    uvm_config_db #( virtual data_mem_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , data_mem_agent_BFM , data_mem_agent_mon_bfm ); 
    uvm_config_db #( virtual inst_mem_driver_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , inst_mem_agent_BFM , inst_mem_agent_drv_bfm  );
    uvm_config_db #( virtual data_mem_driver_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , data_mem_agent_BFM , data_mem_agent_drv_bfm  );
  end

endmodule

// pragma uvmf custom external begin
// pragma uvmf custom external end
