class_name Specialist
extends Resource

# Identity
@export var display_name: String = ""
@export var portrait: Texture2D

# Core Stats  - typed and exported so they're Inspector editable
@export_group("Combat Stats")
@export var max_health: int = 100
@export var current_health: int = 100
@export var attack: int = 10
@export var defense: int = 5
@export var move_range: int = 4

@export_group("Experience")
@export var level: int = 1
@export var experience: int = 0

@export_group("Inventory")
@export var inventory: Array[Item] = []
@export var equipped_weapon: Gear
@export var equipped_armor: Gear

func is_item_equipped(item: Gear) -> bool:
	return item == equipped_weapon or item == equipped_armor

func get_effective_attack() -> int:
	var bonus = equipped_weapon.attack_bonus if equipped_weapon else 0
	return attack + bonus

func get_effective_defense() -> int:
	var bonus = equipped_armor.defense_bonus if equipped_armor else 0
	return defense + bonus
