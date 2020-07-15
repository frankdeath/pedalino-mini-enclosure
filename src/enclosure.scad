include <box.scad>
include <breadboard-tray.scad>

// Don't draw the breadboard
BBMount=0;

// Hole diameters
JackD=12.4;
PowerD=9.0;

bb_pin_spacing = 1.2;
jack_spacing = wi / 4;

module jackHole (depth) {
    diameter = JackD;
    translate([0,li+th,h/2]) {
    rotate([90, 0, 0]) {
        cylinder(d=diameter, h=depth, center=false, $fn=36);
    }}
}

module powerHole (depth) {
    diameter = JackD;
    translate([-th,0,0]) {
    rotate([0, 90, 0]) {
        cylinder(d=diameter, h=depth, center=false, $fn=36);
    }}
}

difference() {
    union() {
        translate([wi/2,li/2,th]) {
            box();
        }
        translate([0,0,0]) {
            BBTray();
        }
    }
    translate([jack_spacing-JackD/2,0,0]) {jackHole(th);}
    translate([jack_spacing*2,0,0]) {jackHole(th);}
    translate([jack_spacing*3+JackD/2,0,0]) {jackHole(th);}
    translate([0,BBWidth/2+th-bb_pin_spacing,15]) {
        scale([1.0,1.0,0.5]) {
             powerHole(th);
        }
    }
}