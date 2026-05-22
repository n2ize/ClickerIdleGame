extends Control

@onready var label = $Label
@onready var button = $Button
@onready var game_manager = $"../GameManager"
@onready var cpslabel = $CpsLabel

var frog_origin: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	frog_origin = button.position
	game_manager.upgrade_ticked.connect(_on_upgrade_ticked)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	label.text = game_manager.format_number(game_manager.cookies) + " quacks"
	cpslabel.text = game_manager.format_number(game_manager.get_total_cps()) + "quacks/s"
	pass


func _on_button_pressed() -> void:
	game_manager.add_quack()
	
func _on_upgrade_ticked():
	var tween = create_tween()
	var original_pos = frog_origin
	tween.tween_property(button, "position", original_pos + Vector2(0, -20), 0.1)
	tween.tween_property(button, "position", original_pos, 0.1)
