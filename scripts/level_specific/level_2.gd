extends Node2D

@onready var label: Label = $TutorialText2/content/Label

func _ready():
	Globals.wall_weakened.connect(_on_wall_weakened)

func _on_wall_weakened():
	label.text = "< Great! > Now smash the\nwall down."
