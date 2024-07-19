extends Node2D
var value1 = 0
var value2 = 0
var color_position = true
var arrow_count = 0
var is_sound_on = true

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2Dwater.position = Vector2(887, 116)
	$AnimatedSprite2Dflame.position = Vector2(275, 116)
	$AnimatedSprite2Dwater.play("water")
	$AnimatedSprite2Dflame.play("flame")
	$AnimatedSprite2Darrow.play("default")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_texture_button_1_plus_pressed():
	value1 += 1
	$HBoxContainer2/Label1.text = str(value1)
	if is_sound_on: 
		$AudioStreamPlayer2DPlus.play()
	if color_position:
		$AnimatedSprite2Dflame.visible = true
		$AnimatedSprite2Dflame.play("flame")
	else:
		$AnimatedSprite2Dwater.visible = true
		$AnimatedSprite2Dwater.play("water")

func _on_texture_button_1_minus_pressed():
	value1 -= 1
	$HBoxContainer2/Label1.text = str(value1)
	if is_sound_on: 
		$AudioStreamPlayer2DMinus.play()

func _on_texture_button_2_plus_pressed():
	value2 += 1
	$HBoxContainer2/Label2.text = str(value2)
	if is_sound_on: 
		$AudioStreamPlayer2DPlus.play()
	if color_position:
		$AnimatedSprite2Dwater.visible = true
		$AnimatedSprite2Dwater.play("water")
	else:
		$AnimatedSprite2Dflame.visible = true
		$AnimatedSprite2Dflame.play("flame")

func _on_texture_button_2_minus_pressed():
	value2 -= 1
	$HBoxContainer2/Label2.text = str(value2)
	if is_sound_on: 
		$AudioStreamPlayer2DMinus.play()

func _on_button_inverter_pressed():
	$AnimatedSprite2Darrow.play("default")
	var style1 = StyleBoxFlat.new()
	var style2 = StyleBoxFlat.new()
	$AnimatedSprite2Dwater.visible = true
	$AnimatedSprite2Dflame.visible = true
	$AnimatedSprite2Dwater.play("water")
	$AnimatedSprite2Dflame.play("flame")
	if color_position:
		style1.bg_color = Color(1, 0, 0) 
		$HBoxContainer2/Label2.add_theme_stylebox_override("normal", style1)
		style2.bg_color = Color(0, 0, 1) 
		$HBoxContainer2/Label1.add_theme_stylebox_override("normal", style2)
		$AnimatedSprite2Dwater.position = Vector2(277, 116)
		$AnimatedSprite2Dflame.position = Vector2(887, 116)
		#$AnimatedSprite2Dwater.stop()
	else:
		style1.bg_color = Color(0, 0, 1) 
		$HBoxContainer2/Label2.add_theme_stylebox_override("normal", style1)
		style2.bg_color = Color(1, 0, 0) 
		$HBoxContainer2/Label1.add_theme_stylebox_override("normal", style2)
		$AnimatedSprite2Dwater.position = Vector2(887, 116)
		$AnimatedSprite2Dflame.position = Vector2(275, 116)
	color_position = !color_position

func _on_animated_sprite_2_dwater_animation_looped():
	$AnimatedSprite2Dwater.stop()
	$AnimatedSprite2Dwater.visible = false
	pass # Replace with function body.

func _on_animated_sprite_2_dflame_animation_looped():
	$AnimatedSprite2Dflame.stop()
	$AnimatedSprite2Dflame.visible = false
	pass # Replace with function body.


func _on_animated_sprite_2_darrow_animation_looped():
	if arrow_count < 1:
		arrow_count += 1
	else:
		$AnimatedSprite2Darrow.stop()
		arrow_count = 0
	pass # Replace with function body.


func _on_texture_button_sound_pressed():
	if is_sound_on:
		$TextureButtonSound/Sprite2Dcancel.visible = true
		is_sound_on = !is_sound_on
		print(is_sound_on)
	else:
		$TextureButtonSound/Sprite2Dcancel.visible = false
		is_sound_on = !is_sound_on
		print(is_sound_on)
	pass # Replace with function body.
