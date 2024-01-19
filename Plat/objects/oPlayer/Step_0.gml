var keyLeft = keyboard_check(ord("A"));
var keyRight = keyboard_check(ord("D"));
var keyJump = keyboard_check(vk_space);

//horizontal movement
hsp = (keyRight - keyLeft) * hspWalk;

//vertical movement
vsp = vsp + grv;

//calculate jumps
if (canJump-- > 0) && (keyJump) {
	vsp = vspJump;
	canJump = 0;
}

//collide and move
if (place_meeting(x + hsp, y, myTilemap)) {
	while (abs(hsp) > 0.1) {
		hsp *= 0.5;
		if (!place_meeting(x + hsp, y, myTilemap)) x += hsp;
	}
	
	hsp = 0;
}

x += hsp;

if (place_meeting(x, y + vsp, myTilemap)) {
	if (vsp > 0) canJump = 10;
	while (abs(vsp) > 0.1) {
		vsp *= 0.5;
		if (!place_meeting(x, y + vsp, myTilemap)) y += vsp;
	}
	
	vsp = 0;
}

y += vsp;