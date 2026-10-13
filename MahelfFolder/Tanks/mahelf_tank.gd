extends TankCharacterBody2D


@export var bullet_spawn: Marker2D
@export var bullets: PackedScene
@export var muzzle: Node2D
@export var shooting_speed_timer: Timer
@export var muzzle_flash: Sprite2D

var can_shoot:= true

func fire():
    if can_shoot:            
        var direction_to = global_position.direction_to(bullet_spawn.global_position)
        var new_bullet = bullets.instantiate()
        new_bullet.direction = direction_to
        new_bullet.rotation = direction_to.angle()
        get_tree().root.add_child(new_bullet)
        new_bullet.global_position = bullet_spawn.global_position
        can_shoot = false
        muzzle_flash.play_anim()
        shooting_speed_timer.start()


func _unhandled_input(event: InputEvent) -> void:
    if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
        fire()


func _on_shooting_speed_timeout():
    can_shoot = true
