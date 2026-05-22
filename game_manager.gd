extends Node
@onready var upgrade_container = $"../Control/UpgradeContainer"

var cookies = 0
var upgrades = {
	"Cursor": {
		"cost": 10,
		"count": 0,
		"cps": 1,
		"cost_multiplier": 1.15
	},
	"Swamps": {
		"cost": 1000,
		"count": 0,
		"cps": 50,
		"cost_multiplier": 1.15
	}
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
		button.text = upgrade_name + "(costs" + str(upgrades[upgrade_name]["cost"]) + ")"
		button.pressed.connect(func(): buy_upgrade(upgrade_name))
		upgrade_container.add_child(button)
		upgrades[upgrade_name]["button"] = button



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func add_quack():
	cookies += 1
	
func buy_upgrade(name: String):
	var upgrade = upgrades[name]
	if cookies >= upgrade["cost"]:
		cookies -= upgrade["cost"]
		upgrade["count"] += 1
		upgrade["cost"] = int(upgrade["cost"] * upgrade["cost_multiplier"])
		update_buttons()
		

func _on_upgrade_tick(upgrade_name: String):
	var upgrade = upgrades[upgrade_name]
	cookies += upgrade["cps"] * upgrade["count"]
	
func update_buttons():
	for upgrade_name in upgrades:
		var upgrade =  upgrades[upgrade_name]
		upgrade["button"].text = upgrade_name + " (costs " + str(upgrade["cost"]) + ") [" + str(upgrade["count"]) + "]"
