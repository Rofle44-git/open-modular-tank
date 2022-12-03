class_name Save
extends Resource
## Resource that saves Data about the Player's Progress


var name: String;
var time_played: int;  # Unix format
var total_waves: int;
var inventory: Inventory;
var last_played: String;


func apply_timestamp() -> void:
	last_played = Time.get_date_string_from_system();

func apply_playtime(start_time: int) -> void:
	time_played += Time.get_unix_time_from_system() - start_time;

