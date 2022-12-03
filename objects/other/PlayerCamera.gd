class_name PlayerCamera
extends Camera2D


const MIN_ZOOM: Vector2 = Vector2(0.135, 0.135);
const MAX_ZOOM: Vector2 = Vector2(1.0, 1.0);
const ZOOM_FACTOR: float = 0.65;
@export var start_zoom: Vector2 = Vector2(1, 1);
var target_zoom: Vector2;


func _ready() -> void:
	zoom = start_zoom;
	target_zoom = zoom;

func _process(_delta: float) -> void:
	zoom = zoom.lerp(target_zoom, 0.2);

func zoom_in() -> void:
	target_zoom /= ZOOM_FACTOR;
	target_zoom = clamp(target_zoom, MIN_ZOOM, MAX_ZOOM);

func zoom_out() -> void:
	target_zoom *= ZOOM_FACTOR;
	target_zoom = clamp(target_zoom, MIN_ZOOM, MAX_ZOOM);
