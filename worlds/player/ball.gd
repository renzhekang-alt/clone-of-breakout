extends CharacterBody2D

var speed = 500
var direction = Vector2(0.5, -1).normalized()

var started = false
var game_over = false


func _physics_process(delta):


	if not started:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):


			if game_over:
				get_tree().reload_current_scene()
				return


			started = true
			get_tree().current_scene.get_node("UI/startscreen").hide()

		else:
			return


	
	var movement = speed * direction * delta
	var collision = move_and_collide(movement)



	if collision != null:
		direction = direction.bounce(collision.get_normal())

		var collider = collision.get_collider()

		if collider.has_method("hit"):
			collider.hit()



	if global_position.y > 700:
		show_game_over()


func show_game_over():
	started = false
	game_over = true

	var screen = get_tree().current_scene.get_node("UI/startscreen")
	var text = screen.get_node("starttext")

	text.text = "GAME OVER\nCLICK TO RESTART"
	screen.show()
