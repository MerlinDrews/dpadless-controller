use <shell.scad>
use <support-plate.scad>

module topshell(
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
      position_offset
){
  union() {
    difference() {

      shell(pcb_width, pcb_height, pcb_thickness);

      translate([
        switch_offset_x_attacks-button_hole_radius-3,
        button_hole_radius+3,
        1.5])
      cylinder(100, button_hole_radius, button_hole_radius);

      translate([
        switch_offset_x_attacks-button_hole_radius,
        (2*switch_offset_distance)-17+button_hole_radius,
        1.5])
      cylinder(100, button_hole_radius, button_hole_radius);

      translate([
        switch_offset_x_directions - 15,
        (2*switch_offset_distance)-12,
        1.5])
      cylinder(100, button_hole_radius, button_hole_radius);

      translate([40,pcb_height+3,-8])
        cube([7,7,3]);

    }

    translate([big_hole_left.x-position_offset,big_hole_left.y,-3])
      screw_hole_cylinder(8,2,1);

    translate([big_middle_hole.x-position_offset,big_middle_hole.y,-3])
      screw_hole_cylinder(8,2,1);

    translate([big_hole_right.x-position_offset,big_hole_right.y,-3])
      screw_hole_cylinder(8,2,1);

    translate([big_middle_hole.x-position_offset,-22+position_offset,-3])
      screw_hole_cylinder(8,2,1);
  }
}