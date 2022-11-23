$fn = 60;

_length = 117;
_height = 84;
_width = 5;

_supportLength = 40;

module frame()
{
    difference()
    {
        union()
        {
            cube([ _length, _height, _width ]);
            linear_extrude(_width) polygon(points = [ [ 0, _height - 5 ], [ 0, _height ], [ -5, _height - 5 ] ]);
            linear_extrude(_width) polygon(points = [[_length, _height - 5], [_length, _height], [_length + 5, _height - 5]]);
        }
        union()
        {
            translate([ _width, _width, -5 ]) cube([ _length - (2 * _width), _height, _width + (2 * 5) ]);

            translate([ _width, _width / 2, -5 ]) cube([ _width, _width, _width + (2 * 5) ]);
            translate([ _length - (2 * _width), _width / 2, -5 ]) cube([ _width, _width, _width + (2 * 5) ]);
        }
    }
}

module support()
{
    difference()
    {
        cube([ _supportLength, _width, _width ]);

        union()
        {
            translate([ _width, -(_width / 2), -5 ]) cube([ _width, _width, _width + (2 * 5) ]);
            translate([ _supportLength - (2 * _width), -(_width / 2), -5 ]) cube([ _width, _width, _width + (2 * 5) ]);
        }
    }
}
