extends Control


func _ready() -> void:
	visible = false;
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE);

func _unhandled_input(_event: InputEvent) -> void:
	if _event.is_action_pressed("ui_cancel"):
		visible = !visible;
		get_tree().paused = visible;
		
		if visible: Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE);
		else: Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN);
