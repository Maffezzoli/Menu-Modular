extends Panel
@onready var listagem: HBoxContainer = $listagem
var index = 0
# Called when the node enters the scene tree for the first time.
func seta_lingua(input):
	var temp = index
	print("aa")
	if index + input >= 0 and index + input < listagem.get_child_count():
		index += input
		listagem.get_child(temp).get_node("frame").hide()
		listagem.get_child(index).get_node("frame").show()
