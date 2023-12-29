use <shell.scad>

module topshell(
      button_hole_radius,
      pcb_width,
      pcb_thickness,
      pcb_height,
      switch_offset_x_attacks,
      switch_offset_x_directions,
      switch_offset_distance
){
  difference() {

    shell(pcb_width, pcb_height, pcb_thickness);

    translate([
      switch_offset_x_attacks-button_hole_radius-3,
      button_hole_radius+3,
      1.5])
    #cylinder(100, button_hole_radius, button_hole_radius);

    translate([
      switch_offset_x_attacks-button_hole_radius,
      (2*switch_offset_distance)-17+button_hole_radius,
      1.5])
    #cylinder(100, button_hole_radius, button_hole_radius);

    translate([
      switch_offset_x_directions - 15,
      (2*switch_offset_distance)-12,
      1.5])
    #cylinder(100, button_hole_radius, button_hole_radius);

    }
}