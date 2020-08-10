include <box.scad>
include <oled-holder.scad>
include <encoder-hole.scad>

drawHolder = false;

difference() {
    translate([0,0,th]) {cover();}
    // Recut the hole for the screen
    // NOTE: translating by the wrong dimensions for width and high puts the display right in the middle
    translate([-oled_plate_height/2,-oled_plate_width/2,0]) {cube([oled_plate_width, oled_plate_height, th]);}
    // encoder holes
    translate([(wi-oled_plate_width)/4+oled_plate_width/2,0,0]) {encoder_hole();}
    translate([-(wi-oled_plate_width)/4-oled_plate_width/2,0,0]) {encoder_hole();}
}
translate([-oled_plate_height/2,-oled_plate_width/2,0]) {oled_holder();}
