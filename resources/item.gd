class_name Item
extends Resource

@export var display_name: String = ""
@export var description: String = ""
@export var icon: Texture2D

@export_group("Stat Modifiers")
@export var attack_bonus: int = 0
@export var defense_bonus: int = 0
@export var health_bonus: int = 0
