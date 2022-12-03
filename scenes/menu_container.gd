extends Control


@export var startup_menu: Node;
@export var saves_selection: Node;
@export var level_selection: Node;
@export var mod_menu: Node;
@export var settings_menu: Node;
@export var about_menu: Node;
var current_menu: Node;
@onready var to_title_screen: Button = $ToTitleScreen;


func _ready() -> void:
	$Version.text = glob.version.get_as_string();
	$ToTitleScreen.visible = false;
	current_menu = startup_menu;
	startup_menu.show();

func switch_to(menu: Menu) -> void:
	if current_menu != null: current_menu.hide();
	current_menu = menu;
	if current_menu == startup_menu: to_title_screen.visible = false;
	else: to_title_screen.visible = true;
	current_menu.show();

func _on_play_button_up() -> void:
	switch_to(saves_selection);

func _on_mods_button_up():
	switch_to(mod_menu);

func _on_settings_button_up():
	switch_to(settings_menu);

func _on_about_button_up():
	switch_to(about_menu);

func _on_to_title_screen_button_up():
	switch_to(startup_menu);
