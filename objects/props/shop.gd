extends Area2D


@export var objects: Node2D;





func _on_body_entered(body: Node2D) -> void:
	objects.set_process(false);
