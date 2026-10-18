extends Node2D

@export_enum ("E", "Click") var interact_method : int
@onready var sprite_2d: Sprite2D = $Sprite2D

var char_in_area : bool = false
signal interacted

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Slime":
		char_in_area = true
		sprite_2d.visible = true
		print("locked on target")

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Slime":
		char_in_area = false
		sprite_2d.visible = false
		print("target lost")

func _input(event: InputEvent) -> void:
	if event is InputEventKey and char_in_area:
		if event.is_action_pressed("interact"):
			print("interact!")
			emit_signal("interacted")
