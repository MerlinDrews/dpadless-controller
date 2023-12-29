use <PCB.scad>
use <silent-switch.scad>
use <shell.scad>
use <support-plate.scad>


//positions of silent switches for buttons
include <microswitch-positions.scad>


PCB_THICKNESS = 1.3;
PCB_HEIGHT = 57.2;
PCB_WIDTH = 116.7;

BIG_HOLE_RADIUS = 2;
SMALL_HOLE_RADIUS = 0.5;

BUTTON_HOLE_RADIUS = 4;


SMALL_BOTTOM_HOLE = [55+SMALL_HOLE_RADIUS, 2.4+SMALL_HOLE_RADIUS, -PCB_THICKNESS*2];
SMALL_TOP_HOLE = [77.5+SMALL_HOLE_RADIUS, 53.2+SMALL_HOLE_RADIUS, -PCB_THICKNESS*2];
BIG_MIDDLE_HOLE = [53.5+BIG_HOLE_RADIUS, 15+BIG_HOLE_RADIUS, -PCB_THICKNESS*2];
BIG_HOLE_LEFT = [3.5+BIG_HOLE_RADIUS, 4.6+BIG_HOLE_RADIUS, -PCB_THICKNESS*2];
BIG_HOLE_RIGHT = [103.5+BIG_HOLE_RADIUS, 4.6+BIG_HOLE_RADIUS, -PCB_THICKNESS*2];

PCB(
    big_hole_radius=BIG_HOLE_RADIUS, 
    small_hole_radius=SMALL_HOLE_RADIUS, 
    PCB_thickness=PCB_THICKNESS,
    small_bottom_hole=SMALL_BOTTOM_HOLE,
    small_top_hole=SMALL_TOP_HOLE,
    big_middle_hole=BIG_MIDDLE_HOLE,
    big_hole_left=BIG_HOLE_LEFT,
    big_hole_right=BIG_HOLE_RIGHT);


support_platform_offset = 35;
translate([0.0,-support_platform_offset,-(PCB_THICKNESS+0.5)])  
    button_support_platform(
        pcb_width=PCB_WIDTH, 
        pcb_height=PCB_HEIGHT, 
        pcb_thickness=PCB_THICKNESS, 
        big_hole_radius=BIG_HOLE_RADIUS,
        small_hole_radius=SMALL_HOLE_RADIUS,
        small_bottom_hole=SMALL_BOTTOM_HOLE,
        small_top_hole=SMALL_TOP_HOLE,
        big_middle_hole=BIG_MIDDLE_HOLE,
        big_hole_left=BIG_HOLE_LEFT,
        big_hole_right=BIG_HOLE_RIGHT,
        position_offset=support_platform_offset);
      

/*
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


*/