extends Node2D


@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var explosion: AudioStreamPlayer2D = $explosion

var is_broken = false

func burst():
	if is_broken:
		return

	is_broken = true
	explosion.play()
	animated_sprite_2d.play("explode")
