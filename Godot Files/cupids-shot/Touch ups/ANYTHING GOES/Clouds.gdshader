shader_type canvas_item;
uniform float h_speed = .02;
void vertex() {
	UV.x += TIME * h_speed;

}