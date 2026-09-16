class_name PlayerStateJump extends PlayerState

@export var jump_velocity: float = 450.0

func init() -> void:
	pass
	
func enter() -> void:
	# play animations
	player.velocity.y -= jump_velocity
	pass
	
func exit() -> void:
	pass
	
func handle_input(_event: InputEvent) -> PlayerState:
	return next_state
	
func process(_delta: float) -> PlayerState:
	return next_state
	
func physics_process(_delta: float) ->  PlayerState:
	# here should be precautions against jump on a floor perfectly without falling
	#if player.is_on_floor():
	#	return idle
	if player.velocity.y >= 0:
		return fall
	if player.direction.x != 0:
		player.velocity.x = player.move_speed * player.direction.x
	return next_state
