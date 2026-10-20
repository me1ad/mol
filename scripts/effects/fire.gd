extends Node2D

@onready var label: Label = $Label
@onready var timer: Timer = $Timer
@onready var firewood_interact: Node2D = $"../FirewoodInteract"


const loops = 5
var loop_count = 0

func fire():
	visible = true
	timer.start()



func _on_timer_timeout() -> void:
	if loop_count == loops:
		Globals.fire_out.emit()
		queue_free()
	loop_count += 1
	label.label_settings.font_size += 5
	label.rotation_degrees += randi_range(0,100)
	timer.start()
