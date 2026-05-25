extends Node

@export var specialists: Array[Specialist] = []
@export var funds: int = 5000
@export var reputation: int = 50

func _ready() -> void:
	specialists = [
		load("res://data/specialist_reyes.tres")
		,load("res://data/specialist_kim.tres")
		,
	]

func get_specialist_by_name(name: String) -> Specialist:
	for s in specialists:
		if s.display_name == name:
			return s
	return null
	
func equip_item(specialist: Specialist, item: Gear) -> void:
	match item.slot:
		Gear.Slot.WEAPON:
			if specialist.equipped_weapon:
				SignalBus.item_unequipped.emit(specialist, specialist.equipped_weapon)
			specialist.equipped_weapon = item
		Gear.Slot.ARMOR:
			if specialist.equipped_armor:
				SignalBus.item_unequipped.emit(specialist, specialist.equipped_armor)
			specialist.equipped_armor = item

	SignalBus.item_equipped.emit(specialist, item)
	SignalBus.specialist_stats_changed.emit(specialist)
