// Which one would you like to see?
part = "filler"; //[filler:Regular filler, topper:Top piece]

/* [Basic measurements] */
// Peg length
pegLength = 33;
// Top peg length
topPegLength = 30;
// Standart height
stdHeight = 100;
// Total glass missing width
totMissingWidth = 44;
// Glass thickness
glassThickness = 5;
// Enclosure thickness
thickness = 5;

/* [Fine Tuning] */
// Tolerance
tolerance = 0.4;

Print();

module Print()
{
    if (part == "filler")
    {
        Filler();
    }
    else if (part == "topper")
    {
        Topper();
    }
}

eps = tolerance / 2;

module Filler()
{
    Peg();
    translate([ 0, 0, pegLength ]) Enclosure(stdHeight);
}

module Topper()
{
    Peg();
    translate([ 0, 0, pegLength ]) Enclosure(stdHeight - pegLength - topPegLength);
}

module Peg()
{
    roundedcube_simple([ totMissingWidth / 2 - thickness - eps, glassThickness - eps, stdHeight ]);
    translate([ 0, -2*eps, pegLength ]) roundedcube_simple([ totMissingWidth / 2 - thickness - eps, glassThickness + 4 * eps, stdHeight - pegLength ]);
}

module Enclosure(height)
{
    translate([ -thickness, -thickness-eps, 0 ])
    {
        difference()
        {
            roundedcube_simple([ totMissingWidth / 2 + thickness, thickness * 2 + glassThickness + eps, height ]);
            translate([ thickness, thickness + eps / 2, -5 ]) cube([ totMissingWidth / 2 + thickness, glassThickness + eps, height + 10 ]);
        }
    }
}

module roundedcube_simple(size = [ 1, 1, 1 ], center = false, radius = 0.5)
{
    // If single value, convert to [x, y, z] vector
    size = (size[0] == undef) ? [ size, size, size ] : size;

    translate = (center == false) ? [ radius, radius, radius ]
                                  : [ radius - (size[0] / 2), radius - (size[1] / 2), radius - (size[2] / 2) ];

    translate(v = translate) minkowski()
    {
        cube(size = [ size[0] - (radius * 2), size[1] - (radius * 2), size[2] - (radius * 2) ]);
        sphere(r = radius);
    }
}