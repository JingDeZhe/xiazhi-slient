extends Resource

class_name RoleStates

@export var health: int = 100:
	set(value):
		health = clamp(value, 0, 100)

@export var stamina: int = 100:
	set(value):
		stamina = clamp(value, 0, 100)

@export var energy: int = 100:
	set(value):
		energy = clamp(value, 0, 100)

@export var mood: int = 100:
	set(value):
		mood = clamp(value, 0, 100)

@export var hunger: int = 100:
	set(value):
		hunger = clamp(value, 0, 100)

func _init():
	health = 100
	stamina = 100
	energy = 100
	mood = 100
	hunger = 100

func restore_all():
	health = 100
	stamina = 100
	energy = 100
	mood = 100
	hunger = 100
