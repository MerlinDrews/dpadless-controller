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