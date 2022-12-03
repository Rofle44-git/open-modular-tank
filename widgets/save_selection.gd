extends VBoxContainer


## If 0 Saves were found, the BoxContainer for the Saves will be hidden
var none_found: bool = true;


## Scans default folder for saves
func scan_folder() -> void:
	get_parent().get_parent().visible = true;
	var dir: DirAccess = DirAccess.open(glob.SAVES_LOCATION);
	var f: String;
	
	# If successfully opened, start scanning
	if dir:
		dir.list_dir_begin();
		f = dir.get_next();
		
		while f != "":
			if !dir.current_is_dir():
				if _check(f): _add_save(ResourceLoader.load(glob.SAVES_LOCATION + '/' + f, "Save"));
				
			f = dir.get_next()
	
	if none_found:
		glob.quick_popup(glob.PopupType.INFO, "No saves found");
		get_parent().get_parent().visible = false;

## Checks if File exists and Resource is of Type Save
func _check(path: String) -> bool:
	path = glob.SAVES_LOCATION + '/' + path;
	return FileAccess.open(path, FileAccess.READ) and (ResourceLoader.load(path, "Save") is Save);

## Adds the Save to the Save Selection
func _add_save(save: Save) -> void:
	none_found = false;
	var s: Variant = glob.save_file.instantiate();
	s.load_save(save);
	add_child(s);

## Scans folder when the menu is shown
func _on_save_selection_shown() -> void:
	scan_folder();
