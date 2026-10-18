extends Node2D


@onready var label1 = $TutorialText/content/Label
@onready var tutorialText1 = $TutorialText
@onready var tutorial_text_2: Node2D = $TutorialText2
@onready var label2: Label = $TutorialText2/content/Label
@onready var slime: CharacterBody2D = %Slime
@onready var wall: Node2D = $level_end/wall

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.rock_picked_up.connect(_on_rock_up)
	Globals.potion_picked_up.connect(_on_potion_up)
	Globals.fire_out.connect(_on_fire_out)

func _on_rock_up():
	label1.text = '''It looks shiny and\n metallic.
 Maybe it's\nPotassium?'''
	tutorialText1.content.visible = false
	tutorialText1.position.x += 150
	$border.queue_free()

func _on_rock_down():
	$Rock.visible = true
	label2.text = 'Now get the\nhot flask of H20.'
	$FirewoodInteract/Sprite2D.visible = false

func _on_potion_up():
	tutorial_text_2.queue_free()

func _on_potion_down():
	$Fire.fire()
	
func _on_fire_out():
	wall.vanish()
	$FirewoodInteract.queue_free()
	$Rock.queue_free()
	

func _on_firewood_interact_interacted() -> void:
	if slime.has_metal():
		_on_rock_down()
		slime.remove_metal()
	elif slime.has_potion():
		_on_potion_down()
		slime.remove_potion()
		#$FirewoodInteract/Sprite2D.queue_free()
	pass # Replace with function body.
