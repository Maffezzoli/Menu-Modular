extends Panel

@onready var jogar: Node2D = $menuNavega/Jogar
@onready var options: Node2D = $menuNavega/Options

@onready var control: Control = $".."

var index = 0
var temp = index

func _process(delta: float) -> void:
	if control.state == control.State.menu_inicial:
		show()
		get_node("menuNavega").get_child(temp).get_node("Button").emit_signal("mouse_exited")
		get_node("menuNavega").get_child(index).get_node("Button").emit_signal("mouse_entered")
		if Input.is_action_just_pressed("z"):
			get_node("menuNavega").get_child(index).get_node("Button").emit_signal("button_down")
	else:
		hide()

func _on_button_mouse_entered(string: String) -> void:
	match string:
		"Jogar":
			jogar.get_node("frame").show()
		"Options":
			options.get_node("frame").show()
func _on_button_mouse_exited(string: String) -> void:
	match string:
		"Jogar":
			jogar.get_node("frame").hide()
		"Options":
			options.get_node("frame").hide()
func _on_button_button_down(string: String) -> void:
	match string:
		"Options":
			options_func()
		"Jogar":
			pass
func options_func():
	control.state = control.State.menu_options
	control.current_node = control.menu_options
