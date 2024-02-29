extends StaticBody2D


func _ready():
	$ShopMenu.visible = false


func _process(_delta):
	if $ShopMenu.item1owned == true:
		$StrawberrySeedPack.visible = true
	if $ShopMenu.item2owned == true:
		$LettuceSeedPack.visible = true
	if $ShopMenu.item3owned == true:
		$CornSeedPack.visible = true


func _on_area_2d_body_entered(body):
	if body.has_method("player_shop_method"):
		$ShopMenu.visible = true


func _on_area_2d_body_exited(body):
	$ShopMenu.visible = false
