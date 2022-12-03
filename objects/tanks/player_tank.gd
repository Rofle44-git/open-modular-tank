extends Tank


const ZOOM_FACTOR: float = 0.65;
@export var track_upgrader: Upgrader;
@export var core_upgrader: Upgrader;
@onready var cam: PlayerCamera = $Camera2D;
var direction: Vector2 = Vector2.ZERO;


func _ready() -> void:
	# Loading values from save
	var equipment: Array = game.active_save.inventory.get_equipped();
	

func _unhandled_input(_event: InputEvent) -> void:
	# Zoom
	if Input.is_action_just_pressed("zoom_in"): cam.zoom_in();
	elif Input.is_action_just_pressed("zoom_out"): cam.zoom_out();

func _physics_process(delta: float) -> void:
	# Input
	direction = direction.lerp(Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	), 0.1);
	
	# Rotation
	var rotation_amount: float = rotation_speed * direction.x * delta;
	tracks.rotate_with_tracks(rotation_amount);
	rotation += rotation_amount;
	
	# Movement
	velocity = Vector2.DOWN.rotated(rotation) * speed * direction.y;
	tracks.move_with_tracks(velocity.y * delta, rotation);
	move_and_slide();
