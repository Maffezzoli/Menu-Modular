extends Panel

@export var volume : float = 100
@export var path_bar : Node
@export var tipo_volume : String
var vol_max = 8
var vol = 8
# Called when the node enters the scene tree for the first time.
func define_volume(input):
	if vol + input <= vol_max and vol + input >= 0:
		vol += input
		var i = 0
		for child in path_bar.get_children():
			i += 1
			if i <= vol:
				child.show()
			else:
				child.hide()
	seta_volume()
func seta_volume():
	volume = (vol * 100)/vol_max
	print(tipo_volume)
	print(volume)
