class_name Tank
extends CharacterBody2D


signal trigger_down(force);
signal trigger_up;
signal reload_down;
signal reload_up;
@export_range(0, 9999, 1) var speed: int = 700;
@export_range(0.0, 360, 0.5, "radians") var rotation_speed: float = PI;
var weapon: Weapon;
var rotational_velocity: float;
@onready var tracks: Node2D = $Tracks;
