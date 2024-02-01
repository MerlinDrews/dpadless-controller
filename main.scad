use <PCB.scad>
use <silent-switch.scad>
use <shell.scad>
use <topshell.scad>
use <support-plate.scad>
use <button-shape.scad>
use <bottomshell.scad>


//positions of silent switches for buttons
//include <microswitch-positions.scad>


top_shell_offset = 12;
switch_offset_x_directions = 20;
switch_offset_distance = 15;
switch_offset_x_attacks = 80;

PCB_THICKNESS = 1.3;
PCB_HEIGHT = 57.2;
PCB_WIDTH = 116.7;

BIG_HOLE_RADIUS = 2;
SMALL_HOLE_RADIUS = 0.5;

BUTTON_HOLE_RADIUS = 5;

SMALL_BOTTOM_HOLE = [55+SMALL_HOLE_RADIUS, 2.4+SMALL_HOLE_RADIUS, -PCB_THICKNESS*2];
SMALL_TOP_HOLE = [77.5+SMALL_HOLE_RADIUS, 53.2+SMALL_HOLE_RADIUS, -PCB_THICKNESS*2];
BIG_MIDDLE_HOLE = [53.5+BIG_HOLE_RADIUS, 15+BIG_HOLE_RADIUS, -PCB_THICKNESS*2];
BIG_HOLE_LEFT = [3.5+BIG_HOLE_RADIUS, 4.9+BIG_HOLE_RADIUS, -PCB_THICKNESS*2];
BIG_HOLE_RIGHT = [103.5+BIG_HOLE_RADIUS, 4.9+BIG_HOLE_RADIUS, -PCB_THICKNESS*2];
START_BUTTON= [52+BUTTON_HOLE_RADIUS/2+0.07,23+BUTTON_HOLE_RADIUS/2+0.07,9];
SELECT_BUTTON_LEFT = [44+BUTTON_HOLE_RADIUS/2-0.07,8.4+BUTTON_HOLE_RADIUS/2-0.07,2];
SELECT_BUTTON_RIGHT = [59+BUTTON_HOLE_RADIUS/2-0.07,8.4+BUTTON_HOLE_RADIUS/2-0.07,2];
/*
 * PCB(
    big_hole_radius=BIG_HOLE_RADIUS, 
    small_hole_radius=SMALL_HOLE_RADIUS, 
    PCB_thickness=PCB_THICKNESS,
    small_bottom_hole=SMALL_BOTTOM_HOLE,
    small_top_hole=SMALL_TOP_HOLE,
    big_middle_hole=BIG_MIDDLE_HOLE,
    big_hole_left=BIG_HOLE_LEFT,
    big_hole_right=BIG_HOLE_RIGHT);
*/


support_platform_offset = 35;
/*
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
*/      

// Top shell
//proper distance
//translate([top_shell_offset,0,6.5])
/*
translate([top_shell_offset,0,70])
#    topshell(
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
      jump_button=JUMP_BUTTON_POS,
      shoulder1_button=SHOULDER1_BUTTON_POS, shoulder2_button=SHOULDER2_BUTTON_POS,
      start_button=START_BUTTON,
      select_button_left=SELECT_BUTTON_LEFT,
      select_button_right=SELECT_BUTTON_RIGHT,
      position_offset=top_shell_offset);
*/
BUTTON_HEIGHT = 10;

JUMP_BUTTON_POS = [switch_offset_x_directions+3, (2*switch_offset_distance)+5,9];
SHOULDER1_BUTTON_POS = [switch_offset_x_attacks+12,2*switch_offset_distance+5,9];
SHOULDER2_BUTTON_POS = [switch_offset_x_attacks+4,2*switch_offset_distance-5,9];

/*
translate(JUMP_BUTTON_POS)
  button(
    button_height=BUTTON_HEIGHT,
    button_radius=BUTTON_HOLE_RADIUS-0.07
  );

translate(SHOULDER1_BUTTON_POS)
  button(
    button_height=BUTTON_HEIGHT,
    button_radius=BUTTON_HOLE_RADIUS-0.07
  );

translate(SHOULDER2_BUTTON_POS)
  button(
    button_height=BUTTON_HEIGHT,
    button_radius=BUTTON_HOLE_RADIUS-0.07
  );

// start button
translate(START_BUTTON)
rotate([0,0,0])
  button(
    button_height=BUTTON_HEIGHT,
    button_radius=BUTTON_HOLE_RADIUS-0.07
  );

// select button left
translate(SELECT_BUTTON_LEFT)
rotate([0,0,90])
  button_long(
    button_height=BUTTON_HEIGHT+7,
    button_radius=BUTTON_HOLE_RADIUS-0.07,
    stopper_z=7
  );
*/
// select button right
translate(SELECT_BUTTON_RIGHT)
rotate([0,0,90])
  button_long(
    button_height=BUTTON_HEIGHT+7,
    button_radius=BUTTON_HOLE_RADIUS-0.07,
    stopper_z=7
  );

