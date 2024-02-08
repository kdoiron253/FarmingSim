extends StaticBody2D



func _on_area_2d_body_entered(body):
	if body.has_method("player_sell_method"):
		var carrots = Global.number_of_carrots
		var onions = Global.number_of_onions
		var coins = Global.coins
		
		# carrots = 5 coins, onions = 8 coins
		
		coins += carrots * 5
		coins += onions * 8
		
		carrots = 0
		onions = 0
		
		Global.coins = coins
		Global.number_of_carrots = carrots
		Global.number_of_onions = onions
