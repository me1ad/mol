extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0/1.5
const MAX_ACCEL_TIME := .19
var time_moving: float = 0

@onready var slime = get_node("AnimatedSprite2D")
const POTION = preload("uid://cds8fiy0kqvlr")
const METAL_ITEM = preload("uid://boakuhg8ll3nc")

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	slime.play()
	#$AnimatedSprite2D.modulate = Color.WHITE
	#$AnimatedSprite2D.self_modulate = Color.WHITE
	#get_potion()

func _physics_process(delta):
	if not Globals.paused:
		# Add the gravity.
		if not is_on_floor():
			velocity.y += gravity * delta

		# Handle jump.
		if Input.is_action_pressed("up") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction = Input.get_axis("left", "right")
		
		if velocity.x * SPEED < 0:
			slime.flip_h = true
			
		elif velocity.x * SPEED > 0:
			slime.flip_h = false
		
		if direction:
			time_moving += delta
			velocity.x = direction * SPEED * max(0.1,min(time_moving/MAX_ACCEL_TIME,1))
			slime.set_animation("moving")
			
		else: #slows down character if no input
			velocity.x = move_toward(velocity.x, 0, SPEED)
			slime.set_animation("default")
			time_moving = 0

		move_and_slide()

func get_potion():
	var potion = POTION.instantiate()
	$Potions.add_child(potion)

func has_potion():
	return len($Potions.get_children()) >= 1

func get_metal():
	var metal = METAL_ITEM.instantiate()
	$Metals.add_child(metal)

func has_metal():
	return len($Metals.get_children()) >= 1

func remove_metal():
	$Metals.get_child(0).queue_free()

func inventory_full():
	return has_metal() or has_potion()

func remove_potion():
	$Potions.get_child(0).queue_free()
