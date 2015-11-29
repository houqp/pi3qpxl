include <../inc/common.scad>
use <../frame_mount_holder.scad>

$fn = 60;
plate_holder_thickness = 12.;
G_mount_height = 71.5;
G_mount_width = 26;
G_nut_hole_edge = 6;

module m8_plate_holder(mount_height, mount_width, has_nut_hole) {
        difference() {
            cube([mount_width, plate_holder_thickness, mount_height]);
                translate([0, (plate_holder_thickness-frame_thickness)/2, 0])
                    cube([mount_width, frame_thickness, mount_height-18]);
            if (has_nut_hole)
                translate([G_nut_hole_edge, 0, 4])
                    horizontal_m3_hole();
            if (has_nut_hole)
                translate([mount_width-G_nut_hole_edge, 0, 4])
                    horizontal_m3_hole();
            translate([mount_width/2, plate_holder_thickness/2, mount_height-11])
                cylinder(r=m8_r, h=11);
            translate([(mount_width-m8_nut_outer_d)/2,
                      (plate_holder_thickness-m8_nut_outer_d)/2,
                      mount_height-10+3-m8_nut_h]) 
                cube([m8_nut_outer_d, m8_nut_outer_d+10, m8_nut_h+0.5]);
 
        }
}

rotate([0, -90, 0])
m8_plate_holder(G_mount_height, G_mount_width, true);