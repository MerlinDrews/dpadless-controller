
module button(button_height, button_radius){
  $fn=60;
  color("skyblue") {
    union() {
      button_stopper_width = 3;
      cylinder(button_height,button_radius,button_radius);

      translate([-button_radius*1.25,-button_stopper_width/2,0])
        cube([button_radius*2.5,button_stopper_width, 2]);
    }
  }
}

module button_long(button_height, button_radius, stopper_z){
  $fn=60;
  color("skyblue") {
    union() {
      button_stopper_width = 3;
      cylinder(button_height,button_radius,button_radius);

      translate([-button_radius*1.25,-button_stopper_width/2,stopper_z])
        cube([button_radius*2.5,button_stopper_width, 2]);
    }
  }
}
