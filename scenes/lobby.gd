extends Node2D


func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN);
	# Setting start time to measure playtime.
	game.start_time = int(Time.get_unix_time_from_system());
	
