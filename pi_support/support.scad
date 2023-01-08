$fn = 60;

_holeDiameter = 4;

_length = 85;
_height = 45;
_thickness = 3;

_holeSpace = 25.6;
_holeOffset = 38;
_hole1TopDistance = 9.1;
_hole2TopDistance = _holeSpace + _hole1TopDistance;

_circuitLength = 35;
_holeWall = 1;
_bottomBaseWidth = 25;
_bottomBaseHoleBottomDistance = 7;
_bottomBaseHole1Distance = 25 + _holeWall;
_bottomBaseHole2Distance = _bottomBaseHole1Distance + _circuitLength - _holeWall;

_topBaseWidth = 65;

_supportThickness = 3;

fullPiece();

module fullPiece()
{
    rotate([ 90, 0, 90 ]) backPlate();
    translate([ _bottomBaseWidth + _thickness, 0, 0 ]) rotate([ 0, 0, 90 ])
        bottomBase(_bottomBaseHoleBottomDistance, _bottomBaseHole1Distance, _bottomBaseHole2Distance);
    translate([ _topBaseWidth + _thickness, 0, 27+_supportThickness ]) rotate([ 0, 0, 90 ]) topBase();
}

module backPlate() //_length, _height, _thickness, _holeOffset, _hole1TopDistance, _hole2TopDistance, _holeDiameter)
{
    difference()
    {
        cube([ _length, _height, _thickness ]);

        translate([ _holeOffset, _height - _hole1TopDistance, -1 ]) cylinder(h = _thickness + 2, r = _holeDiameter / 2);
        translate([ _holeOffset, _height - _hole2TopDistance, -1 ]) cylinder(h = _thickness + 2, r = _holeDiameter / 2);
    }
}

module bottomBase(hbdist, h1dist, h2dist)
{
    difference()
    {
        cube([ _length, _bottomBaseWidth, _thickness ]);

        translate([ h1dist, hbdist, -1 ]) cylinder(h = _thickness + 2, r = _holeDiameter / 2);
        translate([ h2dist, hbdist, -1 ]) cylinder(h = _thickness + 2, r = _holeDiameter / 2);
    }
    translate([ _supportThickness * 10, _bottomBaseWidth - 10, 0 ]) rotate([ 0, 180, 0 ])
        cableHolder(_supportThickness);
    translate([ _length - (_supportThickness * 5), _bottomBaseWidth - 10, 0 ]) rotate([ 0, 180, 0 ])
        cableHolder(_supportThickness);
}

_holderThickness = 1;
_shorting = 1.5;
module cableHolder(t = 3)
{
    difference()
    {
        union()
        {
            rotate([ -90, 0, 0 ]) linear_extrude(t) polygon([ [ 0, 0 ], [ t, 0 ], [ t, -t ] ]);
            translate([ t, 0, 0 ]) cube([ t * 3, t, t ]);
            rotate([ -90, 0, 0 ]) linear_extrude(t) polygon([[t * 4, 0], [t * 5, 0], [t * 4, -t]]);
            difference()
            {
                translate([ 0, 0, t - _holderThickness ]) linear_extrude(_holderThickness)
                    polygon([[t, 0], [t * 4, 0], [t * 2.5, -(t * 1.5)]]);
                translate([ 0, -(t * 1.5) - 0.5, t - _holderThickness - 1 ])
                    cube([ t * 5, _shorting + 0.5, _holderThickness + 2 ]);
            }
            _pos = t * 1.5 - _shorting;
            translate([ t*2, -t, t - (_holderThickness * 2) ]) cube([ t, _holderThickness, _holderThickness ]);
        }

        translate([t*2,-t-_holderThickness,t-(_holderThickness * 2)]) pacman(_holderThickness+2);
        translate([t*3,-t-_holderThickness,t-(_holderThickness * 2)]) mirror([1,0,0]) pacman(_holderThickness+2);
    }
}

module pacman(_h = 3, _r = 1)
{
    translate([_r,_h,_r])
    rotate([90,0,0])
    difference()
    {
        translate([ -_r-1, -_r-1, 0 ]) cube([ _r+1, _r+1, _h ]);
        translate([ 0, 0, -1 ]) cylinder(h = _h+2, r = _r);
    }
}

module topBase()
{
    cube([_length,_topBaseWidth,_thickness]);
}