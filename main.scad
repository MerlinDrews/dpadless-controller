use <PCB.scad>
use <silent-switch.scad>
use <shell.scad>
use <topshell.scad>
use <support-plate.scad>
use <button-shape.scad>


//positions of silent switches for buttons
include <microswitch-positions.scad>


PCB_THICKNESS = 1.3;
PCB_HEIGHT = 57.2;
PCB_WIDTH = 116.7;

BIG_HOLE_RADIUS = 2;
SMALL_HOLE_RADIUS = 0.5;

BUTTON_HOLE_RADIUS = 5;


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
      


// Top shell
top_shell_offset = 12;
//proper distance
//translate([top_shell_offset,0,6])
translate([top_shell_offset,0,50])
    topshell(
      button_hole_radius=BUTTON_HOLE_RADIUS,
      pcb_width=PCB_WIDTH,
      pcb_thickness=PCB_THICKNESS,
      pcb_height=PCB_HEIGHT,
      switch_offset_x_attacks=switch_offset_x_attacks,
      switch_offset_x_directions=switch_offset_x_directions,
      switch_offset_distance=switch_offset_distance,
      big_middle_hole=BIG_MIDDLE_HOLE,
      big_hole_left=BIG_HOLE_LEFT,
      big_hole_right=BIG_HOLE_RIGHT,
      position_offset=top_shell_offset);

BUTTON_HEIGHT = 10;

translate([switch_offset_x_directions-3,2*switch_offset_distance-17+BUTTON_HOLE_RADIUS,9])
  button(
    button_height=BUTTON_HEIGHT,
    button_radius=BUTTON_HOLE_RADIUS-0.07
  );

translate([switch_offset_x_attacks+7,2*switch_offset_distance-17+BUTTON_HOLE_RADIUS,9])
  button(
    button_height=BUTTON_HEIGHT,
    button_radius=BUTTON_HOLE_RADIUS-0.07
  );

translate([switch_offset_x_attacks+4,2*switch_offset_distance-22,9])
  button(
    button_height=BUTTON_HEIGHT,
    button_radius=BUTTON_HOLE_RADIUS-0.07
  );
// Bottom shell
rotate([180,0,0])
  translate([12,-PCB_HEIGHT+19,10])
      #shell(PCB_WIDTH, PCB_HEIGHT, PCB_THICKNESS);

