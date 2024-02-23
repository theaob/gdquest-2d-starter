extends Node2D

const MOB = preload("res://mob.tscn")

func _ready():
	spawn_mob()
	spawn_mob()
	spawn_mob()

func _on_timer_timeout():
	spawn_mob()
	
func spawn_mob():
	var spawn_position = randf()
	$Player/Path2D/PathFollow2D.progress_ratio = spawn_position
	var mob = MOB.instantiate()
	mob.global_position = $Player/Path2D/PathFollow2D.position
	add_child(mob)


func _on_player_health_depleted():
	$GameOver.visible = true
	get_tree().paused = true
