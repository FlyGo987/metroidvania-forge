class_name PlayerStateJump extends PlayerState

@export var jump_velocity: float = 450.0

func init() -> void:
	pass
	
func enter() -> void:
	# play animations
	player.add_debug_indicator(Color.LIME_GREEN)
	player.velocity.y = -jump_velocity
	pass
	
func exit() -> void:
	player.add_debug_indicator(Color.YELLOW)  
	pass
	
func handle_input(event: InputEvent) -> PlayerState:
	if event.is_action_released("jump"):
		player.velocity.y *= 0.5
		return fall
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
