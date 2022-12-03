extends Node
## Singleton handling anything regarding saves or gameplay


var active_save: Save;
var start_time: int;


func _ready() -> void:
	make_dirs([glob.SAVES_LOCATION, glob.MODS_LOCATION]);

func make_dirs(paths: Array[String]) -> void:
	for path in paths:
		if !DirAccess.open(path):
			DirAccess.make_dir_absolute(path);

func save() -> void:
	active_save.apply_timestamp();
	active_save.apply_playtime(start_time);
	var e: int = ResourceSaver.save(active_save, active_save.name + ".tres", ResourceSaver.FLAG_BUNDLE_RESOURCES);
	if e != OK:
		glob.quick_popup(glob.PopupType.ERROR, "Failed to save!");

func _on_game_start() -> void:
	start_time = int(Time.get_unix_time_from_system());

func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		if active_save != null:
			save();
			get_tree().change_scene_to_packed(glob.title_scene);
