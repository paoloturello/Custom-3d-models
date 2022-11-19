$fn = 60;
include <roundedcube_simple.scad>

translate([25.3,0,6.8])rotate([0,180,0]) frontHolder();

module frontHolder()
{
    union()
    {
        difference()
        {
            translate([ 0, 0, -1 ]) roundedcube_simple([ 25.3, 21.5, 7.8 ]);
            union()
            {
                translate([ 4, -0.5, 1.2 ]) cube([ 17.3, 25, 6 ]);
                translate([ 4, -10.3, -5 ]) cube([ 17.3, 20, 20 ]);
                translate([ -5, -5, -40 ]) cube(40);
                translate([ 12.765, 14.7, -1.81 ]) sphere(2.81);
                translate([ 6.265, 14.7, -3 ]) cylinder(10, 0.55);
                translate([ 6.265, 14.7, -0.2 ]) cylinder(h = 1.5, r1 = 0.275, r2 = 1.2);
                translate([ 19.265, 14.7, -3 ]) cylinder(10, 0.55);
                translate([ 19.265, 14.7, -0.2 ]) cylinder(h = 1.5, r1 = 0.275, r2 = 1.2);
                translate([ 0.8, 1.2, -0.1 ]) cube([ 2, 18.6, 4 ]);
                translate([ 22.4, 1.2, -0.1 ]) cube([ 2, 18.6, 4 ]);
                translate([ 1, 18.1, 1.2 ]) cube([ 23.3, 1.8, 3 ]);
                translate([ 2, 4.65, 0 ]) rotate([0,90,0])cylinder(h = 21.3, r = 0.9);
            }
        }
        translate([ 4, 4.65, 0 ]) halfCylinder();
        translate([ 21.3, 4.65, 0 ]) rotate([0,0,180]) halfCylinder();
    }
}

module halfCylinder()
{
    rotate([ 0, 90, 0 ]) difference()
    {
        union()
        {
            cylinder(h = 6.1, r = 1.95);
            translate([ 0, 0, 4.9 ]) cylinder(h = 1.2, r = 2.65);
        }
        union()
        {
            translate([ 0, 0, -0.5 ]) cylinder(h = 7.1, r = 0.9);
            translate([ 0, -5, -2 ]) cube(10);
        }
    }
}
