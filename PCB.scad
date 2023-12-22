
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
        translate([86.25,55,0])
            cube([pcb_width/4, pcb_height/4, pcb_thickness + 0.5]);
       
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


module silent_switch (){
    $fn = 60;
    throng_height = 3.3;
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

module top_shell(
    pcb_width,
    pcb_height,
    pcb_thickness) {
        
    main_plate_height = pcb_height/3;
    width_overhang = 9;
    height_overhang = 9;
    shell_thickness = 10;
    shell_strength = 5;
    
    cube_height = pcb_width+(2*width_overhang);
    cube_width = pcb_height + main_plate_height + height_overhang*2;
        
    color("pink") {  
        difference(){
        
            
            translate([-width_overhang,-(main_plate_height+height_overhang),pcb_thickness])
                cube([
                        cube_height, 
                        cube_width, 
                        shell_thickness]);
        
            translate([-(width_overhang-shell_strength/2),-(main_plate_height+height_overhang)+shell_strength/2,pcb_thickness])
                cube([
                        cube_height-shell_strength, 
                        cube_width-shell_strength, 
                        shell_thickness-shell_strength]);
        }
    }
}

switch_offset_x_directions = 20;
switch_offset_distance = 15;

// Right button switch
rotate([180,0,0])
translate([switch_offset_x_directions,-(2*switch_offset_distance),1.5])
silent_switch();

// Down button switch
rotate([180,0,0])
translate([switch_offset_x_directions,-(1*switch_offset_distance),1.5])
silent_switch();

// Left button switch
rotate([180,0,0])
translate([switch_offset_x_directions,-(0*switch_offset_distance),1.5])
silent_switch();

switch_offset_x_attacks = 80;

// LP button switch
rotate([180,0,0])
translate([switch_offset_x_attacks,-(2*switch_offset_distance),1.5])
silent_switch();

// MP button switch
rotate([180,0,0])
translate([switch_offset_x_attacks,-(1*switch_offset_distance),1.5])
silent_switch();

// HP button switch
rotate([180,0,0])
translate([switch_offset_x_attacks,-(0*switch_offset_distance),1.5])
silent_switch();


// LK button switch
rotate([180,0,0])
translate([switch_offset_x_attacks+switch_offset_distance,-(2*switch_offset_distance),1.5])
silent_switch();


// MK button switch
rotate([180,0,0])
translate([switch_offset_x_attacks+switch_offset_distance,-(1*switch_offset_distance),1.5])
silent_switch();


// HK button switch
rotate([180,0,0])
translate([switch_offset_x_attacks+switch_offset_distance,-(0*switch_offset_distance),1.5])
silent_switch();


// right face button switch
translate([switch_offset_x_attacks+switch_offset_distance - 11,(2*switch_offset_distance)-15,1.5])
silent_switch();


// right face button switch
translate([switch_offset_x_attacks+switch_offset_distance - 3,2*(switch_offset_distance)-8,1.5])
silent_switch();


// right face button switch
translate([switch_offset_x_attacks+switch_offset_distance - 14,5,1.5])
silent_switch();


// left face button switch
translate([switch_offset_x_directions - 6, (2*switch_offset_distance)-15,1.5])
silent_switch();


// left face button switch
translate([switch_offset_x_directions - 14, 2*(switch_offset_distance)-8,1.5])
silent_switch();


// left face button switch
translate([switch_offset_x_directions - 5, 5,1.5])
silent_switch();



PCB_THICKNESS = 1.5;
PCB_HEIGHT = 56.5;
PCB_WIDTH = 115;

PCB(
    big_hole_radius=2.5, 
    small_hole_radius=1, 
    PCB_thickness=PCB_THICKNESS);

translate([0.75,-35,-(PCB_THICKNESS+0.5)])  
    button_support_platform(
        pcb_width=PCB_WIDTH, 
        pcb_height=PCB_HEIGHT, 
        pcb_thickness=PCB_THICKNESS, 
        big_hole_radius=2.5,
        small_hole_radius=1);
        
translate([0,0,10])
    top_shell(PCB_WIDTH, PCB_HEIGHT, PCB_THICKNESS);