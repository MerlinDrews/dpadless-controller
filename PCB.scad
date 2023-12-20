DPI = 705;
offset_position = [-19,-31,0];
PCB_height = 1.5;

small_hole_radius = 1;

big_hole_radius=2.5;

main_button_radius=3.5;

select_button_size = [6,6,2];


union() {
    difference(){
        rotate([0,0,1.5])
        translate(offset_position)
        linear_extrude(PCB_height) {
            import(file = "/Users/puesbeck/Repositories/dpadless-controller/top-pcb.svg", dpi=DPI);
        }

        
        // small bottom hole
        translate([57.5,3.5,-2])
            cylinder(PCB_height+3, small_hole_radius, small_hole_radius);

        // small dpad hole
        translate([25,15,-2])
            cylinder(PCB_height+3, small_hole_radius, small_hole_radius);
        
        // small top hole
        translate([77,54,-2])
            cylinder(PCB_height+3, small_hole_radius, small_hole_radius);
        
        //middle bigger hole
        translate([57.5,17.5,-2])
            cylinder(PCB_height+3, big_hole_radius, big_hole_radius);
        
        //bigger hole left
        translate([5,8,-2])
            cylinder(PCB_height+3, big_hole_radius, big_hole_radius);
        
        //bigger hole right
        translate([105,8,-2])
            cylinder(PCB_height+3, big_hole_radius, big_hole_radius);
    }

    //left select button
    translate([45,8,0])
       cube(select_button_size);
    
    //right select button
    translate([60,8,0])
       cube(select_button_size);
    
    //middle bigger hole
    translate([55,25,0])
        cylinder(PCB_height+0.25, main_button_radius, main_button_radius);
    
    // left upper button
    translate([75,23,0])
        cylinder(PCB_height+0.25, main_button_radius, main_button_radius);

    // middle upper button
    translate([87,29,0])
        cylinder(PCB_height+0.25, main_button_radius, main_button_radius);
    
    // right upper button
    translate([102,31,0])
        cylinder(PCB_height+0.25, main_button_radius, main_button_radius);
    
    // left lower button
    translate([78,6,0])
        cylinder(PCB_height+0.25, main_button_radius, main_button_radius);
        
    // middle lower button
    translate([94,13,0])
        cylinder(PCB_height+0.25, main_button_radius, main_button_radius);
       
    // right lower button 
    translate([110,16,0])
        cylinder(PCB_height+0.25, main_button_radius, main_button_radius);
        
    translate([35,30,-7.5])
        cube([40,24,6]);
        
    translate([52,54,-3])
        cube([9,6,3]);
}



// Measurement cube
translate([57.5,0,1])
    #cube([1,56.5,1]);


translate([0,-3,0])
    #cube([115,3,4]);
#cube([3,56.5,4]);