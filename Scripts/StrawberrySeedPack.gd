extends StaticBody2D

var selected = false
var seed_type = 3 # for global script

func _ready():
	$AnimatedSprite2D.play("default")


func _physics_process(delta):
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)


func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			selected = false


func _on_area_2d_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("click"):
		Global.plant_selected = seed_type
		selected = true
