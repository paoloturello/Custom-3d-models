$fn = 60;
include <roundedcube_simple.scad>

translate([25.3,0,3.8])rotate([0,180,0]) backHolder();

module backHolder()
{
    union()
    {
        difference()
        {
            translate([ 0, 0, -1 ]) roundedcube_simple([ 25.3, 21.5, 4.8 ]);
            union()
            {
                translate([ 4, -10.3, -5 ]) cube([ 17.3, 20, 20 ]);
                translate([ -5, -5, -40 ]) cube(40);
                translate([ 0.8, 1.2, -0.1 ]) cube([ 2, 18.6, 2.9 ]);
                translate([ 22.4, 1.2, -0.1 ]) cube([ 2, 18.6, 2.9 ]);
                translate([ 2.7, 10.8, -0.1 ]) cube([ 19.9, 20, 2.9 ]);
                translate([ 2, 4.65, 0 ]) rotate([ 0, 90, 0 ]) cylinder(h = 21.3, r = 0.9);
            }
        }

        translate([ 4, 4.65, 0 ]) halfCylinder();
        translate([ 21.3, 4.65, 0 ]) rotate([ 0, 0, 180 ]) halfCylinder();

        // translate([ 1.2, 1.2, 0 ]) cube([ 1.6, 1.6, 3 ]);
        // translate([ 1.2, 1.2, -2.4 ]) roundedcube_simple([ 1.6, 2, 5.3 ]);
        // translate([ 22.4, 1.2, 0 ]) cube([ 1.6, 1.6, 3 ]);
        // translate([ 22.4, 1.2, -2.4 ]) roundedcube_simple([ 1.6, 2, 5.3 ]);

        translate([ 6.15, 14.7, 0 ]) hollowCylinder(3.1, 1.65, 3, 0.8);
        translate([ 19.15, 14.7, 0 ]) hollowCylinder(3.1, 1.65, 3, 0.8);
        translate([ 12.65, 14.7, 0.7 ]) hollowCylinder(2.4, 2, 4, 1);

        translate([ 8.65, 10.8, 1.5 ]) cube([1,5,1.6]);
        translate([ 15.65, 10.8, 1.5 ]) cube([1,5,1.6]);
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

module hollowCylinder(height = 1, extRadiusTop = 1, extRadiusBottom = 1, intRadius = 0.5)
{
    difference()
    {
        cylinder(height, extRadiusTop, extRadiusBottom);
        translate([ 0, 0, -1 ]) cylinder(height + 2, intRadius, intRadius);
    }
}