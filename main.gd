extends Node2D
var value1 = 0
var value2 = 0
var color_position = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_texture_button_1_plus_pressed():
	value1 += 1
	$HBoxContainer2/Label1.text = str(value1)


func _on_texture_button_1_minus_pressed():
	value1 -= 1
	$HBoxContainer2/Label1.text = str(value1)


func _on_texture_button_2_plus_pressed():
	value2 += 1
	$HBoxContainer2/Label2.text = str(value2)


func _on_texture_button_2_minus_pressed():
	value2 -= 1
	$HBoxContainer2/Label2.text = str(value2)


func _on_button_inverter_pressed():
	var style1 = StyleBoxFlat.new()
	var style2 = StyleBoxFlat.new()
	if color_position:
		style1.bg_color = Color(1, 0, 0) 
		$HBoxContainer2/Label2.add_theme_stylebox_override("normal", style1)
		style2.bg_color = Color(0, 0, 1) 
		$HBoxContainer2/Label1.add_theme_stylebox_override("normal", style2)
	else:
		style1.bg_color = Color(0, 0, 1) 
		$HBoxContainer2/Label2.add_theme_stylebox_override("normal", style1)
		style2.bg_color = Color(1, 0, 0) 
		$HBoxContainer2/Label1.add_theme_stylebox_override("normal", style2)
	color_position = !color_position
	
