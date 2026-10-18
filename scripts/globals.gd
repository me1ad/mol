extends Node

var paused := false
var level_reached := 1
var cur_level := 1
const max_level = 3

signal wall_weakened
signal rock_picked_up
signal potion_picked_up
signal fire_out
