include <../inc/common.scad>
use <../frame_mount_holder.scad>

$fn = 60;
plate_holder_thickness = 18.;

module m8_plate_holder(mount_height, has_nut_hole) {
        difference() {
            cube([30, plate_holder_thickness, mount_height]);
            translate([0, (plate_holder_thickness-frame_thickness)/2, 0])
                cube([30, frame_thickness, mount_height-20]);
            if (has_nut_hole)
                translate([8, 0, 5])
                    horizontal_m3_hole();
            if (has_nut_hole)
                translate([22, 0, 5])
                    horizontal_m3_hole();
            translate([15, plate_holder_thickness/2, mount_height-11])
                cylinder(r=m8_r, h=11);
            translate([(30-m8_nut_outer_d)/2,
                      (plate_holder_thickness-m8_nut_outer_d)/2,
                      mount_height-10+3-m8_nut_h]) 
                cube([m8_nut_outer_d, m8_nut_outer_d+10, m8_nut_h+0.5]);
 
        }
}

rotate([0, -90, 0])
m8_plate_holder(76, true);