class_name Inventory
extends Resource
## Stores items and their upgrades
## Name syntax mod_name.weapon_name


enum ItemType{
	WEAPON,
	TRACK,
	CORE,
	EQUIPPED,
};
var weapons: Dictionary = {};
var tracks: Dictionary = {};
var cores: Dictionary = {};
var equipped: Dictionary = {
	"core": "",
	"tracks": "",
	"weapon": "",
};


## Adds an item and it's upgrade levels
func add_item(type: ItemType, item_name: String, item: Variant, upgrades: Dictionary) -> void:
	match type:
		ItemType.WEAPON: weapons[item_name] = [item, upgrades];
		ItemType.TRACK: tracks[item_name] = [item, upgrades];
		ItemType.CORE: cores[item_name] = [item, upgrades];

## Checks for a property in the Inventory
func has_item(type: ItemType, item_name: String) -> bool:
	match type:
		ItemType.WEAPON: return item_name in weapons;
		ItemType.TRACK: return item_name in tracks;
		ItemType.CORE: return item_name in cores;
		_: return false;

## Returns item and list of upgrades
func get_item(type: ItemType, item_name: String) -> Array:
	if has_item(type, item_name):
		match type:
			ItemType.WEAPON: return weapons[item_name];
			ItemType.TRACK: return tracks[item_name];
			ItemType.CORE: return cores[item_name];
	return [];

func get_equipped() -> Array:
	var _return: Array = [];
	for item in equipped.keys():
		if item != "":
			_return.append(item);
		
		else:
			print("Warning: No items equipped, using fallback equipment");
			equipped["core"] = "game.standard_core";
			equipped["tracks"] = "game.standard_tracks";
			equipped["weapon"] = "game.standard_weapon";
			return [];
	
	return _return;
