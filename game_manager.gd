extends Node
@onready var upgrade_container = $"../Control/UpgradeContainer"
signal upgrade_ticked

var cookies = 0
var upgrades = {
	"Cursor": {
		"cost": 10,
		"count": 0,
		"cps": 1,
		"cost_multiplier": 1.15
	},
	"Swamps": {
		"cost": 500,
		"count": 0,
		"cps": 30,
		"cost_multiplier": 1.15
	},
	"placeholder1": {
		"cost": 5000,
		"count": 0,
		"cps": 1000,
		"cost_multiplier": 1.15
	},
	"placeholder2": {
		"cost": 25000,
		"count": 0,
		"cps": 1000,
		"cost_multiplier": 1.15
	},
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for upgrade_name in upgrades:
		var timer = Timer.new()
		timer.wait_time = 1.0
		timer.timeout.connect(func(): _on_upgrade_tick(upgrade_name))
		add_child(timer)
		timer.start()
		upgrades[upgrade_name]["timer"] = timer
		var button = Button.new()
		button.text = upgrade_name + " (costs " + format_number(upgrades[upgrade_name]["cost"]) + ")"
		button.pressed.connect(func(): buy_upgrade(upgrade_name))
		upgrade_container.add_child(button)
		upgrades[upgrade_name]["button"] = button



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func add_quack():
	cookies += 1000
	emit_signal("upgrade_ticked")
	
func buy_upgrade(name: String):
	var upgrade = upgrades[name]
	if cookies >= upgrade["cost"]:
		cookies -= upgrade["cost"]
		upgrade["count"] += 1
		upgrade["cost"] = int(upgrade["cost"] * upgrade["cost_multiplier"])
		update_buttons()
		

func _on_upgrade_tick(upgrade_name: String):
	var upgrade = upgrades[upgrade_name]
	if upgrade["count"] > 0:
		cookies += upgrade["cps"] * upgrade["count"]
		emit_signal("upgrade_ticked")
	
	
func update_buttons():
	for upgrade_name in upgrades:
		var upgrade =  upgrades[upgrade_name]
		upgrade["button"].text = upgrade_name + " (costs " + format_number(upgrade["cost"]) + ") [" + str(upgrade["count"]) + "]"

func get_suffixes() -> Array:
	var suffixes = ["","k", "M", "B","T"]
	for first in "abcdefghijklmnopqrstuvwxyz":
		for second in "abcdefghijklmnopqrstuvwxyz":
			suffixes.append(first + second)
	return suffixes

func format_number(n: int) -> String:
	var suffixes = get_suffixes()
	var i = 0
	var value = float(n)
	while value >= 1000 and i < suffixes.size() - 1:
		value /= 1000.0
		i += 1
	if i == 0:
		return str(n)
	return str(snapped(value, 0.01)).pad_decimals(2) + suffixes[i]

func get_total_cps() -> int:
	var total = 0
	for upgrade_name in upgrades:
		total += upgrades[upgrade_name]["cps"] * upgrades[upgrade_name]["count"]
	return total
