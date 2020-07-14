include <breadboard.scad>

// Don't draw the breadboard
BBMount=0;

module BBTray() {
    difference() {
        cube([BBLength+Thick*2, BBWidth+Thick*2, TabHeight+Thick]);
        translate([0,0,Thick]) {BB();}
        }
    }

BBTray();
    
