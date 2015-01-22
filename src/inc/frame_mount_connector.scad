
module frame_mount_connector_hole(w, l) {
    cylinder(r=2, h=20); 
}

module frame_mount_connector_edge(w, l) {
    difference() {
        rotate([45, 0, 0]) rotate([0, 90, 0])
            difference() {
                cube([w, w, l]);
                rotate([0, 0, 45])
                    cube([w*2, w*2, l]);
            }
         translate([0, w/4.5, -w-3]) rotate([90, 0, 90])
            cube([w, w, l+1]);
    }

}


//frame_mount_connector_edge(10, 30);