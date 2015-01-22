$fn = 30;

frame_thickness = 3.14;

module m3_hole(l) {
    m3_r = 1.475;
    cylinder(r=m3_r, h=l);
}