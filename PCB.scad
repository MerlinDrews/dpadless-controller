
module PCB (
    big_hole_radius,
    small_hole_radius,
    PCB_thickness,
    small_bottom_hole,
    small_top_hole,
    big_middle_hole,
    big_hole_left,
    big_hole_right
) {
    $fn = 60;
    DPI = 702;
    offset_position = [-19,-31,0];
    main_button_radius=3;
    select_button_size = [4.8,4.8,2];
    color("Green") {
        union() {
            difference(){
                rotate([0,0,1.5])
                translate(offset_position)
                linear_extrude(PCB_thickness) {
                    import(file = "images/top-pcb.svg", dpi=DPI);
                }

                // small bottom hole
                translate(small_bottom_hole)
                    cylinder(PCB_thickness+3, small_hole_radius, small_hole_radius);

                // small top hole
                translate(small_top_hole)
                    cylinder(PCB_thickness+3, small_hole_radius, small_hole_radius);
                
                //middle bigger hole
                translate(big_middle_hole)
                    cylinder(PCB_thickness+3, big_hole_radius, big_hole_radius);
                
                //bigger hole left
                translate(big_hole_left)
                    cylinder(PCB_thickness+3, big_hole_radius, big_hole_radius);
                
                //bigger hole right
                translate(big_hole_right)
                    cylinder(PCB_thickness+3, big_hole_radius, big_hole_radius);
            }

            //left select button
            translate([44,8.4,0])
               cube(select_button_size);
            
            //right select button
            translate([59,8.4,0])
               cube(select_button_size);
            
            //middle start button
            translate([51+main_button_radius,22+main_button_radius,0])
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
//            translate([35,36,-7.5])
            translate([35.8,28,-6.7])
                cube([38.8,24,6.7]);
                
            // usb connector  
            translate([52,52,-3])
                cube([7.7,5.5,3]);

            //reset button 
            translate([26.9,38.5,-6.5])
                cube([4.5,4.5,6.5]);

            //rumble connector right
            translate([99.9,31.3,-3.4])
            rotate([0,0,45])
              cube([7.5,4.3,3.4]);

            //shoulder button right
            translate([90,42,-3.7])
            rotate([0,0,-33])
              cube([7.5,6,3.7]);

            // rumble connector left
            translate([6.3,30.5,-3.4])
            rotate([0,0,-45])
              cube([7.5,4.3,3.4]);

            // shoulder button left
            translate([15,38,-3.7])
            rotate([0,0,33])
              cube([7.5,6,3.7]);


	   translate([78.7,35.1,-5])
	   	cube([8.3,5.9,5]);
        }
    }

}

