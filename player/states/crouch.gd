class_name PlayerStateCrouch extends PlayerState

@export var deceleration_rate: float = 10.0

func init() -> void:
	pass
	
func enter() -> void:
	player.sprite.scale.y = 0.675
	player.collision_stand.disabled = true
	player.collision_crouch.disabled = false
	
func exit() -> void:
	player.sprite.scale.y = 1
	player.collision_stand.disabled = false
	player.collision_crouch.disabled = true
	
func handle_input(event: InputEvent) -> PlayerState:
	if event.is_action_pressed("jump"):
		if player.one_way_platform_raycast.is_colliding() == true:
			player.position.y += 4
			return fall
		return jump
	return next_state
	
func process(_delta: float) -> PlayerState:
	if player.direction.y <= 0.5:
		return idle
	return next_state
	
func physics_process(delta: float) ->  PlayerState:
	player.velocity.x -= player.velocity.x * deceleration_rate * delta
	return next_state
