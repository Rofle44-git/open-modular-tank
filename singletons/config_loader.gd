extends Node


var config: ConfigFile = ConfigFile.new();
var default_data: Dictionary = {
	"mods": {
		"allow_pck": false,
		"loaded_mods": [],
	},
	"settings": {
		"graphics_fullscreen": true,
	},
}


func _ready() -> void:
	load_config();
	apply_settings();

func load_config() -> void:
	if !FileAccess.file_exists(glob.CONFIG_LOCATION):
		create_config();
	
	config.load(glob.CONFIG_LOCATION);

func save_config(reload: bool = true) -> void:
	config.save(glob.CONFIG_LOCATION);
	if reload: config.load(glob.CONFIG_LOCATION);

func create_config() -> void:
	var c: ConfigFile = ConfigFile.new();
	for section in default_data.keys():
		for property in default_data[section]:
			c.set_value(section, property, default_data[section][property]);
	
	c.save(glob.CONFIG_LOCATION);

func apply_settings() -> void:
	match config.get_value("settings", "graphics_fullscreen", false):
		true: DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN);
		false: DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED);
