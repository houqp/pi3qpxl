$fn = 60;

nut_holder_length = 22.5;
nut_holder_r = 7.5;
nut_r = 3.94;

module nut_holder_middle() {
    rotate([0, 90, 0])
        cylinder(r=nut_holder_r, h=nut_holder_length);
}

sx = nut_holder_length;
sy = nut_holder_r*1.2;
sz = nut_holder_r*1.5;
module nut_holder_side() {
    translate([0, 0, -sz/2])
        cube([sx, sy, sz]);
    translate([0, -sy, -sz/2])
        cube([sx, sy, sz]);
}

module nut_holder() {
    difference() {
        union() {
            nut_holder_middle();
            nut_holder_side();
        }
        translate([-1, 0, 0])
            rotate([0, 90, 0])
                cylinder(r=nut_r, h=nut_holder_length+2);
    }
}

rod_angel = 33;
rod_holder_height = nut_holder_length+8;
rod_holder_r = nut_holder_r;
rod_r = 3.9;
m8_w = 14;
m8_l = 14;
m8_h = 6.3;
module nut_slot_for_rod() {
    rotate([0, -rod_angel, 0])
        translate([-nut_holder_r, 0, -nut_holder_r+1])
            translate([rod_holder_height, 0, -(rod_holder_height)+2])
                translate([-rod_holder_r*2-2, 0, -6]) {
                    translate([2, 0, rod_holder_height/2-5])
                        cube([m8_l+rod_r, m8_w, m8_h+0.5], center=true);
                }
}

module rod_holder() {
        translate([rod_holder_height, 0, -(rod_holder_height)+2]) {
            difference() {
                // hole wall
                union() {
                translate([-16, 0, rod_holder_height/2-5])
                    cube([rod_holder_r*2, sy*2, rod_holder_height], center=true);
                translate([-25, 0, rod_holder_height/2-2.3])
                    cube([4, sy*2, rod_holder_height-2], center=true);
                }
                // rod hole
                translate([-rod_holder_r*2-2, 0, -6]) {
                    cylinder(r=rod_r, h=rod_holder_height/2-5);
                }
            }
        }
}

module rod_holder_rotate() {
    rotate([0, -rod_angel, 0])
        translate([-nut_holder_r, 0, -nut_holder_r+1])
            rod_holder();
}

module join() {
    translate([nut_holder_length/2, 0, -nut_holder_r+1])
        cube([nut_holder_length, nut_holder_r*2+3, 6], center=true);
}

rotate([90, 0, rod_angel])
union() {
    nut_holder();
    
    difference() {
        union() {
            join();
            rod_holder_rotate();
        }
        nut_holder_middle();
        nut_slot_for_rod();
    }
}
