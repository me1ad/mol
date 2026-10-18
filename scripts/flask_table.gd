extends Node2D


@onready var slime: CharacterBody2D = %Slime

func _on_interacted() -> void:
	slime.get_potion()
	queue_free()
