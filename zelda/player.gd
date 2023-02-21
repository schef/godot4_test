extends CharacterBody2D


const move_speed: int = 100

@onready var animation_tree: AnimationTree = %AnimationTree

func _physics_process(delta):
	var input_direction = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		)

	if input_direction != Vector2.ZERO:
		animation_tree.set("parameters/idle/blend_position", input_direction)
		animation_tree.set("parameters/walk/blend_position", input_direction)
	velocity = input_direction * move_speed
	
	if velocity != Vector2.ZERO:
		animation_tree.set("parameters/idle_or_walk/blend_amount", 1)
	else:
		animation_tree.set("parameters/idle_or_walk/blend_amount", 0)
	
	move_and_slide()
