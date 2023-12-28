module button_support_platform(
    pcb_width, 
    pcb_height, 
    pcb_thickness,
    big_hole_radius,
    small_hole_radius
) {
    $fn = 60;
    clearance = 0.1;
    
    main_plate_height = pcb_height/3;
    union() {

        translate([0,main_plate_height,0])
        cube([pcb_width, (pcb_height - main_plate_height), pcb_thickness + 0.5]);
        
        // bottom left big connector
        translate([4.25,43,-1.5])
            screw_hole_cylinder(pcb_thickness + 5, big_hole_radius - clearance, 0.2);
       
        
        // middle big connector
        translate([56.75,52.5,-1.5])
            screw_hole_cylinder(pcb_thickness + 5, big_hole_radius - clearance, 0.2);
        
        // right big connector
        translate([104.25,43,-1.5])
            screw_hole_cylinder(pcb_thickness + 5, big_hole_radius - clearance, 0.2);
        
        // extra big connector
        translate([56.75,25,-1.5])
            screw_hole_cylinder(pcb_thickness + 5, big_hole_radius - clearance, 0.2);
       
        // left (dpad) small connector
        translate([24.25,50,pcb_thickness])
                cylinder(pcb_thickness+1, small_hole_radius - clearance, small_hole_radius - clearance);
            
        // middle (dpad) small connector
        translate([56.75,38.5,pcb_thickness])
                cylinder(pcb_thickness+1, small_hole_radius - clearance, small_hole_radius - clearance);
                
        // up left addittion
        translate([0,55,0])
            cube([pcb_width/4, pcb_height/4, pcb_thickness + 0.5]);
       
        // up right addition
        translate([76.7,55,0])
            cube([pcb_width/3, pcb_height/4, pcb_thickness + 0.5]);
       
    }
    
}


module screw_hole_cylinder (height, outside_radius, wall_thickness) {
    clearance_height = 2;
     
    difference(){
        cylinder(height, outside_radius, outside_radius);
        translate([0,0,-1])
        #cylinder(height + clearance_height, outside_radius - wall_thickness, outside_radius - wall_thickness);
    }
}
