$fn = 100;

jig();

module jig()
{
    difference()
    {
        union()
        {
            base();
            translate([0,0,50])rotate([180,0,0])base();
            pole();
            rotate([0,0,120])pole();
            rotate([0,0,-120])pole();
        }
        translate([-37,-30,-20])cube([30,60,100]);
    }
}

module bushing()
{
    translate([0,0,10])
    rotate([0,90,0])
    translate([60,-5,-60])
    difference()
    {
        import("filament_joiner.stl");

        translate([ -100, 5, 60 ]) rotate([ 0, 90, 0 ])
        difference()
        {
            cylinder(h = 200, r = 100);
            translate([ 0, 0, -25 ]) cylinder(h = 125, r = 8);
        }
    }
}

module arm()
{
    translate([6,-2.5,0])cube([5,5,10]);
}

module pole()
{
    translate([10,-2.5,0])cube([5,5,50]);
}

module base()
{
    hollow_bushing();
    difference()
    {
        cylinder(h=10, r=15);
        translate([0,0,-1])cylinder(h=12, r=10);
    }
    arm();
    rotate([0,0,120])arm();
    rotate([0,0,-120])arm();
}

module hollow_bushing()
{
    difference() 
    {
        bushing();
        translate([0,0,5]) cylinder(h = 15, r = 3.7);
    }
}

module double_bushing()
{
    hollow_bushing();
    translate([0,0,12])rotate([180,0,0]) hollow_bushing();
}