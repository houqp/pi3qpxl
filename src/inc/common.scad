m8_r = 3.9;
m8_nut_outer_d = 14.5;
m8_nut_h = 6.34;

module m8_rod(l) {
    rotate([-90, 0, 0])
        cylinder(r=m8_r, h=l);
}

bearing_608zz_h = 6.94;
bearing_608zz_d = 22;
bearing_608zz_r = bearing_608zz_d/2;

frame_thickness = 3.14;
frame_width = 55.05;
m3_r = 1.475;
module m3_hole(l) {
    cylinder(r=m3_r, h=l);
}

module horizontal_m3_hole() {
    translate([0, 60, 0])
        rotate([90, 0, 0])
            m3_hole(70);
}
