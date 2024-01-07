extends CharacterBody3D
class_name Player

@onready var SPEED = 5.5
@onready var rotate_speed = 3.0

var can_move : bool = true

func _physics_process(delta):
	if not can_move:
		return
	
	# Get the input direction and handle the movement.
	var dir : Vector2 = Vector2.ZERO
	
	var z_movement : float = Input.get_action_strength("move_backward") - Input.get_action_strength("move_forward")
	var rotate : float = Input.get_action_strength("move_left") - Input.get_action_strength("move_right")
	
	rotation.y += rotate * rotate_speed * delta
	
	if Input.is_action_pressed("move_forward"):
		dir += Vector2.UP
	if Input.is_action_pressed("move_backward"):
		dir += Vector2.DOWN
	
	#var input_dir = Input.get_vector("move_forward", "move_backward")
	var direction = (transform.basis * Vector3(dir.x, 0, dir.y)).normalized()
	velocity = Vector3(direction.x * SPEED, 0, direction.z * SPEED)

	move_and_slide()

func freeze():
	can_move = false
