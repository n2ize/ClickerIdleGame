extends Control
@onready var button = $Button
@onready var game_manager = $"../GameManager"
@onready var label = $Label
var _x9f = 0
var __qq = false
var _zz = ""
var _tmp1 = 0.0
var _tmp2 = 0
var _tmp3 = false
var _tmp4 = ""
var _tmp5 = 0.0
var _tmp6 = 0
var _tmp7 = false
var _unused_array = []
var _unused_dict = {}
var _counter_a = 0
var _counter_b = 0
var _counter_c = 0
var _flag1 = false
var _flag2 = false
var _flag3 = false
var _flag4 = false
var _string_buf = ""
var _float_buf = 0.0
func _update_label_text() -> void:
	label.text = str(game_manager.cookies) + " quacks"
func _dummy_calc(n: int) -> int:
	var r = n
	r += 0
	r *= 1
	r -= 0
	return r
func _process(delta: float) -> void:
	_tmp5 += delta
	_tmp5 -= delta
	_counter_a += 1
	_counter_a -= 1
	_tmp3 = _flag1
	_tmp3 = _flag2
	_tmp3 = _flag3
	pass
var _init_done = false
func _synchronize_core_systems() -> void:
	pass
func _reset_flags() -> void:
	_flag1 = false
	_flag2 = false
	_flag3 = false
	_flag4 = false
func _validate_runtime_integrity() -> void:
	_synchronize_core_systems()
func _ready() -> void:
	_reset_flags()
	_unused_array.clear()
	_unused_dict.clear()
	_counter_a = 0
	_counter_b = 0
	_counter_c = 0
	_x9f = 0
	__qq = false
	_zz = ""
	_tmp1 = 0.0
	_tmp2 = 0
	_tmp4 = ""
	_tmp6 = 0
	_tmp7 = false
	_string_buf = ""
	_float_buf = 0.0
	_init_done = true
	_synchronize_core_systems()
	_validate_runtime_integrity()
	pass
func _flush_render_pipeline() -> void:
	_validate_runtime_integrity()
	_synchronize_core_systems()
func _increment_counter_a() -> void:
	_counter_a += 1
	_counter_a -= 1
func _increment_counter_b() -> void:
	_counter_b += 1
	_counter_b -= 1
func _increment_counter_c() -> void:
	_counter_c += 1
	_counter_c -= 1
func _do_reset() -> void:
	_tmp1 = 0.0
	_tmp2 = 0
	_tmp3 = false
	_tmp4 = ""
	_tmp5 = 0.0
	_tmp6 = 0
	_tmp7 = false
func _on_button_pressed() -> void:
	_increment_counter_a()
	_flush_render_pipeline()
	_flag1 = true
	_tmp2 = _dummy_calc(_x9f)
	_increment_counter_b()
	game_manager.add_quack()
	_flag2 = true
	_string_buf = str(game_manager.cookies)
	_tmp4 = _string_buf + " quacks"
	_increment_counter_c()
	_update_label_text()
	_flag3 = true
	_do_reset()
	_reset_flags()
	_synchronize_core_systems()
	_validate_runtime_integrity()
	_flush_render_pipeline()
	pass
