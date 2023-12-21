
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
    color("Green") {
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
        translate([4.25,43,0.5])
            screw_hole_cylinder(pcb_thickness + 2, big_hole_radius - clearance, 0.2);
        
        // middle big connector
        translate([56.75,52.5,0.5])
            screw_hole_cylinder(pcb_thickness + 2, big_hole_radius - clearance, 0.2);
        
        // right big connector
        translate([104.25,43,0.5])
            screw_hole_cylinder(pcb_thickness + 2, big_hole_radius - clearance, 0.2);
     
       
       // left (dpad) small connector
       translate([24.25,50,pcb_thickness])
                cylinder(pcb_thickness+1, small_hole_radius - clearance, small_hole_radius - clearance);
            
       // middle (dpad) small connector
       translate([56.75,38.5,pcb_thickness])
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


module silent_switch (){
    $fn = 60;
    throng_height = 3.3;
//        throng_width_wide = 1.3;
    throng_width = 1.1;
    throng_thickness = 0.25;
    throng_distance = 5;
    throng_offset = 1.1;
    
    module throng(throng_height, throng_width, throng_thickness){
        #cube([throng_thickness, throng_width, throng_height]);
    }
    
    color("Blue"){
        cylinder_height = 1.5;
        cube_side = 6.2;
        cube_height = 6.5;
        

        union(){
            cube([cube_side,cube_side, cube_height]);
            translate([cube_side/2, cube_side/2, cube_height])
                cylinder(0.8,cylinder_height,cylinder_height);
            rotate([0,0,90])
                translate([cube_side/2-throng_thickness/2,-throng_offset,-3.3])
                #throng(throng_height, throng_width, throng_thickness);
            
            rotate([0,0,90])
                translate([cube_side/2-throng_thickness/2,-(throng_offset + throng_distance),-3.3])
                throng(throng_height, throng_width, throng_thickness);
        }
        
        
    }
}

translate([0,0,20])
silent_switch();

pcb_thickness = 1.5;

PCB(
    big_hole_radius=2.5, 
    small_hole_radius=1, 
    PCB_thickness=pcb_thickness);

translate([0.75,-35,-pcb_thickness])  
    button_support_platform(
        pcb_width=115, 
        pcb_height=56.5, 
        pcb_thickness=1.5, 
        big_hole_radius=2.5,
        small_hole_radius=1);