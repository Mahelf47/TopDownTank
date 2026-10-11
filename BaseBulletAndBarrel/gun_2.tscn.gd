extends Area2D

var bullet_path = preload("res://BaseBulletAndBarrel/bullet.tscn")
@export var rotation_speed = 10.0 
@onready var pivot = get_parent()

func _physics_process(delta):
	var mouse_pos = get_global_mouse_position()
	
	var target_angle = pivot.global_position.angle_to_point(mouse_pos) + (PI / 2)
	pivot.rotation = lerp_angle(pivot.rotation, target_angle, rotation_speed * delta)
	
	if Input.is_action_just_pressed("ui_accept"):
		fire()

func fire():
	var bullet = bullet_path.instantiate()
	bullet.dir = Vector2.RIGHT.rotated(pivot.rotation - (PI / 2))
	bullet.pos = $EndOfGun2.global_position
	bullet.rota = pivot.global_rotation
	get_tree().current_scene.add_child(bullet)
