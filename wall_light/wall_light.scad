$fn = 60;

module frame2()
{
    difference()
    {
        union()
        {
            cube([ 117, 85, 5 ]);
            linear_extrude(height = 5) polygon(points = [ [ 0, 80 ], [ 0, 85 ], [ -5, 80 ] ]);
            linear_extrude(height = 5) polygon(points = [ [ 117, 80 ], [ 117, 85 ], [ 122, 80 ] ]);
        }
        union()
        {
            translate([ 5, 5, -5 ]) cube([ 107, 35, 15 ]);
            translate([ 5, 45, -5 ]) cube([ 107, 35, 15 ]);

            translate([ 5, 2.5, -5 ]) cube([ 5, 5, 15 ]);
            translate([ 107, 2.5, -5 ]) cube([ 5, 5, 15 ]);

            translate([ 5, 77.5, -5 ]) cube([ 5, 5, 15 ]);
            translate([ 107, 77.5, -5 ]) cube([ 5, 5, 15 ]);
        }
    }
}

module frame1()
{
    difference()
    {
        union()
        {
            cube([ 117, 85, 5 ]);
            linear_extrude(height = 5) polygon(points = [ [ 0, 80 ], [ 0, 85 ], [ -5, 80 ] ]);
            linear_extrude(height = 5) polygon(points = [ [ 117, 80 ], [ 117, 85 ], [ 122, 80 ] ]);
        }
        union()
        {
            translate([ 5, 5, -5 ]) cube([ 107, 75, 15 ]);

            translate([ 5, 2.5, -5 ]) cube([ 5, 5, 15 ]);
            translate([ 107, 2.5, -5 ]) cube([ 5, 5, 15 ]);

            translate([ 5, 42.5, -5 ]) cube([ 5, 5, 15 ]);
            translate([ 107, 42.5, -5 ]) cube([ 5, 5, 15 ]);

            translate([ 5, 82.5, -5 ]) cube([ 5, 5, 15 ]);
            translate([ 107, 82.5, -5 ]) cube([ 5, 5, 15 ]);
        }
    }
}

module support_short()
{
    difference()
    {
        cube([ 40, 5, 5 ]);

        union()
        {
            translate([ 5, -2.5, -5 ]) cube([ 5, 5, 15 ]);
            translate([ 30, -2.5, -5 ]) cube([ 5, 5, 15 ]);
        }
    }
}

module support_top_right()
{
    difference()
    {
        union()
        {
            cube([ 50, 5, 5 ]);
            translate([ 45, 5, 0 ]) cube([ 5, 5, 5 ]);
            translate([ 45, 5, 5 ]) rotate([0,90,0])linear_extrude(height = 5) polygon(points = [ [ 0, 0 ], [ 0, 5 ], [ -5, 0 ] ]);
        }
        union()
        {
            translate([ 5, -2.5, -5 ]) cube([ 5, 5, 15 ]);
            translate([ 30, 2.5, -5 ]) cube([ 5, 5, 15 ]);
        }
    }
}

module support_top_left()
{
    mirror([0,1,0]) support_top_right();
}