extends Node2D

@export var old : bool = false
@onready var sprite_2d: Sprite2D = $StaticBody2D/Sprite2D
const PILLAR_OLD = preload("uid://c0ywhntwrdbt")
const PILLAR = preload("uid://0spgurrjyh2h")

var player_in_area : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if old:
		sprite_2d.set_texture(PILLAR_OLD)
	else:
		sprite_2d.set_texture(PILLAR)

func vanish() -> void:
	queue_free()

func olden() -> void:
	old = true
	sprite_2d.set_texture(PILLAR_OLD)

func revitalize() -> void:
	old = false
	sprite_2d.set_texture(PILLAR)

func _on_interacted() -> void:
	if old:
		vanish()
	else:
		print("Whoops! Tough luck, buddy.")
