extends Button


@onready var time_played: Label = $MarginContainer/VBoxContainer/TimePlayedValue;
@onready var total_waves: Label = $MarginContainer/VBoxContainer/TotalWavesValue;
var _save: Save;

func _ready() -> void:
	button_up.connect(_on_button_up);

func load_save(save: Save) -> void:
	_save = save;
	await ready;
	var hour: int = int(floorf(save.time_played/3600.0));
	var minute: int = int(floorf(save.time_played%3600/60.0));
	time_played.text = "%s:%s" % [hour, minute];
	total_waves.text = str(save.total_waves);

func _on_button_up():
	game.active_save = _save;
	get_tree().change_scene_to_packed(glob.lobby_scene);
