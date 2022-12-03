class_name StateMachine
extends Resource


signal transitioned(state);
@export var initial_state: String;
@export var states: Dictionary;
@onready var state: State = states[initial_state];


func _init(_states: Array[String]) -> void:
	for _state in _states:
		states[state] = State.new(_state);

func _unhandled_input(event: InputEvent) -> void:
	state._virt_input(event);

func _process(delta: float) -> void:
	state._virt_process(delta);

func _physics_process(delta: float) -> void:
	state._virt_physics_process(delta);

func transition_to(state_name: String) -> void:
	if states.has(state_name):
		assert(states.has(state_name), "State %s does not exist" % state_name);
		return;
	
	state.exit();
	state = states[state_name];
	state.enter();
	emit_signal("transitioned", state.name);
