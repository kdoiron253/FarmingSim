extends CanvasLayer

func _process(_delta):
	$ColorRect/CarrotLabel.text = "= " + str(Global.number_of_carrots)
	$ColorRect/OnionLabel.text = "= " + str(Global.number_of_onions)
