use <shell.scad>
use <support-plate.scad>
use <button-shape.scad>
use <button-housing.scad>

module topshell(
      button_hole_radius,
      pcb_width,
      pcb_thickness,
      pcb_height,
      switch_offset_x_attacks,
      switch_offset_x_directions,
      switch_offset_distance,
      jump_button,
      shoulder1_button,
      shoulder2_button,
      big_middle_hole,
      big_hole_left,
      big_hole_right,
      start_button,
      select_button_left,
      select_button_right,
      position_offset
){
  $fn = 60;
  right_side_button_1 = [
        switch_offset_x_attacks-button_hole_radius-3,
        button_hole_radius+3,
        1.5];
  right_side_button_2 = [
        switch_offset_x_attacks-button_hole_radius,
        (2*switch_offset_distance)-17+button_hole_radius,
        1.5];

  left_side_button_1 = [
        switch_offset_x_directions - 15,
        (2*switch_offset_distance)-12,
        1.5];

  union() {
    difference() {
      union () {
        shell(pcb_width, pcb_height, pcb_thickness);

        button_housing_factor = 1.4;
        button_stopper_width_with_clearance = 3.2;
        button_stopper_height = 4;

        translate([jump_button.x-position_offset, jump_button.y, 2])
        button_housing(
          button_hole_radius,
          button_housing_factor,
          button_stopper_height,
          button_stopper_width_with_clearance);

        translate([shoulder2_button.x-position_offset, shoulder2_button.y, 2])
        button_housing(
          button_hole_radius,
          button_housing_factor,
          button_stopper_height,
          button_stopper_width_with_clearance);

        translate([shoulder1_button.x-position_offset, shoulder1_button.y, 2])
        button_housing(
          button_hole_radius,
          button_housing_factor,
          button_stopper_height,
          button_stopper_width_with_clearance);

/*        translate([right_side_button_2.x, right_side_button_2.y, 2])
        button_housing(
          button_hole_radius,
          button_housing_factor,
          button_stopper_height,
          button_stopper_width_with_clearance);
*/
        translate([start_button.x-position_offset, start_button.y, 2]) button_housing(
          button_hole_radius,
          button_housing_factor,
          button_stopper_height,
          button_stopper_width_with_clearance);

        translate([select_button_left.x-position_offset, select_button_left.y, 2])
	rotate([0,0,90])
        button_housing(
          button_hole_radius,
          button_housing_factor,
          button_stopper_height,
          button_stopper_width_with_clearance);

        translate([select_button_right.x-position_offset, select_button_right.y, 2])
	rotate([0,0,90])
        button_housing(
          button_hole_radius,
          button_housing_factor,
          button_stopper_height,
          button_stopper_width_with_clearance);
      }

      translate([shoulder2_button.x-position_offset, shoulder2_button.y, 1.5])
      cylinder(100, button_hole_radius, button_hole_radius);

      translate([shoulder1_button.x-position_offset,shoulder1_button.y, 1.5])
      cylinder(100, button_hole_radius, button_hole_radius);

      translate([jump_button.x-position_offset, jump_button.y, 1.5])
      cylinder(100, button_hole_radius, button_hole_radius);

      translate([start_button.x-position_offset, start_button.y, 1.5])
      cylinder(100, button_hole_radius, button_hole_radius);

      translate([select_button_left.x-position_offset, select_button_left.y, 1.5])
      cylinder(100, button_hole_radius, button_hole_radius);

      translate([select_button_right.x-position_offset, select_button_right.y, 1.5])
      cylinder(100, button_hole_radius, button_hole_radius);

      translate([40,pcb_height+3,-8])
        cube([7,7,3]);

      LED_X = 48;
      // LED 1 hole
      translate([LED_X-position_offset, 46, 1.5])
        cube([0.8,1.6,20]);
      
      // LED 2 hole
      translate([LED_X+5-position_offset, 46, 1.5])
        cube([0.8,1.6,20]);
      
      // LED 3 hole
      translate([LED_X+10-position_offset, 46, 1.5])
        cube([0.8,1.6,20]);
          
      // LED 4 hole
      translate([LED_X+15-position_offset, 46, 1.5])
        cube([0.8,1.6,20]);


    }

    screw_hole_z = -4.5;
    screw_hole_height = 9.5;
    screw_hole_offset = 7;

    translate([0-screw_hole_offset*2,0-screw_hole_offset*4.5,screw_hole_z-1.5])
      screw_hole_cylinder(screw_hole_height+1.5,3.1,1.3);

    translate([pcb_width-screw_hole_offset,0-screw_hole_offset*4.5,screw_hole_z-1.5])
      screw_hole_cylinder(screw_hole_height+1.5,3.1,1.3);

    translate([0-screw_hole_offset*2,pcb_height,screw_hole_z-1.5])
     screw_hole_cylinder(screw_hole_height+1.5,3.1,1.3);

    translate([pcb_width-screw_hole_offset,pcb_height,screw_hole_z-1.5])
      screw_hole_cylinder(screw_hole_height+1.5,3.1,1.3);

    translate([big_hole_left.x-position_offset,big_hole_left.y,screw_hole_z])
      screw_hole_cylinder(screw_hole_height,3.1,1.3);

    translate([big_middle_hole.x-position_offset,big_middle_hole.y,screw_hole_z])
      screw_hole_cylinder(screw_hole_height,3.1,1.3);

    translate([big_hole_right.x-position_offset,big_hole_right.y,screw_hole_z])
      screw_hole_cylinder(screw_hole_height,3.1,1.3);

    translate([big_middle_hole.x-position_offset,-22+position_offset,screw_hole_z-1.5])
      screw_hole_cylinder(screw_hole_height+1.5,3.1,1.3);

  }
}


