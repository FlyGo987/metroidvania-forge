class_name Player extends CharacterBody2D

#region /// State Machine Variables
var states: Array[PlayerState]
var current_state: PlayerState:
	get: return states.front()
var previous_state: PlayerState:
	get: return states[1]
#endregion

#region /// Standard Variables
var direction: Vector2 = Vector2.ZERO
var gravity: float = 980
#endregion

func _ready() -> void:
	initialize_states()
	pass

func _unhandled_input(event: InputEvent) -> void:
	change_state(current_state.handle_input(event))
	pass
	

func _process(_delta: float) -> void:
	update_direction()
	change_state(current_state.process(_delta))
	pass
	
func _physics_process(_delta: float) -> void:
	velocity.y += gravity * _delta
	change_state(current_state.physics_process(_delta))
	move_and_slide()
	pass


func initialize_states() -> void:
	states = []
	#gather all the states
	for c in $States.get_children():
		if c is PlayerState:
			states.append(c)
			c.player = self
			
	if states.size() == 0:
		return
		
	#initialize all states
	for state in states:
		state.init()
	#set our first state
	pass

func change_state(new_state: PlayerState) -> void:
	if new_state == null:
		return
	elif new_state == current_state:
		return
	
	if current_state:
		current_state.exit()
		
	states.push_front(states)
	new_state.enter()
	states.resize(3)
	pass
	
func update_direction():
	var prev_dirction: Vector2 = direction
	var direction = Input.get_vector("left", "right", "up", "down")
	pass
