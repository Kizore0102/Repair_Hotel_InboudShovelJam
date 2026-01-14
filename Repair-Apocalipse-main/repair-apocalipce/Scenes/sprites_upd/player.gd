extends CharacterBody2D

var spd = 178
var _direction: Vector2
@export var _sprite: Sprite2D
@export var _animation: AnimationPlayer

func _physics_process(_delta):
	player_movement(_delta)
	animations()


func player_movement(_delta):
	movement()
	animations()
	



func movement():
	_direction = Input.get_vector("left", "right", "up", "down")
	velocity = _direction * spd
	move_and_slide()
	print(_direction)
	 
	


func animations():
	if velocity.x > 0:
		_sprite.flip_h = false
	elif velocity.x < 0:
		_sprite.flip_h = true
	
	if velocity:
		_animation.play("walk")
		return
	
	_animation.play("idle")
