botrad=15*sqrt(2) + 1;
difference() 
{
cylinder(3,botrad,botrad+3);
translate([0,0,1.5])cylinder(3, botrad-2,(botrad+3) * (botrad-2) / botrad);
}