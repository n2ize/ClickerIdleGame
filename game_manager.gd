extends Node

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
	pass # Replace with function body.



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
		
