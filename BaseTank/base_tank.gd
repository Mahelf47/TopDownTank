extends CharacterBody2D
class_name TankCharacterBody2D

@export var speed: float = 150.0
@export var rotation_speed_rad: float = .5


var facing_direction: Vector2


func _physics_process(delta: float) -> void:
    facing_direction = Vector2.from_angle(rotation)
    print(rotation)
    var input_force = Input.get_action_strength("forward")- Input.get_action_strength("backward")
    velocity = speed * facing_direction * input_force * delta
    var rotation_input = Input.get_action_strength("rot_right")- Input.get_action_strength("rot_left")
    rotation += rotation_input * rotation_speed_rad * delta
    move_and_slide()
