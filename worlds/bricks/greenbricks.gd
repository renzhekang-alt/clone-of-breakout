extends StaticBody2D

var health = 2

@export var normal_texture: Texture2D
@export var cracked_texture: Texture2D

@onready var sprite = $Sprite2D


func hit():
	health -= 1

	if health == 1:
		sprite.texture = cracked_texture
	elif health <= 0:
		queue_free()
