extends Node2D


@onready var slime: CharacterBody2D = %Slime

func _ready():
	$InteractArea.interacted.connect(_on_interacted)

func _on_interacted() -> void:
	if not slime.inventory_full():
		slime.get_metal()
		Globals.rock_picked_up.emit()
		queue_free()
