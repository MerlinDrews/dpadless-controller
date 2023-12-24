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