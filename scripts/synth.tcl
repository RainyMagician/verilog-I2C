set_app_var search_path "$search_path mapped lib scripts rtl cons"
set_app_var target_library saed90nm_typ.db
set_app_var link_library "* $target_library"


read_verilog "controller.v"
current_design controller
link
check_design > check_design.log
source timing.con
compile
report_constraint -all_violators > constraint_report.log
report_area > area_report.log
report_timing > timing_report.log
write_sdf -version 1.0 mapped/controller.sdf
write -f verilog -hier -out mapped/controller_mapped.v
quit
