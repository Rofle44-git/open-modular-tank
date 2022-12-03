class_name Menu
extends CenterContainer
## Animated Menu to be used in the MenuContainer scene


signal shown


func _ready() -> void:
	visible = false;

## Override hide() function to show with Animation
func show() -> void:
	visible = true;
	emit_signal("shown");

## Override hide() function to hide with Animation
func hide() -> void:
	visible = false;
	emit_signal("hidden");
