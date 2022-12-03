class_name State
extends Resource


var name: String;


func _init(_name: String) -> void:
	name = _name;

func _virt_input(_event: InputEvent) -> void:
	pass;

func _virt_process(_delta: float) -> void:
	pass;

func _virt_physics_process(_delta: float) -> void:
	pass;

func enter() -> void:
	pass;

func exit() -> void:
	pass;
