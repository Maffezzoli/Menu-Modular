extends Control
enum State {menu_inicial, menu_options}
@export var state = State.menu_inicial
@onready var menu_options: Panel = $MenuOptions
@onready var menu_inicial: Panel = $MenuInicial




var current_node

func _ready() -> void:
	current_node = menu_inicial
func _process(delta: float) -> void:
	var navegar = navega()
	current_node.temp = current_node.index
	current_node.index += navega()

func navega():
	if Input.is_action_just_pressed("ui_up"):
		if current_node.index > 0:
			return -1
		else: 
			return 0
	elif Input.is_action_just_pressed("ui_down"):
		if current_node.index < current_node.get_node("menuNavega").get_child_count() - 1:
			return 1
		else:
			return 0
	else:
		return 0
