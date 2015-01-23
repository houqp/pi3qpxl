include <inc/common.scad>

$fn = 60;

module m8_rod_connector(l) {
    union() {
        //translate([0, 0, (l)/2]) cube([m8_r*2.2, m8_r*2.2, 10], center=true);
        difference() {
            cylinder(r=m8_r*3, l);
            cylinder(r=m8_r, l);
        }
    }
}

m8_rod_connector(50);