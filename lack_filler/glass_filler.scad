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
    Peg(stdHeight);
    translate([ 0, 0, pegLength ]) Enclosure(stdHeight);
}

module Topper()
{
    difference()
    {
        union()
        {
            Peg(stdHeight - topPegLength);
            translate([ 0, 0, pegLength ]) Enclosure(stdHeight - pegLength - topPegLength);
        }
        translate([ -5, -2 * eps, stdHeight - 5 ]) cube([ totMissingWidth / 2 - thickness + 10, 1 + 2 * eps, 10 ]);
        translate([ -5, glassThickness - 1 - eps, stdHeight - 5 ]) cube([ totMissingWidth / 2 - thickness + 10, 1 + 2 * eps, 10 ]);
        translate([ -4 + eps, -5, stdHeight - topPegLength + eps ]) cube([ 5, thickness + 10, pegLength + 5 + eps ]);
    }
}

module Peg(maxExpandedHeight)
{
    difference()
    {
        union()
        {
            cube([ totMissingWidth / 2 - thickness - eps, glassThickness - eps, stdHeight ]);
            translate([ 0, -2 * eps, pegLength ]) cube([ totMissingWidth / 2 - thickness - eps, glassThickness + 4 * eps, maxExpandedHeight - pegLength ]);
        }
        translate([ -5, -2 * eps, -5 ]) cube([ totMissingWidth / 2 - thickness + 10, 1 + 2 * eps, 10 ]);
        translate([ -5, glassThickness - 1 - eps, -5 ]) cube([ totMissingWidth / 2 - thickness + 10, 1 + 2 * eps, 10 ]);
        translate([ -4 + eps, -5, -5 ]) cube([ 5, thickness + 10, pegLength + 5 + eps ]);
    }
}

module Enclosure(height)
{
    translate([ -thickness, -thickness - eps, 0 ])
    {
        difference()
        {
            cube([ totMissingWidth / 2 + thickness, thickness * 2 + glassThickness + eps, height ]);
            translate([ thickness, thickness + eps / 2, -5 ]) cube([ totMissingWidth / 2 + thickness, glassThickness + eps, height + 10 ]);
            translate([ thickness - 1 - eps, thickness + eps / 2, stdHeight - pegLength - eps ]) cube([ totMissingWidth / 2 + thickness, glassThickness + eps, pegLength + 5 ]);
        }
    }
}