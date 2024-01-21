switch_offset_x_directions = 20;
switch_offset_distance = 15;
switch_offset_x_attacks = 80;

// Right button switch
rotate([180,0,0])
  translate([switch_offset_x_directions,-(2*switch_offset_distance)+9,1.5])
   silent_switch();

// Down button switch
rotate([180,0,0])
  translate([switch_offset_x_directions,-(1*switch_offset_distance)+9,1.5])
    silent_switch();

// Left button switch
rotate([180,0,0])
  translate([switch_offset_x_directions,-(0*switch_offset_distance)+9,1.5])
    silent_switch();

// LP button switch
rotate([180,0,0])
  translate([switch_offset_x_attacks,-(2*switch_offset_distance)+9,1.5]) 
    silent_switch();

// MP button switch
rotate([180,0,0])
  translate([switch_offset_x_attacks,-(1*switch_offset_distance)+9,1.5])
    silent_switch();

// HP button switch
rotate([180,0,0])
  translate([switch_offset_x_attacks,-(0*switch_offset_distance)+9,1.5])
    silent_switch();

// LK button switch
rotate([180,0,0])
  translate([switch_offset_x_attacks+switch_offset_distance,-(2*switch_offset_distance)+9,1.5])
    silent_switch();


// MK button switch
rotate([180,0,0])
  translate([switch_offset_x_attacks+switch_offset_distance,-(1*switch_offset_distance)+9,1.5])
    silent_switch();


// HK button switch
rotate([180,0,0])
  translate([switch_offset_x_attacks+switch_offset_distance,-(0*switch_offset_distance)+9,1.5])
    silent_switch();


// right face button switch
translate([switch_offset_x_attacks+1,2*switch_offset_distance-8,1.5])
  silent_switch();


// right face button switch
//translate([switch_offset_x_attacks+switch_offset_distance - 3,2*(switch_offset_distance)-8,1.5])
//  silent_switch();


SHOULDER1_BUTTON_POS = [switch_offset_x_attacks+12,2*switch_offset_distance+5,9];
SHOULDER2_BUTTON_POS = [switch_offset_x_attacks+4,2*switch_offset_distance-5,9];
// right face button switch
translate([switch_offset_x_attacks+9,2*switch_offset_distance+2,1.5])
  silent_switch();


// left face button switch
translate([switch_offset_x_directions, (2*switch_offset_distance)+2,1.5])
  silent_switch();


// select switch
translate([51,22,1.5])
  silent_switch();



// left face button switch
//translate([switch_offset_x_directions - 5, 5,1.5])
//  silent_switch();
