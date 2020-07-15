/*
 * Breadboad
 * from: https://github.com/rlerdorf/BBBox
 */

/* [Box dimensions] */
Thick        = 2; // Wall thickness. If you change this you will have to adjust a few things

/* [Box options] */
m           = 0.9; // Tolerance (Panels/rails gap)

/* BreadBoard Mount */
BBMount   =  1;

BBPosX    = 2;
BBPosY    = 2;
BBLength  = 82.5;
BBHeight  =  9.5;
BBWidth   = 54.5;
TabWidth  =  4.9; // These tabs tend to vary from one brand to another. Measure carefully!
TabDepth  =  1.5;
TabHeight =  4.6;

module BBTabs() {
    //translate([Thick+2*m + 0.1, 2*Thick, Thick+0.2]) {
        union() {
            cube([BBLength, BBWidth, BBHeight]);
            // x-axis (near): near tab
            translate([13, -TabDepth, 0]) {
                cube([TabWidth, TabDepth*2, TabHeight]);
            }
            // x-axis (near): far tab
            translate([BBLength-TabWidth/2-14, -TabDepth, 0]) {
                cube([TabWidth, TabDepth*2, TabHeight]);
            }
            // x-axis (far): near tab
            translate([13, BBWidth-TabDepth, 0]) {
                cube([TabWidth, TabDepth*2, TabHeight]);
            }
            // x-axis (far): far tab
            translate([BBLength-TabWidth/2-14, BBWidth-TabDepth, 0]) {
                cube([TabWidth, TabDepth*2, TabHeight]);
            }
            // y-axis (near): near tab
            translate([-TabDepth, 3, 0]) {
                cube([TabDepth*2, TabWidth, TabHeight]);
            }
            // y-axis (near): middle tab
            translate([-TabDepth, BBWidth/2-TabWidth/2, 0]) {
                cube([TabDepth*2, TabWidth, TabHeight]);
            }
            // y-axis (near): far tab
            translate([-TabDepth, BBWidth-TabWidth-3, 0]) {
                cube([TabDepth*2, TabWidth, TabHeight]);
            }
            // y-axis (far): near tab
            translate([BBLength-TabDepth, 3, 0]) {
                cube([TabDepth*2, TabWidth, TabHeight]);
            }
            // y-axis (far): middle tab
            translate([BBLength-TabDepth, BBWidth/2-TabWidth/2, 0]) {
                cube([TabDepth*2, TabWidth, TabHeight]);
            }
            // y-axis (far): far tab
            translate([BBLength-TabDepth, BBWidth-TabWidth-3, 0]) {
                cube([TabDepth*2, TabWidth, TabHeight]);
            }
        }
    //}
}

module BB() {
    translate([BBPosX, BBPosY, 0]) {
        BBTabs();
    }
}

if(BBMount==1) {
    translate([BBPosX, BBPosY, 0]) {
        BBTabs();
    }
}
