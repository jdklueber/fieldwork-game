extends HBoxContainer

@onready var specialist_list = $SpecialistList
@onready var specialist_name = $DetailPanel/SpecialistName
@onready var stats_label = $DetailPanel/StatsLabel
@onready var inventory_list = $DetailPanel/InventoryList

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.specialist_selected.connect(_on_specialist_selected)
	SignalBus.specialist_stats_changed.connect(_on_stats_changed)
	_populate_list()
	var reyes = CompanyData.specialists[0]
	var rifle = reyes.inventory[0]
	if rifle is Gear:
		CompanyData.equip_item(reyes, rifle)

func _populate_list() -> void:
	for s in CompanyData.specialists:
		var btn = Button.new()
		btn.text = s.display_name
		btn.pressed.connect(func(): SignalBus.specialist_selected.emit(s))
		specialist_list.add_child(btn)
		
func _on_stats_changed(specialist:Specialist) -> void:
	_refresh_detail(specialist)

func _on_specialist_selected(specialist: Specialist) -> void:
	_refresh_detail(specialist)
	
func _refresh_detail(specialist: Specialist) -> void:
	specialist_name.text = specialist.display_name
	stats_label.text = "ARK: %d  DEF: %d  HP: %d/%d" % [
		specialist.get_effective_attack(),
		specialist.get_effective_defense(),
		specialist.current_health,
		specialist.max_health
	]
	
	# Clear and rebuilt inventory list
	for child in inventory_list.get_children():
		child.queue_free()
	for item in specialist.inventory:
		var lbl = Label.new()
		var equipped = item is Gear and specialist.is_item_equipped(item)
		lbl.text = "%s %s" % [
			item.display_name,
			"(equipped)" if equipped else ""
		]
		inventory_list.add_child(lbl)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
