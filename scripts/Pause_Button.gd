extends Button

var spill_anim = preload("res://assets/images/pause/hoverAnimation.tres")
var normal_anim = preload("res://assets/images/pause/pause_unpressed.png")
var pressed_anim = preload("res://assets/images/pause/pause_pressed.png")
var unspill_anim = preload("res://assets/images/pause/unspillAnimation.tres")
@onready var pause_menu: Control = $"../Pause Menu"

func change_anim(anim, spill: bool = false, unspill: bool = false):
	if get_button_icon() == anim: return
	if spill:
		spill()
	if get_button_icon() ==  spill_anim:
		while spill_anim.current_frame != 14:
			await get_tree().process_frame
	if unspill:
		unspill()
		while unspill_anim.current_frame != 14:
			await get_tree().process_frame
	set_button_icon(anim)

func spill():
	set_button_icon(spill_anim)
	spill_anim.current_frame = 0

func unspill():
	set_button_icon(unspill_anim)
	unspill_anim.current_frame = 0

func _ready():
	change_anim(normal_anim)

func _on_button_down():
	if not Globals.paused:
		print("pressed!")
		pause()
	else:
		unpause()
		print("unpressed!")
	release_focus()
		

func pause():
	change_anim(pressed_anim, true)
	pause_menu.visible = true
	Globals.paused = true

func unpause():
	change_anim(normal_anim, false, true)
	pause_menu.visible = false
	Globals.paused = false

func _process(delta):
	pass
