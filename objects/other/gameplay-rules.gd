extends Resource
class_name GameplayRules
## Resource for defining and saving custom Gameplay Rules


## Maximum Tank Speed
@export_range(0, 9999, 1) var tank_movement_speed: int = 300;
## Acceleration for Movement Speed
@export_range(0, 1, 0.02, "exp") var tank_movement_acceleration: float = 0.01;
## Decceleration for Movement Speed (can be used to make the floor slippery)
@export_range(0, 1, 0.02, "exp") var tank_movement_decceleration: float = 0.01;
## Maximum Tank Rotation Speed
@export_range(0, 360, 1, "degrees") var tank_turning_speed: int = 40;
## Acceleration for Rotation Speed
@export_range(0, 1, 0.02, "exp") var tank_turning_acceleration: float = 0.01;
## Decceleration for Rotation Speed
@export_range(0, 1, 0.02, "exp") var tank_turning_decceleration: float = 0.01;
