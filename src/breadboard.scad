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

BBLength  = 82.5;
BBHeight  =  9.5;
BBWidth   = 54.5;
TabWidth  =  4.9; // These tabs tend to vary from one brand to another. Measure carefully!
TabDepth  =  1.5;
TabHeight =  4.6;

XNearTabEdgeDist = 11.4;
XFarTabEdgeDist = 11.4;
YNearTabEdgeDist = 2.2;
YFarTabEdgeDist = 2.2;

BBPosX    = TabDepth; // originally 2
BBPosY    = TabDepth; // originally 2

module BBTabs() {
        union() {
            cube([BBLength, BBWidth, BBHeight]);
            // x-axis (near): near tab
            translate([XNearTabEdgeDist, -TabDepth, 0]) {
                cube([TabWidth, TabDepth*2, TabHeight]);
            }
            // x-axis (near): far tab
            translate([BBLength-TabWidth-XFarTabEdgeDist, -TabDepth, 0]) {
                cube([TabWidth, TabDepth*2, TabHeight]);
            }
            // x-axis (far): near tab
            translate([XNearTabEdgeDist, BBWidth-TabDepth, 0]) {
                cube([TabWidth, TabDepth*2, TabHeight]);
            }
            // x-axis (far): far tab
            translate([BBLength-TabWidth-XFarTabEdgeDist, BBWidth-TabDepth, 0]) {
                cube([TabWidth, TabDepth*2, TabHeight]);
            }
            // y-axis (near): near tab
            translate([-TabDepth, YNearTabEdgeDist, 0]) {
                cube([TabDepth*2, TabWidth, TabHeight]);
            }
            // y-axis (near): middle tab
            translate([-TabDepth, BBWidth/2-TabWidth/2, 0]) {
                cube([TabDepth*2, TabWidth, TabHeight]);
            }
            // y-axis (near): far tab
            translate([-TabDepth, BBWidth-TabWidth-YFarTabEdgeDist, 0]) {
                cube([TabDepth*2, TabWidth, TabHeight]);
            }
            // y-axis (far): near tab
            translate([BBLength-TabDepth, YNearTabEdgeDist, 0]) {
                cube([TabDepth*2, TabWidth, TabHeight]);
            }
            // y-axis (far): middle tab
            translate([BBLength-TabDepth, BBWidth/2-TabWidth/2, 0]) {
                cube([TabDepth*2, TabWidth, TabHeight]);
            }
            // y-axis (far): far tab
            translate([BBLength-TabDepth, BBWidth-TabWidth-YFarTabEdgeDist, 0]) {
                cube([TabDepth*2, TabWidth, TabHeight]);
            }
        }
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
