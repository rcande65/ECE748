 

onerror resume
wave tags F0
wave update off

wave spacer -backgroundcolor Salmon { fetch_fetch_in_agent }
wave add uvm_test_top.environment.fetch.fetch_in_agent.fetch_in_agent_monitor.txn_stream -radix string -tag F0
wave group fetch_fetch_in_agent_bus
wave add -group fetch_fetch_in_agent_bus hdl_top.fetch_fetch_in_agent_bus.* -radix hexadecimal -tag F0
wave group fetch_fetch_in_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { fetch_fetch_out_agent }
wave add uvm_test_top.environment.fetch.fetch_out_agent.fetch_out_agent_monitor.txn_stream -radix string -tag F0
wave group fetch_fetch_out_agent_bus
wave add -group fetch_fetch_out_agent_bus hdl_top.fetch_fetch_out_agent_bus.* -radix hexadecimal -tag F0
wave group fetch_fetch_out_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { decode_decode_in_agent }
wave add uvm_test_top.environment.decode.decode_in_agent.decode_in_agent_monitor.txn_stream -radix string -tag F0
wave group decode_decode_in_agent_bus
wave add -group decode_decode_in_agent_bus hdl_top.decode_decode_in_agent_bus.* -radix hexadecimal -tag F0
wave group decode_decode_in_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { decode_decode_out_agent }
wave add uvm_test_top.environment.decode.decode_out_agent.decode_out_agent_monitor.txn_stream -radix string -tag F0
wave group decode_decode_out_agent_bus
wave add -group decode_decode_out_agent_bus hdl_top.decode_decode_out_agent_bus.* -radix hexadecimal -tag F0
wave group decode_decode_out_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { writeback_writeback_in_agent }
wave add uvm_test_top.environment.writeback.writeback_in_agent.writeback_in_agent_monitor.txn_stream -radix string -tag F0
wave group writeback_writeback_in_agent_bus
wave add -group writeback_writeback_in_agent_bus hdl_top.writeback_writeback_in_agent_bus.* -radix hexadecimal -tag F0
wave group writeback_writeback_in_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { writeback_writeback_out_agent }
wave add uvm_test_top.environment.writeback.writeback_out_agent.writeback_out_agent_monitor.txn_stream -radix string -tag F0
wave group writeback_writeback_out_agent_bus
wave add -group writeback_writeback_out_agent_bus hdl_top.writeback_writeback_out_agent_bus.* -radix hexadecimal -tag F0
wave group writeback_writeback_out_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { memaccess_memaccess_in_agent }
wave add uvm_test_top.environment.memaccess.memaccess_in_agent.memaccess_in_agent_monitor.txn_stream -radix string -tag F0
wave group memaccess_memaccess_in_agent_bus
wave add -group memaccess_memaccess_in_agent_bus hdl_top.memaccess_memaccess_in_agent_bus.* -radix hexadecimal -tag F0
wave group memaccess_memaccess_in_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { memaccess_memaccess_out_agent }
wave add uvm_test_top.environment.memaccess.memaccess_out_agent.memaccess_out_agent_monitor.txn_stream -radix string -tag F0
wave group memaccess_memaccess_out_agent_bus
wave add -group memaccess_memaccess_out_agent_bus hdl_top.memaccess_memaccess_out_agent_bus.* -radix hexadecimal -tag F0
wave group memaccess_memaccess_out_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { control_control_in_agent }
wave add uvm_test_top.environment.control.control_in_agent.control_in_agent_monitor.txn_stream -radix string -tag F0
wave group control_control_in_agent_bus
wave add -group control_control_in_agent_bus hdl_top.control_control_in_agent_bus.* -radix hexadecimal -tag F0
wave group control_control_in_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { control_control_out_agent }
wave add uvm_test_top.environment.control.control_out_agent.control_out_agent_monitor.txn_stream -radix string -tag F0
wave group control_control_out_agent_bus
wave add -group control_control_out_agent_bus hdl_top.control_control_out_agent_bus.* -radix hexadecimal -tag F0
wave group control_control_out_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { execute_execute_in_agent }
wave add uvm_test_top.environment.execute.execute_in_agent.execute_in_agent_monitor.txn_stream -radix string -tag F0
wave group execute_execute_in_agent_bus
wave add -group execute_execute_in_agent_bus hdl_top.execute_execute_in_agent_bus.* -radix hexadecimal -tag F0
wave group execute_execute_in_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { execute_execute_out_agent }
wave add uvm_test_top.environment.execute.execute_out_agent.execute_out_agent_monitor.txn_stream -radix string -tag F0
wave group execute_execute_out_agent_bus
wave add -group execute_execute_out_agent_bus hdl_top.execute_execute_out_agent_bus.* -radix hexadecimal -tag F0
wave group execute_execute_out_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { inst_mem_agent }
wave add uvm_test_top.environment.inst_mem_agent.inst_mem_agent_monitor.txn_stream -radix string -tag F0
wave group inst_mem_agent_bus
wave add -group inst_mem_agent_bus hdl_top.inst_mem_agent_bus.* -radix hexadecimal -tag F0
wave group inst_mem_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { data_mem_agent }
wave add uvm_test_top.environment.data_mem_agent.data_mem_agent_monitor.txn_stream -radix string -tag F0
wave group data_mem_agent_bus
wave add -group data_mem_agent_bus hdl_top.data_mem_agent_bus.* -radix hexadecimal -tag F0
wave group data_mem_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]

wave update on
WaveSetStreamView

