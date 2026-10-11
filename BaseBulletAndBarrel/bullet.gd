extends CharacterBody2D

var dir: Vector2
var pos: Vector2
var rota: float
var speed = 500

func _ready():
	global_position = pos
	rotation = rota

func _physics_process(delta):
	var collision = move_and_collide(dir * speed * delta)
	if collision:
		dir = dir.bounce(collision.get_normal())
		rotation = dir.angle()
