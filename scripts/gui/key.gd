extends Sprite2D


@onready var ogPos = position
const min_shake_interval = .18
var time_since_last_shake := 0.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time_since_last_shake += delta
	if time_since_last_shake > min_shake_interval:
		position = ogPos + (randf()-0.5) * Vector2(0,1) + (randf()-0.5) * Vector2(1,0)
		time_since_last_shake = 0
