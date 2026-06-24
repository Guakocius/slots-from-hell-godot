extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	var direction_h := Input.get_axis("ui_left", "ui_right")
	var direction_v := Input.get_axis("ui_up", "ui_down")
	if direction_h:
		velocity.x = direction_h * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if direction_v:
		velocity.y = direction_v * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
