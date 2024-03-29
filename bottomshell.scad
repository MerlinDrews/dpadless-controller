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
  screw_hole_z = -6;
  screw_hole_height = 11;
  screw_hole_offset = 7;

  position_offset_space = position_offset;
  union() {
    difference() {
      union () {
        shell(pcb_width, pcb_height, pcb_thickness);

        button_housing_factor = 1.4;
        button_stopper_width_with_clearance = 3.2;
        button_stopper_height = 4;

        translate([right_pos.x-position_offset, -right_pos.y+position_offset+6, 2.1])
        button_housing(
          button_hole_radius,
          button_housing_factor,
          button_stopper_height,
          button_stopper_width_with_clearance);

        translate([down_pos.x-position_offset, -down_pos.y+position_offset+6, 2.1])
        button_housing(
          button_hole_radius,
          button_housing_factor,
          button_stopper_height,
          button_stopper_width_with_clearance);

        translate([left_pos.x-position_offset, -left_pos.y+position_offset+6, 2.1])
        button_housing(
          button_hole_radius,
          button_housing_factor,
          button_stopper_height,
          button_stopper_width_with_clearance);

        translate([lp_pos.x-position_offset, -lp_pos.y+position_offset+6, 2.1])
        button_housing(
          button_hole_radius,
          button_housing_factor,
          button_stopper_height,
          button_stopper_width_with_clearance);

        translate([mp_pos.x-position_offset, -mp_pos.y+position_offset+6, 2.1])
        button_housing(
          button_hole_radius,
          button_housing_factor,
          button_stopper_height,
          button_stopper_width_with_clearance);

        translate([hp_pos.x-position_offset, -hp_pos.y+position_offset+6, 2.1])
        button_housing(
          button_hole_radius,
          button_housing_factor,
          button_stopper_height,
          button_stopper_width_with_clearance);

        translate([lk_pos.x-position_offset_space, -lk_pos.y+position_offset+6, 2.1])
        button_housing(
          button_hole_radius,
          button_housing_factor,
          button_stopper_height,
          button_stopper_width_with_clearance);

        translate([mk_pos.x-position_offset_space, -mk_pos.y+position_offset+6, 2.1])
        button_housing(
          button_hole_radius,
          button_housing_factor,
          button_stopper_height,
          button_stopper_width_with_clearance);

        translate([hk_pos.x-position_offset_space, -hk_pos.y+position_offset+6, 2.1])
        button_housing(
          button_hole_radius,
          button_housing_factor,
          button_stopper_height,
          button_stopper_width_with_clearance);

      }

      translate([right_pos.x-position_offset, -right_pos.y+position_offset+6, 1.5])
      cylinder(100, button_hole_radius, button_hole_radius);

      translate([down_pos.x-position_offset, -down_pos.y+position_offset+6, 1.5])
      cylinder(100, button_hole_radius, button_hole_radius);

      translate([left_pos.x-position_offset, -left_pos.y+position_offset+6, 1.5])
      cylinder(100, button_hole_radius, button_hole_radius);

      translate([lp_pos.x-position_offset, -lp_pos.y+position_offset+6, 1.5])
      cylinder(100, button_hole_radius, button_hole_radius);

      translate([mp_pos.x-position_offset, -mp_pos.y+position_offset+6, 1.5])
      cylinder(100, button_hole_radius, button_hole_radius);

      translate([hp_pos.x-position_offset, -hp_pos.y+position_offset+6, 1.5])
      cylinder(100, button_hole_radius, button_hole_radius);

      translate([lk_pos.x-position_offset_space, -lk_pos.y+position_offset+6, 1.5])
      cylinder(100, button_hole_radius, button_hole_radius);

      translate([mk_pos.x-position_offset_space, -mk_pos.y+position_offset+6, 1.5])
      cylinder(100, button_hole_radius, button_hole_radius);

      translate([hk_pos.x-position_offset_space, -hk_pos.y+position_offset+6, 1.5])
      cylinder(100, button_hole_radius, button_hole_radius);

      translate([40,-pcb_height+16,-7.5])
        cube([7,8,3]);


      translate([-60,-80,-44])
        cube([200,200,40]);


  screw_head_spacing_height = 100;
  screw_head_spacing_diameter = 4;
	translate([0-screw_hole_offset*2,0-screw_hole_offset*4.5-1.7,4.9])
  regular_cylinder(screw_head_spacing_height,screw_head_spacing_diameter); 

	translate([pcb_width-screw_hole_offset,0-screw_hole_offset*4.5-1.7,4.9])
  regular_cylinder(screw_head_spacing_height,screw_head_spacing_diameter); 

	translate([0-screw_hole_offset*2,pcb_height-1.7,4.9])
  regular_cylinder(screw_head_spacing_height,screw_head_spacing_diameter); 

  translate([pcb_width-screw_hole_offset,pcb_height-1.7,4.9])
  regular_cylinder(screw_head_spacing_height,screw_head_spacing_diameter); 

  translate([big_hole_left.x-position_offset,big_hole_left.y+position_offset-1.7,4.9])
  regular_cylinder(screw_head_spacing_height,screw_head_spacing_diameter); 
	
	translate([big_middle_hole.x-position_offset,big_middle_hole.y-position_offset+2.2,4.9])
  regular_cylinder(screw_head_spacing_height,screw_head_spacing_diameter); 
	
//	translate([big_hole_right.x-position_offset,big_hole_right.y,1.5])
    translate([big_hole_right.x-position_offset,big_hole_right.y+position_offset-1.7,4.9])
  regular_cylinder(screw_head_spacing_height,screw_head_spacing_diameter); 
	
	translate([big_middle_hole.x-position_offset,44-position_offset+2.2, 4.9])
  regular_cylinder(screw_head_spacing_height,screw_head_spacing_diameter); 
    }


    translate([0-screw_hole_offset*2,0-screw_hole_offset*4.5-1.7,screw_hole_z])
      screw_hole_cylinder(screw_hole_height,2.01,1);

    translate([pcb_width-screw_hole_offset,0-screw_hole_offset*4.5-1.7,screw_hole_z])
      screw_hole_cylinder(screw_hole_height,2.01,1);

    translate([0-screw_hole_offset*2,pcb_height-1.7,screw_hole_z])
      screw_hole_cylinder(screw_hole_height,2.01,1);

    translate([pcb_width-screw_hole_offset,pcb_height-1.7,screw_hole_z])
      screw_hole_cylinder(screw_hole_height,2.01,1);

    translate([big_hole_left.x-position_offset,big_hole_left.y+position_offset-1.7,screw_hole_z])
      screw_hole_cylinder(screw_hole_height,2.01,1);

    translate([big_middle_hole.x-position_offset,big_middle_hole.y-position_offset+2.2,screw_hole_z])
      screw_hole_cylinder(screw_hole_height,2.01,1);

    translate([big_hole_right.x-position_offset,big_hole_right.y+position_offset-1.7,screw_hole_z])
      screw_hole_cylinder(screw_hole_height,2.01,1);

    translate([big_middle_hole.x-position_offset,44-position_offset+2.2,screw_hole_z])
      screw_hole_cylinder(screw_hole_height,2.01,1);

    //standoffs
    //
    // PCB standoff
    standoff_height = 10;
    standoff_z = -4;
    color("purple"){
    translate([28,-1.5,standoff_z-2])
     cube([28,3,standoff_height+2]);
    
    translate([28,15.5,standoff_z])
     cube([28,3,standoff_height]);
    
    translate([28,36,standoff_z])
     cube([28,3,standoff_height]);
    
    translate([-10,36,standoff_z])
     cube([10,3,standoff_height]);
    
    translate([100,30,standoff_z])
     cube([3,10,standoff_height]);
    
    translate([100,5,standoff_z])
     cube([3,10,standoff_height]);
    
    translate([-10,5,standoff_z])
     cube([3,10,standoff_height]);
     }
  }
}

module regular_cylinder(height, diameter) {
    cylinder(height, diameter/2, diameter/2);
}


