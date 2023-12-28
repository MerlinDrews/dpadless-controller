use <PCB.scad>
use <silent-switch.scad>
use <shell.scad>
use <support-plate.scad>


//positions of silent switches for buttons
include <microswitch-positions.scad>


PCB_THICKNESS = 1.5;
PCB_HEIGHT = 56.5;
PCB_WIDTH = 115;

BIG_HOLE_RADIUS = 2.5;
SMALL_HOLE_RADIUS = 1;

BUTTON_HOLE_RADIUS = 4;

PCB(
    big_hole_radius=BIG_HOLE_RADIUS, 
    small_hole_radius=SMALL_HOLE_RADIUS, 
    PCB_thickness=PCB_THICKNESS);


translate([0.75,-35,-(PCB_THICKNESS+0.5)])  
    button_support_platform(
        pcb_width=PCB_WIDTH, 
        pcb_height=PCB_HEIGHT, 
        pcb_thickness=PCB_THICKNESS, 
        big_hole_radius=BIG_HOLE_RADIUS,
        small_hole_radius=SMALL_HOLE_RADIUS);
      

// Top shell
translate([12,0,6])
    difference() {

#      shell(PCB_WIDTH, PCB_HEIGHT, PCB_THICKNESS);

      translate([
          switch_offset_x_attacks-BUTTON_HOLE_RADIUS*2,
          4+BUTTON_HOLE_RADIUS,
          1.5])
        #cylinder(100, BUTTON_HOLE_RADIUS, BUTTON_HOLE_RADIUS);

      translate([
          switch_offset_x_attacks-BUTTON_HOLE_RADIUS*2+3,
          (2*switch_offset_distance)-16+BUTTON_HOLE_RADIUS,
          1.5])
        #cylinder(100, BUTTON_HOLE_RADIUS, BUTTON_HOLE_RADIUS);

      translate([
          switch_offset_x_directions-BUTTON_HOLE_RADIUS*2-7,
          (2*switch_offset_distance)-4-BUTTON_HOLE_RADIUS*2,
          1.5])
        #cylinder(100, BUTTON_HOLE_RADIUS, BUTTON_HOLE_RADIUS);
    }

// Bottom shell
rotate([180,0,0])
  translate([12,-PCB_HEIGHT+19,10])
      #shell(PCB_WIDTH, PCB_HEIGHT, PCB_THICKNESS);
