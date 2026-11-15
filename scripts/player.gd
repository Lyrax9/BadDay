extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var jumpsound: AudioStreamPlayer2D = $jumpsound


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var last_direction = 0
var is_attacking : bool = false
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		animated_sprite_2d.play("jumping")
		jumpsound.play()
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_pressed("attack"):
		is_attacking = true
		animated_sprite_2d.play("hit")
		
			
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if not is_on_floor():
		animated_sprite_2d.play("jumping")

	elif direction == 0:
		animated_sprite_2d.play("idle")

	else:
		animated_sprite_2d.flip_h = direction < 0
		animated_sprite_2d.play("run_right")
	if is_attacking:
		is_attacking= false			

	move_and_slide()
	

		
	
		
func _on_hitbox_area_entered(area: Area2D) -> void:
	
	if area.is_in_group("breakable_objects"):
		area.get_parent().burst() 

		
