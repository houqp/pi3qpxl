include <inc/common.scad>
use <inc/frame_mount_connector.scad>


plate_holder_thickness = 11;


module horizontal_m3_hole() {
    translate([0, 60, 0])
        rotate([90, 0, 0])
            m3_hole(60);
}

module plate_holder(mount_height, has_nut_hole) {
        difference() {
            cube([30, plate_holder_thickness, mount_height]);
            translate([0, (plate_holder_thickness-frame_thickness)/2, 0])
                cube([30, frame_thickness, mount_height-10]);
            if (has_nut_hole)
                translate([8, 0, 5])
                    horizontal_m3_hole();
            if (has_nut_hole)
                translate([22, 0, 5])
                    horizontal_m3_hole();
 
        }
}

//rotate([180, 0, 0])
difference() {
    union() {
        plate_holder(60, true);
        translate([0, -1.7, 70])
            frame_mount_connector_edge(10, 30);
    }
    // xy slot
    translate([30/2, (plate_holder_thickness)/2, 64])
        frame_mount_connector_hole();
}