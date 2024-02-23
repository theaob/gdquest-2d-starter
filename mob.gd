extends CharacterBody2D
class_name Mob

var health = 3

@onready var player = get_node("/root/Game/Player")

const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")

func _ready():
	$Slime.play_walk()

func _physics_process(_delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 300.0
	move_and_slide()

func take_damage():
	health -= 1
	$Slime.play_hurt()
	
	if health == 0:
		queue_free()
		var smoke = SMOKE_SCENE.instantiate()
		smoke.global_position = global_position
		get_parent().add_child(smoke)
		
