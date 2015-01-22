include <inc/common.scad>
use <inc/frame_mount_connector.scad>
use <frame_mount_holder.scad>

$fn=120;

fan_size = 60;
mount_height = 4;
hole_r = 2.3;
edge = 2.6*2 + hole_r*2;

module nut_hole() {
    cylinder(r=1.8, h=9);
}

module round_corner_frame() {
    _r = 6;
    translate([_r, _r, 0]) minkowski() {
        cube([fan_size-_r*2, fan_size-_r*2, mount_height/2]);
        cylinder(r=_r, h=mount_height/2);
    }
}

module fan_mount() {
    union() {
    translate([fan_size-2, 0, 0]) cube([2, fan_size, 4]);
    difference() {
        cube([fan_size, fan_size, mount_height]);
        // round_corner_frame();
        translate([edge, edge, 0])
            cube([60-edge*2, 60-edge*2, mount_height]);
        translate([-50, 10, 0]) cube([100, 100, 9]);
        translate([30, 30, 0]) cylinder(r=29, h=mount_height);
        // 3 nut holes
        translate([2.6+hole_r, 2.6+hole_r]) nut_hole();
        translate([2.6+hole_r+fan_size-edge, 2.6+hole_r]) nut_hole();
        translate([2.6+hole_r+fan_size-edge, 2.6+hole_r+fan_size-edge]) nut_hole();
    }
    }
}


rotate([180, 0, 0])
difference() {
    union() {
        fan_mount();
        difference() {
            translate([fan_size, -4*2-frame_thickness+0.5, -30+4]) rotate([0, -90, 0])          plate_holder(60, false);
            translate([45.8, -20, -8])
                horizontal_m3_hole();
        }   
    }
    translate([5, -4*2-frame_thickness+1, -18]) rotate([90, 0, 0]) 
        linear_extrude(height=2) {
            text("Prusa i3");
        }
}