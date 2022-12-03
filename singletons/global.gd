extends Node


enum PopupType {
	INFO,
	WARNING,
	ERROR,
};

const CONFIG_LOCATION: String = "user://config.cfg";
const SAVES_LOCATION: String = "user://saves";
const MODS_LOCATION: String = "user://mods";

var version := Version.new(0, 0, 0, Version.VersionType.ALPHA);

@onready var save_file := preload("res://widgets/save_file.tscn");
@onready var lobby_scene := preload("res://scenes/lobby.tscn");
@onready var title_scene := preload("res://scenes/menu_container.tscn");
@onready var shop_menu := preload("res://scenes/shop_menu.tscn");


func quick_popup(type: PopupType, message: String) -> void:
	var p: ConfirmationDialog = ConfirmationDialog.new();
	match type:
		PopupType.INFO: p.title = "Info";
		PopupType.WARNING: p.title = "Warning";
		PopupType.ERROR: p.title = "Error";
	
	p.dialog_text = message;
	p.exclusive = true;
	add_child(p);
	p.popup_centered();
	await p.confirmed; p.queue_free();
