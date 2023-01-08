translate([10,10,0])letter("P");

font = "Liberation Sans";
letter_size = 16;
letter_height = 2;

module letter(l) {
	// Use linear_extrude() to make the letters 3D objects as they
	// are only 2D shapes when only using text()
	linear_extrude(height = letter_height) {
		text(l, size = letter_size, font = font, halign = "center", valign = "center", $fn = 50);
	}
}