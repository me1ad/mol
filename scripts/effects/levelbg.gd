extends Sprite2D

@export var shift: int
@export var shifty: bool
@export var shiftx: bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if shiftx:
		position.x += randi_range(-1 * shift,shift)
	if shifty:
		position.y += randi_range(-1 * shift,shift)
