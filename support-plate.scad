module button_support_platform(
    pcb_width, 
    pcb_height, 
    pcb_thickness,
    big_hole_radius,
    small_hole_radius,
    small_bottom_hole,
    small_top_hole,
    big_middle_hole,
    big_hole_left,
    big_hole_right,
    position_offset
) {
    $fn = 60;
    clearance = 0.1;
    
    main_plate_height = pcb_height/3;
    difference() {
      union() {

          translate([0,main_plate_height,0])
          cube([pcb_width, (pcb_height - main_plate_height), pcb_thickness + 0.5]);

          // middle small connector
          translate([small_bottom_hole.x,small_bottom_hole.y + position_offset,pcb_thickness])
                  cylinder(pcb_thickness+1, small_hole_radius - clearance, small_hole_radius - clearance);
                  
          // up left addittion
          translate([0,54,0])
              cube([pcb_width/4, pcb_height/4, pcb_thickness + 0.5]);
         
          // up right addition
          translate([77.8,54,0])
              cube([pcb_width/3, pcb_height/4, pcb_thickness + 0.5]);
         
      }

      // bottom left big connector
      translate([big_hole_left.x,big_hole_left.y+position_offset,-1.5])
         cylinder(pcb_thickness + 5, big_hole_radius, big_hole_radius);
     
      
      // middle big connector
      translate([big_middle_hole.x,big_middle_hole.y+position_offset,-1.5])
          cylinder(pcb_thickness + 5, big_hole_radius, big_hole_radius);
      
      // right big connector
      translate([big_hole_right.x,big_hole_right.y+position_offset,-1.5])
          cylinder(pcb_thickness + 5, big_hole_radius, big_hole_radius);
      
      // extra big connector
      translate([big_middle_hole.x,25,-1.5])
          cylinder(pcb_thickness + 5, big_hole_radius, big_hole_radius);

// cable channel
 	translate([big_middle_hole.x,30,0])
#	cube([20,5,20]);
       
 	translate([big_middle_hole.x-20,30,0])
#	cube([20,5,20]);
  }
    
}


module screw_hole_cylinder (height, outside_radius, wall_thickness) {
    clearance_height = 2;
     
    difference(){
        cylinder(height, outside_radius, outside_radius);
        translate([0,0,-1])
        cylinder(height + clearance_height, outside_radius - wall_thickness, outside_radius - wall_thickness);
    }
}
