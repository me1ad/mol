extends Node2D

@export var old : bool = false
@onready var sprite_2d: Sprite2D = $StaticBody2D/Sprite2D
const PILLAR_OLD = preload("uid://c0ywhntwrdbt")
const PILLAR = preload("uid://0spgurrjyh2h")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if old:
		sprite_2d.set_texture(PILLAR_OLD)
	else:
		sprite_2d.set_texture(PILLAR)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func vanish() -> void:
	queue_free()
	
