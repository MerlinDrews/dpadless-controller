module shell(
    pcb_width,
    pcb_height,
    pcb_thickness) {
        
    main_plate_height = pcb_height/3;
    width_overhang = 9;
    height_overhang = 9;
    shell_thickness = 20;
    shell_strength = 5;

    cube_height = pcb_width*0.85+(2*width_overhang);
    cube_width = pcb_height + main_plate_height + height_overhang*2;
       
    cylinder_ratio = 0.115;
    color("green") {  
        
       
            difference(){
            
                hull() {
/*                    translate([-width_overhang,-(main_plate_height+height_overhang),pcb_thickness-10])
                        cube([
                                cube_height, 
                                cube_width, 
                                shell_thickness]);
*/                       
                        translate([-main_plate_height/2, -(main_plate_height+height_overhang), -pcb_thickness-0.25])
                            rotate([-90,0,0])
                                cylinder(cube_width, cube_height*cylinder_ratio, cube_height*cylinder_ratio);
                    
                    
                    translate([cube_height-main_plate_height/2, -(main_plate_height+height_overhang), -pcb_thickness-0.25])
                            rotate([-90,0,0])
                                cylinder(cube_width, cube_height*cylinder_ratio, cube_height*cylinder_ratio);
                    }
            
                translate([-14,-(main_plate_height+height_overhang)+shell_strength/2,-(shell_thickness*2-shell_strength)])
                    cube([
                            cube_height*1.1-shell_strength, 
                            cube_width-shell_strength, 
                            shell_thickness*2]);
                    
                translate([-cube_height/2,-cube_width,-(shell_thickness*2+8)])
                     cube([
                            cube_height*2, 
                            cube_width*2, 
                            shell_thickness*2]);
            }
        }
       
}
