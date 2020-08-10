
encoder_hole_depth = 2;
encoder_hole_dia = 6.8;
hole_extra = 0.5;
tab_dist = 2.4;
tab_w = 2*1.5;
tab_h = 0.5*3;
tab_d = 1.5;
tab_tolerance = 0.2;

module encoder_hole() {
    translate([0,0,encoder_hole_depth/2]) {
        cylinder(r=encoder_hole_dia/2+hole_extra,h=encoder_hole_depth, center=true);
    }
    translate([-tab_w/2,tab_dist+encoder_hole_dia/2,encoder_hole_depth-tab_d]) {
        cube([tab_w, tab_h, tab_d]);
    }
}

//encoder_hole();

module hole_test() {
    difference() {
        translate([0,0,encoder_hole_depth/2])  {cylinder(r=encoder_hole_dia/2+tab_dist+2,h=encoder_hole_depth, center=true);}
        encoder_hole();
    }
}

//hole_test();

