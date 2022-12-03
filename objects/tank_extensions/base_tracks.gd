@tool
extends Node2D


@export var radius: float = 150.0;
var rotational_velocity: float;
var track_velocity: float;
@onready var l: Node2D = $L;
@onready var r: Node2D = $R
@onready var track_height: float = l.region_rect.size.y;


func _process(_delta: float) -> void:
	if Engine.is_editor_hint():
		$L.position.x = -radius;
		$R.position.x = radius;

func rotate_with_tracks(rad: float) -> void:
	rotational_velocity = rad * r.position.x / 2.0;
	
	l.region_rect.position.y += rotational_velocity;
	r.region_rect.position.y -= rotational_velocity;
	
	if absf(r.region_rect.position.y) > track_height:
		l.region_rect.position.y = fmod(l.region_rect.position.y, track_height);
		r.region_rect.position.y = fmod(r.region_rect.position.y, track_height);

func move_with_tracks(velocity_y: float, _rotation: float) -> void:
	track_velocity = velocity_y / Vector2.DOWN.rotated(_rotation).y;
	l.region_rect.position.y += track_velocity;
	r.region_rect.position.y += track_velocity;
