
module PCB (
    big_hole_radius,
    small_hole_radius,
    PCB_thickness
) {
    $fn = 60;
    DPI = 705;
    offset_position = [-19,-31,0];
    main_button_radius=3.5;
    select_button_size = [6,6,2];
    
    union() {
        difference(){
            rotate([0,0,1.5])
            translate(offset_position)
            linear_extrude(PCB_thickness) {
                import(file = "top-pcb.svg", dpi=DPI);
            }

            
            // small bottom hole
            translate([57.5,3.5,-2])
                cylinder(PCB_thickness+3, small_hole_radius, small_hole_radius);

            // small dpad hole
            translate([25,15,-2])
                cylinder(PCB_thickness+3, small_hole_radius, small_hole_radius);
            
            // small top hole
            translate([77,54,-2])
                cylinder(PCB_thickness+3, small_hole_radius, small_hole_radius);
            
            //middle bigger hole
            translate([57.5,17.5,-2])
                cylinder(PCB_thickness+3, big_hole_radius, big_hole_radius);
            
            //bigger hole left
            translate([5,8,-2])
                cylinder(PCB_thickness+3, big_hole_radius, big_hole_radius);
            
            //bigger hole right
            translate([105,8,-2])
                cylinder(PCB_thickness+3, big_hole_radius, big_hole_radius);
        }

        //left select button
        translate([45,8,0])
           cube(select_button_size);
        
        //right select button
        translate([60,8,0])
           cube(select_button_size);
        
        //middle bigger hole
        translate([55,25,0])
            cylinder(PCB_thickness+0.25, main_button_radius, main_button_radius);
        
        // left upper button
        translate([75,23,0])
            cylinder(PCB_thickness+0.25, main_button_radius, main_button_radius);

        // middle upper button
        translate([87,29,0])
            cylinder(PCB_thickness+0.25, main_button_radius, main_button_radius);
        
        // right upper button
        translate([102,31,0])
            cylinder(PCB_thickness+0.25, main_button_radius, main_button_radius);
        
        // left lower button
        translate([78,6,0])
            cylinder(PCB_thickness+0.25, main_button_radius, main_button_radius);
            
        // middle lower button
        translate([94,13,0])
            cylinder(PCB_thickness+0.25, main_button_radius, main_button_radius);
           
        // right lower button 
        translate([110,16,0])
            cylinder(PCB_thickness+0.25, main_button_radius, main_button_radius);
            
        // battery
        translate([35,30,-7.5])
            cube([40,24,6]);
            
        // usb connector  
        translate([52,54,-3])
            cube([9,6,3]);
    }

}

module button_support_platform(
    pcb_width, 
    pcb_height, 
    pcb_thickness,
    big_hole_radius,
    small_hole_radius
) {
    $fn = 60;
    clearance = 0.1;
    union() {

        cube([pcb_width, pcb_height, pcb_thickness + 0.5]);
        
        // bottom left big connector
        translate([5,43,0.5])
            screw_hole_cylinder(pcb_thickness + 2, big_hole_radius - clearance, 0.2);
        
        // middle big connector
        translate([57.5,52.5,0.5])
            screw_hole_cylinder(pcb_thickness + 2, big_hole_radius - clearance, 0.2);
        
        // right big connector
        translate([105,43,0.5])
            screw_hole_cylinder(pcb_thickness + 2, big_hole_radius - clearance, 0.2);
     
       
       // left (dpad) small connector
       translate([25,50,pcb_thickness])
                cylinder(pcb_thickness+1, small_hole_radius - clearance, small_hole_radius - clearance);
            
       // middle (dpad) small connector
       translate([57.5,38.5,pcb_thickness])
                cylinder(pcb_thickness+1, small_hole_radius - clearance, small_hole_radius - clearance);
    }
    
}

module screw_hole_cylinder (height, outside_radius, wall_thickness) {
    clearance_height = 1;
     
    difference(){
        cylinder(height, outside_radius, outside_radius);
        translate([0,0,0])
        #cylinder(height + clearance_height, outside_radius - wall_thickness, outside_radius - wall_thickness);
    }
}

pcb_thickness = 1.5;

PCB(
    big_hole_radius=2.5, 
    small_hole_radius=1, 
    PCB_thickness=pcb_thickness);

translate([0,-35,-pcb_thickness])  
    button_support_platform(
        pcb_width=115, 
        pcb_height=56.5, 
        pcb_thickness=1.5, 
        big_hole_radius=2.5,
        small_hole_radius=1);