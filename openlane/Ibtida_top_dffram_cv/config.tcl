# 
# Copyright 2020 Muhammad Hadir Khan
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# User config
set script_dir [file dirname [file normalize [info script]]]

set ::env(DESIGN_NAME) Ibtida_top_dffram_cv 

set ::env(VERILOG_FILES) "\
        $::env(CARAVEL_ROOT)/verilog/rtl/defines.v \
        $script_dir/../../verilog/rtl/ibtida-soc/Ibtida_top_dffram_cv.v \
	$::env(CARAVEL_ROOT)/verilog/rtl/DFFRAM*.v"

set ::env(FP_SIZING) "absolute"
set ::env(DIE_AREA) "0 0 2500 2920"
set ::env(GLB_RT_ADJUSTMENT) 0.3

set ::env(GENERATE_FINAL_SUMMARY_REPORT) 1
set ::env(SYNTH_READ_BLACKBOX_LIB) 1
                                                                             
set ::env(DESIGN_IS_CORE) 0

set ::env(CLOCK_PORT) "wb_clk_i"
set ::env(CLOCK_NET) "counter.clk"
set ::env(CLOCK_PERIOD) "80"


set ::env(FP_PIN_ORDER_CFG) $script_dir/pin_order.cfg

set ::env(PL_BASIC_PLACEMENT) 1

# Maximum layer used for routing is metal 4.
# This is because this macro will be inserted in a top level (user_project_wrapper) 
# where the PDN is planned on metal 5. So, to avoid having shorts between routes
# in this macro and the top level metal 5 stripes, we have to restrict routes to metal4.  
set ::env(GLB_RT_MAXLAYER) 5

# You can draw more power domains if you need to 
set ::env(VDD_NETS) [list {vccd1}]
set ::env(GND_NETS) [list {vssd1}]

set ::env(DIODE_INSERTION_STRATEGY) 4
# If you're going to use multiple power domains, then disable cvc run.
set ::env(RUN_CVC) 1



