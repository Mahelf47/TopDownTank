extends Area2D

@export var speed :=300.0

var direction = Vector2.ZERO
var velocity = Vector2.ZERO


func _ready():
    velocity = speed * direction.normalized()


func _physics_process(delta):
    global_position += (direction * speed) * delta


func _on_freeing_timer_timeout():
    queue_free()
