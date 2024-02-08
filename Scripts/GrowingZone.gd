extends StaticBody2D

var plant = Global.plant_selected
var plant_growing = false
var plant_grown = false


func _physics_process(_delta):
	if plant_growing == false:
		plant = Global.plant_selected


func _on_area_2d_area_entered(_area):
	if not plant_growing:
		if plant == 1:
			plant_growing = true
			$CarrotTimer.start()
			$Plant.play("carrotgrowing")
		if plant == 2:
			plant_growing = true
			$OnionTimer.start()
			$Plant.play("oniongrowing")
	else:
		print("Plant already growing here.")


func _on_carrot_timer_timeout():
	var carrot_plant = $Plant
	if carrot_plant.frame == 0:
		carrot_plant.frame = 1
		$CarrotTimer.start()
	elif carrot_plant.frame == 1:
		carrot_plant.frame = 2
		plant_grown = true


func _on_onion_timer_timeout():
	var onion_plant = $Plant
	if onion_plant.frame == 0:
		onion_plant.frame = 1
		$OnionTimer.start()
	elif onion_plant.frame == 1:
		onion_plant.frame = 2
		plant_grown = true


func _on_area_2d_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("click"):
		if plant_grown:
			if plant == 1:
				Global.number_of_carrots += 1
				$Plant.frame = 3
				plant_growing = false
				plant_grown = false
				$Plant.play("none")
			if plant == 2:
				Global.number_of_onions += 1
				$Plant.frame = 3
				plant_growing = false
				plant_grown = false
				$Plant.play("none")
