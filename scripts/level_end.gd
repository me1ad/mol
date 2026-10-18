extends Node2D

@export var weak := false

func _ready():
	if weak:
		$wall.weaken()
	else:
		$wall.revitalize()

func _on_clear_zone_body_entered(body: Node2D) -> void:
	print("Something inside... sp00ky!")
	if body.name == "Slime":
		print("Player entered!")
		Globals.cur_level += 1
		Globals.level_reached = max(Globals.level_reached, Globals.cur_level)
		if Globals.cur_level <= Globals.max_level:
			get_tree().change_scene_to_file("res://levels/level"+ str(Globals.cur_level) + ".tscn");
			print("Sending player to res://levels/level"+ str(Globals.cur_level) + ".tscn")
		else:
			get_tree().change_scene_to_file("res://levels/levelselect.tscn")
