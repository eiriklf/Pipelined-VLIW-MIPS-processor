
# PlanAhead Launch Script for Post PAR Floorplanning, created by Project Navigator

create_project -name exersise2 -dir "C:/Users/eiriklf/git/dmkonsttdt4255_work/exersise2experiment2/planAhead_run_2" -part xc6slx16csg324-2
set srcset [get_property srcset [current_run -impl]]
set_property design_mode GateLvl $srcset
set_property edif_top_file "C:/Users/eiriklf/git/dmkonsttdt4255_work/exersise2experiment2/toplevel.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/eiriklf/git/dmkonsttdt4255_work/exersise2experiment2} }
set_param project.paUcfFile  "toplevel.ucf"
add_files "toplevel.ucf" -fileset [get_property constrset [current_run]]
open_netlist_design
read_xdl -file "C:/Users/eiriklf/git/dmkonsttdt4255_work/exersise2experiment2/toplevel.ncd"
if {[catch {read_twx -name results_1 -file "C:/Users/eiriklf/git/dmkonsttdt4255_work/exersise2experiment2/toplevel.twx"} eInfo]} {
   puts "WARNING: there was a problem importing \"C:/Users/eiriklf/git/dmkonsttdt4255_work/exersise2experiment2/toplevel.twx\": $eInfo"
}
