module button_housing(
  button_hole_radius,
  button_housing_factor,
  button_stopper_height,
  button_stopper_width_with_clearance) {
  difference() {
    cylinder(
      3,
      button_hole_radius*button_housing_factor,
      button_hole_radius*button_housing_factor);
    translate([
      -10,
      -button_stopper_width_with_clearance/2,
      button_stopper_height-5])
    cube([
      button_hole_radius*4,
      button_stopper_width_with_clearance,
      button_stopper_height]);
  } 
}
