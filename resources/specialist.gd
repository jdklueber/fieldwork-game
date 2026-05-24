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
