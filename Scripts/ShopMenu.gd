extends StaticBody2D

# item 1 = strawberry, item 2 = lettuce, item 3 = corn
var item = 1

var item1price = 100
var item2price = 250
var item3price = 500

var item1owned = false
var item2owned = false
var item3owned = false

var price

func _ready():
	$Icon.play("strawberry")
	item = 1


func swap_item_back():
	if item == 1:
		item = 3
	elif item == 2:
		item = 1
	elif item == 3:
		item = 2


func swap_item_forward():
	if item == 1:
		item = 2
	elif item == 2:
		item = 3
	elif item == 3:
		item = 1


func _physics_process(_delta):
	if self.visible == true:
		if item == 1:
			$Icon.play("strawberry")
		if item == 2:
			$Icon.play("lettuce")
		if item == 3:
			$Icon.play("corn")


func buy():
	Global.coins -= price
	if item == 1:
		item1owned = true
	if item == 2:
		item2owned = true
	if item == 3:
		item3owned = true


func _on_button_left_pressed():
	swap_item_back()


func _on_button_right_pressed():
	swap_item_forward()


func _on_buy_button_pressed():
	if item == 1:
		price = item1price
		if Global.coins >= item1price:
			if item1owned == false:
				buy()
	if item == 2:
		price = item2price
		if Global.coins >= item2price:
			if item2owned == false:
				buy()
	if item == 3:
		price = item3price
		if Global.coins >= item3price:
			if item3owned == false:
				buy()
