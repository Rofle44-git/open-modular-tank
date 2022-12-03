extends PanelContainer


## Node to debug properties from. Defaults to parent.
@export var target: Node;
## Follow the target node's position?
@export var follow: bool = true;
## Tries to prevent the container being rotated
@export var adapt_rotation: bool = true;
## Offsets the panel
@export var offset: Vector2;
## Anchors the panel to the bottom right corner
@export var bottom_right_anchor: bool = true;
## Names of the properties to monitor.
@export var properties: Array[String] = [];
var _monitored_properties: Array[String];
@onready var grid: GridContainer = $GridContainer;


func _ready():
	target = get_parent() if !target else target;
	
	for property in properties:
		if property in target:
			new_monitor(property);

func _process(_delta: float) -> void:
	if follow: if "global_position" in target:
		global_position = target.position + offset;
		if bottom_right_anchor: global_position -= size;
	if adapt_rotation: if "rotation" in target: rotation = -target.rotation;
	for property in _monitored_properties:
		refresh(property);

func new_monitor(_name: String) -> void:
	print("Adding monitor for ", _name);
	var n: Label = Label.new();
	n.name = _name;
	grid.add_child(n);
	_monitored_properties.append(_name);

func refresh(_name: String) -> void:
	var n: Label = grid.get_node_or_null(_name);
	if n and _name in target: n.text = "%s: %s" % [_name, target.get(_name)];