B_RIGHT_POS = [switch_offset_x_directions+BUTTON_HOLE_RADIUS/2+0.57,-(2*switch_offset_distance)+BUTTON_HOLE_RADIUS/2+9.57,9];
B_DOWN_POS = [switch_offset_x_directions+BUTTON_HOLE_RADIUS/2+0.57,-(1*switch_offset_distance)+BUTTON_HOLE_RADIUS/2+9.57,9];
B_LEFT_POS = [switch_offset_x_directions+BUTTON_HOLE_RADIUS/2+0.57,-(0*switch_offset_distance)+BUTTON_HOLE_RADIUS/2+9.57,9];

B_LP_POS = [switch_offset_x_attacks+BUTTON_HOLE_RADIUS/2+0.57,-(2*switch_offset_distance)+BUTTON_HOLE_RADIUS/2+9.57,9];
B_MP_POS = [switch_offset_x_attacks+BUTTON_HOLE_RADIUS/2+0.57,-(1*switch_offset_distance)+BUTTON_HOLE_RADIUS/2+9.57,9];
B_HP_POS = [switch_offset_x_attacks+BUTTON_HOLE_RADIUS/2+0.57,-(0*switch_offset_distance)+BUTTON_HOLE_RADIUS/2+9.57,9];

B_LK_POS = [switch_offset_x_attacks+switch_offset_distance+BUTTON_HOLE_RADIUS/2+0.57,-(2*switch_offset_distance)+BUTTON_HOLE_RADIUS/2+9.57,9];
B_MK_POS = [switch_offset_x_attacks+switch_offset_distance+BUTTON_HOLE_RADIUS/2+0.57,-(1*switch_offset_distance)+BUTTON_HOLE_RADIUS/2+9.57,9];
B_HK_POS = [switch_offset_x_attacks+switch_offset_distance+BUTTON_HOLE_RADIUS/2+0.57,-(0*switch_offset_distance)+BUTTON_HOLE_RADIUS/2+9.57,9];
/*
// bottom right button
rotate([180,0,0])
translate(B_RIGHT_POS)
  button(
    button_height=BUTTON_HEIGHT,
    button_radius=BUTTON_HOLE_RADIUS-0.07
  );

// bottom down button
rotate([180,0,0])
translate(B_DOWN_POS)
  button(
    button_height=BUTTON_HEIGHT,
    button_radius=BUTTON_HOLE_RADIUS-0.07
  );
// bottom left button
rotate([180,0,0])
translate(B_LEFT_POS)
  button(
    button_height=BUTTON_HEIGHT,
    button_radius=BUTTON_HOLE_RADIUS-0.07
  );

// bottom LP button
rotate([180,0,0])
translate(B_LP_POS)
  button(
    button_height=BUTTON_HEIGHT,
    button_radius=BUTTON_HOLE_RADIUS-0.07
  );
// bottom MP button
rotate([180,0,0])
translate(B_MP_POS)
  button(
    button_height=BUTTON_HEIGHT,
    button_radius=BUTTON_HOLE_RADIUS-0.07
  );
// bottom HP button
rotate([180,0,0])
translate(B_HP_POS)
  button(
    button_height=BUTTON_HEIGHT,
    button_radius=BUTTON_HOLE_RADIUS-0.07
  );
// bottom LK button
rotate([180,0,0])
translate(B_LK_POS)
  button(
    button_height=BUTTON_HEIGHT,
    button_radius=BUTTON_HOLE_RADIUS-0.07
  );
// bottom MK button
rotate([180,0,0])
translate(B_MK_POS)
  button(
    button_height=BUTTON_HEIGHT,
    button_radius=BUTTON_HOLE_RADIUS-0.07
  );
// bottom HK button
rotate([180,0,0])
translate(B_HK_POS)
  button(
    button_height=BUTTON_HEIGHT,
    button_radius=BUTTON_HOLE_RADIUS-0.07
  );
*/
/*
// Bottom shell
rotate([180,0,0])
//  translate([top_shell_offset,-PCB_HEIGHT+33,6])
  translate([top_shell_offset,-PCB_HEIGHT+33,50])
    bottomshell(
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
      right_pos=B_RIGHT_POS,
      down_pos=B_DOWN_POS,
      left_pos=B_LEFT_POS,
      lp_pos=B_LP_POS,
      mp_pos=B_MP_POS,
      hp_pos=B_HP_POS,
      lk_pos=B_LK_POS,
      mk_pos=B_MK_POS,
      hk_pos=B_HK_POS,
      position_offset=top_shell_offset);
*/ 
