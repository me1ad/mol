extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_play_button_down() -> void:
	var target_level = min(4, Globals.level_reached)
	get_tree().change_scene_to_file("res://levels/level" + str(target_level) + ".tscn")
	print("res://scenes/level" + str(target_level) + ".tscn")
	Globals.cur_level = target_level
func _on_level_select_button_down() -> void:
	get_tree().change_scene_to_file("res://levels/levelselect.tscn")


func _on_quit_button_down() -> void:
	get_tree().quit()
