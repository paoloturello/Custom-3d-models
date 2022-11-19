$fn = 60;
include <wall_light.scad>

frame1();
translate([117,-5,0]) rotate([0,0,180]) frame2();
translate([10,10,0]) support_short();
translate([10,20,0]) support_short();
translate([10,30,0]) support_top_right();
translate([10,55,0]) support_top_left();