extends CharacterBody2D

func _physics_process(_delta):
	var mouse_x = get_global_mouse_position().x
	
	velocity.x = (mouse_x - global_position.x) * 10
	velocity.y = 0
	
	move_and_slide()
