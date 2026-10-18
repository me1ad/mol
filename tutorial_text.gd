extends Node2D

@onready var label: Label = $content/Label
@onready var content: Node2D = $content

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Slime":
		content.visible = true
		print("in!")
		print(content.visible)
		print(label.text)

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Slime":
		content.visible = false
		print("out!")
		print(content.visible)
