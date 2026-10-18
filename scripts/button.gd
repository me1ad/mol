extends Button

@onready var label: Label = $Label

const HOVER_SIZE = 28
const NORMAL_SIZE = 25

func _on_mouse_entered() -> void:
	label.label_settings.font_size = HOVER_SIZE
	print("entered")
	print(label.get_theme_font_size("font_size"))

func _on_mouse_exited() -> void:
	label.label_settings.font_size = NORMAL_SIZE
	print("exited")
