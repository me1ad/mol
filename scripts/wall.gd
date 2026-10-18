extends Node2D

@export var weak : bool = false
@onready var sprite_2d: Sprite2D = $StaticBody2D/Sprite2D
#const PILLAR_OLD = preload("uid://c0ywhntwrdbt")
#const PILLAR = preload("uid://0spgurrjyh2h")

@export var PILLAR_WEAK : CompressedTexture2D
@export var PILLAR : CompressedTexture2D

var player_in_area : bool = false
@onready var slime: CharacterBody2D = $"../../Slime"

signal wall_interacted_with

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if weak:
		sprite_2d.set_texture(PILLAR_WEAK)
	else:
		sprite_2d.set_texture(PILLAR)

func vanish() -> void:
	queue_free()

func weaken() -> void:
	weak = true
	sprite_2d.set_texture(PILLAR_WEAK)

func revitalize() -> void:
	weak = false
	sprite_2d.set_texture(PILLAR)

func _on_interacted() -> void:
	if weak:
		vanish()
	elif slime.has_potion():
		weaken()
		modulate = Color.WHITE
		Globals.wall_weakened.emit()
		slime.remove_potion()
	else:
		print("Whoops! Tough luck, buddy.")
	emit_signal("wall_interacted_with")
