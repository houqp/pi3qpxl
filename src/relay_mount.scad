$fn = 60;
include <inc/common.scad>


relay_h = 58.3;
relay_w = 35.74;

module m8_wrap(h) {
    wrap_thickness = 3;
    wrap_r = m8_r + wrap_thickness;
    difference() {
        union() {
            translate([0, -wrap_r, 0])
                cube([wrap_r+2, 2*wrap_r, h]);
            cylinder(r=wrap_r, h=h);
        }
        translate([0,0,-0.1]) cylinder(r=m8_r, h=h+0.2);
        translate([-5, 0, h/2])
            cube([5, 6, h+0.2], center=true);
    }
}

plate_hole_r = m3_r+0.2;
module plate_hole(h) {
    cylinder(r=plate_hole_r, h=h);
}

module plate() {
    union() {
    difference() {
        translate([m8_r+2, 0, relay_h/2]) cube([4, relay_w+2, relay_h], center=true);
        translate([0, -relay_w/2+(2.13+plate_hole_r), relay_h-(2.3+plate_hole_r)]) rotate([0, 90, 0]) plate_hole(10);
        translate([0, relay_w/2-(1.95+plate_hole_r), relay_h-(2.3+plate_hole_r)]) rotate([0, 90, 0]) plate_hole(10);
        translate([0, relay_w/2-(2.01+plate_hole_r), 1.92+plate_hole_r]) rotate([0, 90, 0]) plate_hole(10);
        translate([0, -relay_w/2+(2.11+plate_hole_r), 1.92+plate_hole_r]) rotate([0, 90, 0]) plate_hole(10);
    }
    // for top enforcement
    translate([m8_r/2+1.95, -relay_w/2-1, relay_h]) cube([4, relay_w+2, 1]);
    // for bottom enforcement
    translate([m8_r/2+1.95, -relay_w/2-1, -1]) cube([4, relay_w+2, 1]);
    }
}

wrap_h = 15;
//rotate([0, 90, 0])
union() {
    plate();
    translate([-1, 0, relay_h-wrap_h+1])
        m8_wrap(wrap_h);
    translate([-1, 0, -4]) m8_wrap(wrap_h);
}
%translate([0, 0, -25]) rotate([90, 0, 0]) m8_rod(100);