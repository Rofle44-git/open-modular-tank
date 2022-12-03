class_name Upgrader
extends Resource
## Use to manage upgrades for variables
## As of now, upgrades are finite
## TODO: Math expression support


## Name of the object that utilizes this upgrader (used for saving the upgrader values)
@export var owner_name: String = "";
## The name of the property (used for saving the upgrader values)
@export var property_name: String = "";
## The price for each individual upgrade (index one will be the cost to upgrade to level 2)
@export var prices: Array[float] = [];
## The value for each individual level (index one will be the value for level one, so this array would need one more index than "Prices")
@export var values: Array[float] = [];
var level: int;
var max_level: int;


func _ready() -> void:
	level = game.active_save.inventory.read_upgrade(owner_name, "%s.level" % property_name, "level");
	print("Level of property %s from %s is %s" % [property_name, owner_name, level])

func get_price() -> float:
	return prices[level];

func get_value() -> Variant:
	return values[level];
