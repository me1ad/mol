extends Button

@onready var label: Label = get_child(-1)

@onready var NORMAL_SIZE = label.label_settings.font_size
@onready var HOVER_SIZE = NORMAL_SIZE + 3


func _on_mouse_entered() -> void:
	label.label_settings.font_size = HOVER_SIZE

func _on_mouse_exited() -> void:
	label.label_settings.font_size = NORMAL_SIZE
