extends CharacterBody2D

var bullet_path = preload("res://BaseBulletAndBarrel/bullet.tscn")
@export var rotation_speed = 5.0 

func _physics_process(delta):
	var mouse_pos = get_global_mouse_position()
	var target_angle = global_position.angle_to_point(mouse_pos) + (PI / 2)
	
	rotation = rotate_toward(rotation, target_angle, rotation_speed * delta)
	
	if Input.is_action_just_pressed("ui_accept"):
		fire()
		

func fire():
	var bullet = bullet_path.instantiate()
	bullet.dir = Vector2.RIGHT.rotated(rotation - (PI / 2))
	bullet.pos = $EndOfGun.global_position
	bullet.rota = global_rotation
	get_tree().current_scene.add_child(bullet)
