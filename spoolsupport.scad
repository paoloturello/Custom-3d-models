$fn=50;

width=75;
distance=55;
supportRadius=7.5;
thickness=3;
holderWidth=10;
borderHeight=5;
borderWidth=3;
hasEars=true;

translate([supportRadius*2-2,0,0]) cube([distance+2+2,holderWidth,thickness]);
translate([supportRadius*2-2,0,thickness-1]) cube([distance+2+2,borderWidth,borderHeight+1]);

translate([supportRadius*2-2,width-holderWidth,0]) cube([distance+2+2,holderWidth,thickness]);
translate([supportRadius*2-2,width-borderWidth,thickness-1]) cube([distance+2+2,borderWidth,borderHeight+1]);

support();
translate([distance+2*2*supportRadius,0,0]) mirror([1,0,0]) support();

module support()
{
    translate([supportRadius,0,0]) 
    rotate([-90,0,0]) 
    difference()
    {
        cylinder(h = width, r = supportRadius);
        translate([-supportRadius-1,0,-1])cube([supportRadius*2+2,supportRadius+1,width+2]);
    }

    translate([supportRadius,0,0]) 
    rotate([-90,0,0]) 
    difference()
    {   
        cylinder(h = borderWidth, r = supportRadius+borderHeight);
        translate([-supportRadius-borderHeight-1,0,-1])cube([(supportRadius+borderHeight)*2+2,supportRadius+borderHeight+1,width+2]);
    }
    if (hasEars)
    {
        translate([-borderHeight,borderWidth/2])ear();
    }

    translate([supportRadius,width-borderWidth,0]) 
    rotate([-90,0,0]) 
    difference()
    {   
        cylinder(h = borderWidth, r = supportRadius+borderHeight);
        translate([-supportRadius-borderHeight-1,0,-1])cube([(supportRadius+borderHeight)*2+2,supportRadius+borderHeight+1,width+2]);
    }
    if (hasEars)
    {
        translate([-borderHeight,width-borderWidth/2])ear();
    }
}

module ear()
{
    cylinder(h = 0.2, r = 5);
}