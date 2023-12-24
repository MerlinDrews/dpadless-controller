use <PCB.scad>
use <silent-switch.scad>
use <topshell.scad>
use <support-plate.scad>

switch_offset_x_directions = 20;
switch_offset_distance = 15;

// Right button switch
rotate([180,0,0])
translate([switch_offset_x_directions,-(2*switch_offset_distance),1.5])
silent_switch();

// Down button switch
rotate([180,0,0])
translate([switch_offset_x_directions,-(1*switch_offset_distance),1.5])
silent_switch();

// Left button switch
rotate([180,0,0])
translate([switch_offset_x_directions,-(0*switch_offset_distance),1.5])
silent_switch();

switch_offset_x_attacks = 80;

// LP button switch
rotate([180,0,0])
translate([switch_offset_x_attacks,-(2*switch_offset_distance),1.5])
silent_switch();

// MP button switch
rotate([180,0,0])
translate([switch_offset_x_attacks,-(1*switch_offset_distance),1.5])
silent_switch();

// HP button switch
rotate([180,0,0])
translate([switch_offset_x_attacks,-(0*switch_offset_distance),1.5])
silent_switch();


// LK button switch
rotate([180,0,0])
translate([switch_offset_x_attacks+switch_offset_distance,-(2*switch_offset_distance),1.5])
silent_switch();


// MK button switch
rotate([180,0,0])
translate([switch_offset_x_attacks+switch_offset_distance,-(1*switch_offset_distance),1.5])
silent_switch();


// HK button switch
rotate([180,0,0])
translate([switch_offset_x_attacks+switch_offset_distance,-(0*switch_offset_distance),1.5])
silent_switch();


// right face button switch
translate([switch_offset_x_attacks+switch_offset_distance - 11,(2*switch_offset_distance)-15,1.5])
silent_switch();


// right face button switch
translate([switch_offset_x_attacks+switch_offset_distance - 3,2*(switch_offset_distance)-8,1.5])
silent_switch();


// right face button switch
translate([switch_offset_x_attacks+switch_offset_distance - 14,5,1.5])
silent_switch();


// left face button switch
translate([switch_offset_x_directions - 6, (2*switch_offset_distance)-15,1.5])
silent_switch();


// left face button switch
translate([switch_offset_x_directions - 14, 2*(switch_offset_distance)-8,1.5])
silent_switch();


// left face button switch
translate([switch_offset_x_directions - 5, 5,1.5])
silent_switch();



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