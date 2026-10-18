extends "res://scripts/gui/button.gd"


func _ready() -> void:
	label.text = name
	if int(name) > Globals.level_reached:
		label.label_settings.font_color = Color(0.20, 0.20, 0.407, 1.0)
		disabled = true
		disconnect("mouse_entered", _on_mouse_entered)

func _on_button_down() -> void:
	get_tree().change_scene_to_file("res://levels/level"+ name + ".tscn");
	Globals.cur_level = int(name)
