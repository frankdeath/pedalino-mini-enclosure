/*
 * OLED (SH1106) Holder
 * from: https://www.thingiverse.com/thing:4134190
 */

tolerance = .5;

//baseplate_width = 100;
//baseplate_height = 60;
baseplate_thickness = 4;
baseplate_oled_plate_offset_x = 0;
baseplate_oled_plate_offset_y = 0;

// OLED PCB
oled_tolerance = 0.3;
oled_pcb_height = 33.7 + oled_tolerance; 
oled_pcb_width = 35.9 + oled_tolerance; // 35.5 according to spec

oled_pcb_hole_dia = 2.1 + oled_tolerance;

oled_pcb_hole_dist_x = 30.7; // 30.4 spec
oled_pcb_hole_dist_y = 28.7; // 28.5
oled_pcb_hole_offset_bottom = 2 + (oled_tolerance / 2); // bottom is different somehow
//oled_pcb_hole_offset_left = 3 + (oled_tolerance/2);

oled_pcb_hole_offset_left = (oled_pcb_width - oled_pcb_hole_dist_x) / 2; // 3 + (oled_tolerance/2); <-- new

// Display area
oled_display_height = 24 + oled_tolerance; // 23 accordong to spec
oled_display_width = 35.4 + oled_tolerance;
oled_display_thick = 2.2 + oled_tolerance;
oled_display_offset_bottom = (oled_pcb_height - oled_display_height) - 6; // 5.25 according to spec
// Active area
oled_display_active_width = 29.42 + oled_tolerance;
oled_display_active_height = 14.7 + oled_tolerance;
oled_display_active_offset_bottom = oled_pcb_height - 8 - oled_display_active_height; // 7.35 to original spec
oled_chamfer = 3;

// OLED PLate
oled_cover_height = 2;
oled_cover_clip_overhang = 2;
oled_cover_clip_width = 5;
oled_cover_clip_angle = 45;
oled_plate_edge_width = 2;
oled_plate_edge_height = 2;
oled_plate_height = oled_pcb_height + oled_plate_edge_height * 2;
oled_plate_width = oled_pcb_width + oled_plate_edge_width * 2;
oled_plate_depth = 6;
oled_plate_knob_dia = 24;
oled_plate_rotary_dia = 8;

pcb_holder_walls = 1.5;

oled_pcb_thick = oled_plate_depth; //10 + oled_tolerance; // 10 for cleant cutour
oled_cutout_total_height = oled_pcb_thick + oled_display_thick + pcb_holder_walls;

extra = 0.00001;

module oled_plate(plate_cutout = false) {
    if (plate_cutout == false) {
        difference() {
            hull() {
                roundedcube(oled_plate_width,oled_plate_height,oled_plate_depth, 0.1);
            }
        // !!! oled_cutout() is the important function
        translate([oled_plate_edge_width,oled_plate_edge_height,(oled_plate_depth - oled_cutout_total_height + extra )]) oled_cutout();
        }
    } else {
    translate([10 + (oled_pcb_width / 2) - 10 ,31,-baseplate_thickness]) cube([20,5,baseplate_thickness]); // OLED connector
    }
}

module oled_cutout() {
    difference() {
        union(){
            cube([oled_pcb_width,oled_pcb_height,oled_pcb_thick]); // PCB
            translate([(oled_pcb_width - oled_display_width) / 2,oled_display_offset_bottom ,oled_pcb_thick]) cube([oled_display_width,oled_display_height,oled_display_thick]); // Display
            hull() { // Display visable area
                translate([(oled_pcb_width - oled_display_active_width) / 2, oled_display_active_offset_bottom,oled_pcb_thick + oled_display_thick]) cube([oled_display_active_width,oled_display_active_height,.1]); 
                translate([(((oled_pcb_width - oled_display_active_width) / 2) - (oled_chamfer / 2)) , oled_display_active_offset_bottom - (oled_chamfer / 2), oled_pcb_thick + oled_display_thick + pcb_holder_walls - 0.1]) cube([oled_display_active_width + oled_chamfer ,oled_display_active_height + oled_chamfer, .1]);
                
            }
            // Flat cable cutout
            translate([(oled_pcb_width - 19) / 2,0, oled_pcb_thick]) cube([19,(oled_pcb_height - oled_display_height) / 2,oled_display_thick]);
            // Connector cutout
            translate([(oled_pcb_width - 20) / 2,oled_pcb_height - 3,oled_pcb_thick]) cube([20,3, oled_display_thick + (pcb_holder_walls / 2) ]);
        }
        // Holes
        translate([oled_pcb_hole_offset_left,oled_pcb_hole_offset_bottom ,0]) cylinder(h = oled_pcb_height, d = oled_pcb_hole_dia, center = false); // bottom left
        translate([oled_pcb_hole_offset_left + oled_pcb_hole_dist_x,oled_pcb_hole_offset_bottom,0]) cylinder(h = oled_pcb_height, d = oled_pcb_hole_dia, center = false); // bottom right
              translate([oled_pcb_hole_offset_left + oled_pcb_hole_dist_x,oled_pcb_hole_offset_bottom + oled_pcb_hole_dist_y,0]) cylinder(h = oled_pcb_height, d = oled_pcb_hole_dia, center = false); // top left
        translate([oled_pcb_hole_offset_left,oled_pcb_hole_offset_bottom + oled_pcb_hole_dist_y,0]) cylinder(h = oled_pcb_height, d = oled_pcb_hole_dia, center = false); // top right            
    }   
    
}

module roundedcube(xdim ,ydim ,zdim,rdim){
hull(){
translate([rdim,rdim,0])cylinder(h=zdim,r=rdim);
translate([xdim-rdim,rdim,0])cylinder(h=zdim,r=rdim);

translate([rdim,ydim-rdim,0])cylinder(h=zdim,r=rdim);
translate([xdim-rdim,ydim-rdim,0])cylinder(h=zdim,r=rdim);
}
}

// Draw the oled plate
translate([baseplate_oled_plate_offset_x,baseplate_oled_plate_offset_y,0]) oled_plate(plate_cutout = false);
