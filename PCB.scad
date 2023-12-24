
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
                    import(file = "images/top-pcb.svg", dpi=DPI);
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

