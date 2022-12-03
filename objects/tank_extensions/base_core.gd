class_name TankCore
extends Node


@export var max_hp_upgrader: Upgrader;
@export var hp_regeneration_upgrader: Upgrader;
@onready var max_hp: float = max_hp_upgrader.get_value();
@onready var hp_regeneration: float = hp_regeneration_upgrader.get_value();
