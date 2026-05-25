extends Node


# Roster Signals
signal specialist_selected(specialist: Specialist)
signal specialist_stats_changed(specialist: Specialist)

# Inventory Signals
signal item_equipped(specialist: Specialist, item: Gear)
signal item_unequipped(specialist: Specialist, item: Gear)
