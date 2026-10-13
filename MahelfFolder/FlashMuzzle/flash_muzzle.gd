extends Sprite2D

@onready var anim: AnimationPlayer = $AnimationPlayer


func play_anim():
    anim.play("Fire")