class_name Weapon
extends Node2D
## Base class for all weapons


## Emitted when a bullet is successfully fired
signal shot;
enum AmmoType {
	FINITE,  ## No more ammunition can be re-stocked in battle
	INFINITE,  ## Player can reload to re-stock ammo
	NOT_REQUIRED,  ##  No ammo required
	};
enum FireArmType {
	SINGLE,  ## One one bullet can be after each reload
	SEMI,  ## Semi-auto
	FULL,  ## Full-auto
	CONSTANT,  ## The ShotType will not despawn and move with the tank
	};
enum ShotType {
	BULLET,  ## Bullet object
	RAY,  ## Stationary ray
	BURST,  ### Multiple bullet objects
	};
enum ReloadType {
	PUSH,  ## Push reload button once to reload
	CHARGE,  ## Hold reload button to reload (can be interrupted)
	PASSIVE,  ## Weapon passively reloads between shots
	};
enum States {
	OUT_OF_AMMO,
	RELOADING,
	LOADED,
	CHARGING,
	SHOOTING,
	COOLDOWN,
	};

@export var ammo_type: AmmoType;
@export var fire_arm_type: FireArmType;
@export var shot_type: ShotType;
@export var reload_type: ReloadType;

var state_machine: StateMachine = StateMachine.new(States.keys());
var state: States = States.LOADED;


func _ready() -> void:
	_get_upgradables();

## Override this to set upgradable values
func _get_upgradables() -> void:
	pass;

## When trigger is held
func _on_trigger_down(force: float) -> void: pass;

## When trigger is released
func _on_trigger_up() -> void: pass;

## When reload button is pushed
func _on_reload_down() -> void: pass;

## When reload button is released
func _on_reload_up() -> void: pass;

## Sets gun rotation
func _on_rotation_update(_rotation: float) -> void:
	rotation = _rotation;
