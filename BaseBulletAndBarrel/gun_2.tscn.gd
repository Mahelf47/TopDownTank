extends Area2D

var bullet_path = preload("res://BaseBulletAndBarrel/bullet.tscn")
@export var rotation_speed = 10.0 
@onready var pivot = get_parent()

func _physics_process(delta):
	var mouse_pos = get_global_mouse_position()
	
	var target_angle = pivot.global_position.angle_to_point(mouse_pos)
	pivot.global_rotation = lerp_angle(pivot.global_rotation, target_angle, rotation_speed * delta)
	
	if Input.is_action_just_pressed("ui_accept"):
		fire()

func fire():
	var bullet = bullet_path.instantiate()
	var muzzle_pos = $EndOfGun2.global_position
	var dir_vector = (muzzle_pos - pivot.global_position).normalized()
	
	bullet.dir = dir_vector
	bullet.pos = muzzle_pos
	bullet.rota = dir_vector.angle()
	
	get_tree().current_scene.add_child(bullet)
