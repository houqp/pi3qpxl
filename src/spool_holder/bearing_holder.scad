include <../inc/common.scad>
use <../frame_mount_holder.scad>

$fn = 60;
holder_thickness = 20.;


bearing_h = bearing_608zz_h+0.5;
bearing_r = bearing_608zz_d/2;
module m8_bearing() {
    rotate([90, 0, 0]) cylinder(r=bearing_r, h=bearing_h);
}

module m8_bearing_holder(mount_height) {
        difference() {
            cube([30, holder_thickness, mount_height]);
            translate([15, holder_thickness/2, 0])
                cylinder(r=m8_r, h=11);
            translate([(30-m8_nut_outer_d)/2,
                      (holder_thickness-m8_nut_outer_d)/2, 8]) 
                cube([m8_nut_outer_d, m8_nut_outer_d+10, m8_nut_h+0.5]);
            // bearing and rod slot
            translate([15, (holder_thickness+bearing_h)/2, mount_height])
                m8_bearing();
            translate([15, (holder_thickness+bearing_h)-bearing_h, mount_height])
                rotate([90, 0, 0]) cylinder(r=5.71, h=bearing_h+0.5);
            translate([15, 8, mount_height])
                rotate([90, 0, 0]) cylinder(r=m8_r+0.5, h=bearing_h*3/4); 
        }     
        %translate([15, 5, mount_height]) m8_rod(50);
}

m8_bearing_holder(38, true);