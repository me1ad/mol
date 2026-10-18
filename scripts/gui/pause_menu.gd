extends Control

const PauseButton = preload("uid://cm3q8eeqtokdk")
@onready var pause_menu: Control = $"."

signal unpaused

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_continue_pressed() -> void:
	Globals.paused = false
	pause_menu.visible = false
	emit_signal("unpaused")
	print("wabing!")

func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/main_menu.tscn")

func _on_level_select_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/levelselect.tscn")
