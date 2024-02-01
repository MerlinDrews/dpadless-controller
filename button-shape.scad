
module button(button_height, button_radius){
  $fn=60;
  color("skyblue") {
    union() {
      button_stopper_width = 3;
      difference() {
        translate([0,0,-7.2])
        sphere(18);
        translate([-20,-20,-100+button_height])
        cube([40, 40, 100]);
       difference() {
         cylinder(button_height*2, button_radius*2, button_radius*2);
          cylinder(button_height+4,button_radius,button_radius);
       }
      }
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
      difference() {
        translate([0,0,0])
        sphere(18);
        translate([-20,-20,-100+button_height])
        cube([40, 40, 100]);
       difference() {
         cylinder(button_height*2, button_radius*2, button_radius*2);
          cylinder(button_height+4,button_radius,button_radius);
       }
      }
      cylinder(button_height,button_radius,button_radius);

      translate([-button_radius*1.25,-button_stopper_width/2,stopper_z])
        cube([button_radius*2.5,button_stopper_width, 2]);
    }
  }
}
