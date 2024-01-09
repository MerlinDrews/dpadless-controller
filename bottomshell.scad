use <shell.scad>
use <support-plate.scad>
use <button-shape.scad>
use <button-housing.scad>

module bottomshell(
      button_hole_radius,
      pcb_width,
      pcb_thickness,
      pcb_height,
      switch_offset_x_attacks,
      switch_offset_x_directions,
      switch_offset_distance,
      big_middle_hole,
      big_hole_left,
      big_hole_right,
      right_pos,
      down_pos,
      left_pos,
      lp_pos,
      mp_pos,
      hp_pos,
      lk_pos,
      mk_pos,
      hk_pos,
      position_offset
){
  $fn = 60;
  screw_hole_z = -10;
  screw_hole_height = 15;
  screw_hole_offset = 7;
  union() {
    difference() {
      union () {
        shell(pcb_width, pcb_height, pcb_thickness);

        button_housing_factor = 1.4;
        button_stopper_width_with_clearance = 3.2;
        button_stopper_height = 4;

        translate([right_pos.x-position_offset, -right_pos.y, 2])
        button_housing(
          button_hole_radius,
          button_housing_factor,
          button_stopper_height,
          button_stopper_width_with_clearance);

        translate([down_pos.x-position_offset, -down_pos.y, 2])
        button_housing(
          button_hole_radius,
          button_housing_factor,
          button_stopper_height,
          button_stopper_width_with_clearance);

        translate([left_pos.x-position_offset, -left_pos.y, 2])
        button_housing(
          button_hole_radius,
          button_housing_factor,
          button_stopper_height,
          button_stopper_width_with_clearance);

        translate([lp_pos.x-position_offset, -lp_pos.y, 2])
        button_housing(
          button_hole_radius,
          button_housing_factor,
          button_stopper_height,
          button_stopper_width_with_clearance);

        translate([mp_pos.x-position_offset, -mp_pos.y, 2])
        button_housing(
          button_hole_radius,
          button_housing_factor,
          button_stopper_height,
          button_stopper_width_with_clearance);

        translate([hp_pos.x-position_offset, -hp_pos.y, 2])
        button_housing(
          button_hole_radius,
          button_housing_factor,
          button_stopper_height,
          button_stopper_width_with_clearance);

        translate([lk_pos.x-position_offset, -lk_pos.y, 2])
        button_housing(
          button_hole_radius,
          button_housing_factor,
          button_stopper_height,
          button_stopper_width_with_clearance);

        translate([mk_pos.x-position_offset, -mk_pos.y, 2])
        button_housing(
          button_hole_radius,
          button_housing_factor,
          button_stopper_height,
          button_stopper_width_with_clearance);

        translate([hk_pos.x-position_offset, -hk_pos.y, 2])
        button_housing(
          button_hole_radius,
          button_housing_factor,
          button_stopper_height,
          button_stopper_width_with_clearance);
	
	translate([20,-20,screw_hole_z])
	cube([3,10,20]);
      }

      translate([right_pos.x-position_offset, -right_pos.y, 1.5])
      cylinder(100, button_hole_radius, button_hole_radius);

      translate([down_pos.x-position_offset, -down_pos.y, 1.5])
      cylinder(100, button_hole_radius, button_hole_radius);

      translate([left_pos.x-position_offset, -left_pos.y, 1.5])
      cylinder(100, button_hole_radius, button_hole_radius);

      translate([lp_pos.x-position_offset, -lp_pos.y, 1.5])
      cylinder(100, button_hole_radius, button_hole_radius);

      translate([mp_pos.x-position_offset, -mp_pos.y, 1.5])
      cylinder(100, button_hole_radius, button_hole_radius);

      translate([hp_pos.x-position_offset, -hp_pos.y, 1.5])
      cylinder(100, button_hole_radius, button_hole_radius);

      translate([lk_pos.x-position_offset, -lk_pos.y, 1.5])
      cylinder(100, button_hole_radius, button_hole_radius);

      translate([mk_pos.x-position_offset, -mk_pos.y, 1.5])
      cylinder(100, button_hole_radius, button_hole_radius);

      translate([hk_pos.x-position_offset, -hk_pos.y, 1.5])
      cylinder(100, button_hole_radius, button_hole_radius);

      translate([40,-pcb_height+16,-7.5])
        cube([7,8,3]);


      translate([-60,-80,-44])
        cube([200,200,40]);
    }


    translate([0-screw_hole_offset*2,0-screw_hole_offset*4.5,screw_hole_z])
      screw_hole_cylinder(screw_hole_height,2,1);

    translate([pcb_width-screw_hole_offset,0-screw_hole_offset*4.5,screw_hole_z])
      screw_hole_cylinder(screw_hole_height,2,1);

    translate([0-screw_hole_offset*2,pcb_height,screw_hole_z])
      screw_hole_cylinder(screw_hole_height,2,1);

    translate([pcb_width-screw_hole_offset,pcb_height,screw_hole_z])
      screw_hole_cylinder(screw_hole_height,2,1);

    translate([big_hole_left.x-position_offset,big_hole_left.y,screw_hole_z])
      screw_hole_cylinder(screw_hole_height,2,1);

    translate([big_middle_hole.x-position_offset,big_middle_hole.y,screw_hole_z])
      screw_hole_cylinder(screw_hole_height,2,1);

    translate([big_hole_right.x-position_offset,big_hole_right.y,screw_hole_z])
      screw_hole_cylinder(screw_hole_height,2,1);

    translate([big_middle_hole.x-position_offset,-22+position_offset,screw_hole_z])
#      screw_hole_cylinder(screw_hole_height,2,1);

  }
}


