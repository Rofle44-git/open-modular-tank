class_name Version
extends Resource


enum VersionType {
	ALPHA,
	BETA,
	RELEASE,
};
var major: int = 1;
var minor: int = 0;
var patch: int = 0;
var version_type: int;


func _init(_major: int, _minor: int, _patch: int, _version_type: VersionType) -> void:
	major = _major;
	minor = _minor;
	patch = _patch;
	version_type = _version_type;

func get_as_string() -> String:
	return "%s.%s.%s (%s)" % [major, minor, patch, VersionType.keys()[version_type]];
