extends Node2D


@onready var slime: CharacterBody2D = %Slime

func _on_interacted() -> void:
	if not slime.inventory_full():
		slime.get_potion()
		Globals.potion_picked_up.emit()
		queue_free()
