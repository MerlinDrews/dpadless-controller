
module button(button_height, button_radius){
  $fn=60;
  color("skyblue") {
    union() {
      button_stopper_width = 3;
      cylinder(button_height,button_radius,button_radius);

      translate([-button_radius*2,-button_stopper_width/2,0])
        cube([button_radius*4,button_stopper_width, 2]);
    }
  }
}
