draw_sprite_ext(spr_test, 0, 32, 32, 64, 64, 0, c_white, 1);

var surface = surface_create(2, 2);


surface_set_target(surface);
draw_sprite(spr_test, 0, 0, 0);

surface_reset_target();




draw_surface_ext(surface, 256, 32, 64, 64, 0, c_white, 1);

var buffer = buffer_create(surface_get_width(surface) * surface_get_height(surface) * 4, buffer_fixed, 1);
buffer_get_surface(buffer, surface, 0);

draw_set_color(c_black);
var r = buffer_peek(buffer, 0, buffer_u8);
var g = buffer_peek(buffer, 1, buffer_u8);
var b = buffer_peek(buffer, 2, buffer_u8);
var a = buffer_peek(buffer, 3, buffer_u8);
draw_text(32, 256, "First color: " + string(r) + ", " + string(g) + ", " + string(b) + " @ " + string(a));

var r = colour_get_red(buffer_peek(buffer, 4, buffer_u32));
var g = colour_get_green(buffer_peek(buffer, 4, buffer_u32));
var b = colour_get_blue(buffer_peek(buffer, 4, buffer_u32));
var a = buffer_peek(buffer, 0, buffer_u32) >> 24;
draw_text(32, 288, "Second color: " + string(r) + ", " + string(g) + ", " + string(b) + " @ " + string(a));
draw_text(32, 320, "Third color: " + string(buffer_peek(buffer, 8, buffer_u32)));
draw_text(32, 352, "Fourth color: " + string(buffer_peek(buffer, 12, buffer_u32)));

buffer_poke(buffer, 0, buffer_u8, 255);
buffer_poke(buffer, 1, buffer_u8, 0);
buffer_poke(buffer, 2, buffer_u8, 0);
buffer_poke(buffer, 3, buffer_u8, 120);

buffer_set_surface(buffer, surface, 0);



draw_surface_ext(surface, 544, 32, 64, 64, 0, c_white, 1);



surface_free(surface);
buffer_delete(buffer);