extends Node


var mods: Array[String] = [];
var loaded_mods: Array[String] = [];


func scan() -> void:
	var dir: DirAccess = DirAccess.open(glob.SAVES_LOCATION);
	var f: String;
	
	# If successfully opened, start scanning
	if dir:
		dir.list_dir_begin();
		f = dir.get_next();
		
		while f != "":
			if !dir.current_is_dir():
				# TODO: Append with full path
				if f.ends_with(".pck"): mods.append(f);
				
			f = dir.get_next();

func get_loaded_mods() -> void:
	loaded_mods = conf.config.get_value("mods", "loaded_mods", []);

func load_content() -> void:
	pass
