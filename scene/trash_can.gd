extends Node2D


@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D


var is_broken = false

func burst():
	if is_broken:
		return

	is_broken = true
	audio_stream_player_2d.play()
	animated_sprite_2d.play("water")
