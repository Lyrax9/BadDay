extends Node2D





@onready var animated_sprite_2d = $AnimatedSprite2D


var is_broken = false

func burst():
	if is_broken:
		return

	is_broken = true
	
	animated_sprite_2d.play("deflate")
