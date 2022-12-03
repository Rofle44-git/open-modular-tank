extends Button


signal new_save(save)


func _on_button_up() -> void:
	var s: Save = Save.new();
	s.name = "%s/%s" % [glob.SAVES_LOCATION, str(Time.get_unix_time_from_system())];
	var e: int = ResourceSaver.save(s, s.name + ".tres", ResourceSaver.FLAG_BUNDLE_RESOURCES);
	if e != OK: printerr(e);
	game.active_save = s;
	get_tree().change_scene_to_packed(glob.lobby_scene);

