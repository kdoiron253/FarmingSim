extends CharacterBody2D

var speed = 50
var motion = Vector2.ZERO

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		$AnimatedSprite2D.play("walk_side")
		$AnimatedSprite2D.flip_h = true
		motion.x = speed * delta
		motion.y = 0
	elif Input.is_action_pressed("ui_left"):
		$AnimatedSprite2D.play("walk_side")
		$AnimatedSprite2D.flip_h = false
		motion.x = -speed * delta
		motion.y = 0
	elif Input.is_action_pressed("ui_down"):
		$AnimatedSprite2D.play("walk_down")
		motion.y = speed * delta
		motion.x = 0
	elif Input.is_action_pressed("ui_up"):
		$AnimatedSprite2D.play("walk_up")
		motion.y = -speed * delta
		motion.x = 0
	else:
		$AnimatedSprite2D.play("idle")
		motion = Vector2.ZERO
	
	move_and_collide(motion)


func player_sell_method():
	pass
