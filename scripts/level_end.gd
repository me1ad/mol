extends Node2D

func _on_clear_zone_body_entered(body: Node2D) -> void:
	print("Something inside... sp00ky!")
	if body.name == "Slime":
		print("Player entered!")
		Globals.cur_level += 1
		Globals.level_reached = max(Globals.level_reached, Globals.cur_level)
		if Globals.cur_level <= Globals.max_level:
			get_tree().change_scene_to_file("res://levels/level"+ str(Globals.cur_level) + ".tscn");
		else:
			get_tree().change_scene_to_file("res://scenes/levelselect.tscn")
func _ready():
	$wall.vanish()
