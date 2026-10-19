extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.x += randi_range(-200,200)
