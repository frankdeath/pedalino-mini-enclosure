include <breadboard.scad>

// Don't draw the breadboard
BBMount=0;

module BBTray() {
    difference() {
        cube([BBLength+Thick*2, BBWidth+Thick*2, TabHeight+Thick]);
        translate([0,0,Thick]) {BB();}
        }
    }

//BBTray();

module BBTrayTest() {
    difference() {
        cube([BBLength+TabDepth*2, BBWidth+TabDepth*2, TabHeight/2+Thick/2]);
        translate([-TabDepth/3,-TabDepth/3,Thick/2]) {BB();}
        }
    }

BBTrayTest();
