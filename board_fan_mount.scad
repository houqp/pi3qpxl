$fn = 30;

frame_thickness = 3.14;
plate_holder_thickness = 11;

module m3_hole(l) {
    m3_r = 1.475;
    cylinder(r=m3_r, h=l);
}

module horizontal_m3_hole() {
    translate([0, 60, 0])
        rotate([90, 0, 0])
            m3_hole(60);
}

module polyhedron(w, l) {
    difference() {
        cube([w, w, l]);
        rotate([0, 0 ,45])
            cube([w*2, w*2, l]);
    }
}

module plate_holder() {


        difference() {
            cube([30, plate_holder_thickness, 70]);
            translate([0, (plate_holder_thickness-frame_thickness)/2, 0])
                cube([30, frame_thickness, 50]);
            translate([8, 0, 5])
                horizontal_m3_hole();
            translate([22, 0, 5])
                horizontal_m3_hole();
 
        }

}

rotate([180, 0, 0])
difference() {
    union() {
        plate_holder();
        translate([0, -1.7, 70])
            rotate([0, 90, 0])
                rotate([0, 0, 45])
                    polyhedron(10, 30);
    }
    // xy slot
    translate([30/2, (plate_holder_thickness)/2, 64])
        cylinder(r=2, h=20);
}