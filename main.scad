use <PCB.scad>
use <silent-switch.scad>
use <topshell.scad>
use <support-plate.scad>


include <microswitch-positions.scad>


PCB_THICKNESS = 1.5;
PCB_HEIGHT = 56.5;
PCB_WIDTH = 115;

PCB(
    big_hole_radius=2.5, 
    small_hole_radius=1, 
    PCB_thickness=PCB_THICKNESS);

translate([0.75,-35,-(PCB_THICKNESS+0.5)])  
    button_support_platform(
        pcb_width=PCB_WIDTH, 
        pcb_height=PCB_HEIGHT, 
        pcb_thickness=PCB_THICKNESS, 
        big_hole_radius=2.5,
        small_hole_radius=1);
        
translate([0,0,10])
    top_shell(PCB_WIDTH, PCB_HEIGHT, PCB_THICKNESS);