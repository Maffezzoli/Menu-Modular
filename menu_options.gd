extends Control
enum State {menu_inicial, menu_options}
@export var state = State.menu_inicial
@onready var control: Control = $".."

var index = 0
var temp = index
func _process(delta: float) -> void:
	if control.state == control.State.menu_options:
		show()
		get_node("menuNavega").get_child(temp).modulate = "white"
		get_node("menuNavega").get_child(index).modulate = "red"
		if Input.is_action_just_pressed("ui_accept"):
			get_node("menuNavega").get_child(index)
		if Input.is_action_just_pressed("ui_right"):
			muda_volume(+1)
		elif Input.is_action_just_pressed("ui_left"):
			muda_volume(-1)
		elif Input.is_action_just_pressed("x"):
			exit_state()
	else:
		hide()
func muda_volume(input):
	if get_node("menuNavega").get_child(index).is_in_group("volume"):
		get_node("menuNavega").get_child(index).define_volume(input)
func exit_state():
	control.state = control.State.menu_inicial
	control.current_node = control.menu_inicial
	index = 0
	get_node("menuNavega").get_child(temp).modulate = "white"
	get_node("menuNavega").get_child(index).modulate = "red"
