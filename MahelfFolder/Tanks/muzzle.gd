extends Node2D

@export var rotation_speed = 5.0 


func _physics_process(delta):
    var mouse_pos = get_global_mouse_position()
    var target_angle = get_angle_to(mouse_pos)
    rotation = rotate_toward(rotation, rotation + target_angle, rotation_speed * delta)
