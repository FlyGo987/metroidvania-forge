class_name PlayerStateFall extends PlayerState

func init() -> void:
	pass
	
func enter() -> void:
	pass
	
func exit() -> void:
	pass
	
func handle_input(_event: InputEvent) -> PlayerState:
	return next_state
	
func process(_delta: float) -> PlayerState:
	return next_state
	
func physics_process(_delta: float) ->  PlayerState:
	if player.is_on_floor():
		return idle
	if player.direction.x != 0:
		player.velocity.x = player.move_speed * player.direction.x
	return next_state
