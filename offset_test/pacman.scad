// scale([2,2,2]){
//   translate([0,0,0]){
//     // Pacman head
//     difference(){
//       circle(d=10);
//       rotate([0,0,-30])pie_slice(10,60);
//     }
//   }
// }

// module pie_slice(r=3.0,a=30) {
//   $fn=64;
//   intersection() {
//     circle(r=r);
//     square(r);
//     rotate(a-90) square(r);
//   }
// }

module pie_slice(angle, radius, thickness) {
  difference() {
    translate([radius, 0, 0]) {
      rotate([0, 0, -angle/2]) {
        cylinder(r=radius, h=thickness, center=true);
      }
    }
    translate([radius-thickness, 0, 0]) {
      rotate([0, 0, -angle/2]) {
        cylinder(r=radius-thickness, h=thickness, center=true);
      }
    }
  }
}

scale([2,2,2]){
  translate([0,0,0]){
    // Pacman head
    difference(){
      circle(d=10);
      rotate([0,0,180]){
        translate([5,0,0]){
          #pie_slice(10, 5, 1);
        }
      }
    }
  }
}

render();
