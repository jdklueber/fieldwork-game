extends Node
@export var specialists: Array[Specialist] = []
signal specialist_selected(specialist: Specialist)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for s in specialists:
		print("--- %s ---" % s.display_name)
		print("  HP: %d / %d" % [s.current_health, s.max_health])
		print("  ATK: %d  DEF: %d  MOV: %d  " % [s.attack,s.defense, s.move_range])
		print("  Level: %d  (%d XP)" % [s.level,s.experience])
		
		specialist_selected.connect(_on_specialist_selected)


func _on_button_pressed() -> void:
	specialist_selected.emit(specialists[0])

func _on_specialist_selected(specialist: Specialist):
	print("Signal received: %s" % specialist.display_name)
