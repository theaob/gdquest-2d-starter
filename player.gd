extends CharacterBody2D
class_name Player

signal health_depleted

const SPEED = 600
const DAMAGE_RATE = 5.0

var health = 100.0

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction *  SPEED
	
	move_and_slide()
	
	if velocity.length() > 0:
		%HappyBoo.play_walk_animation()
	else:
		%HappyBoo.play_idle_animation()
		
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	
	health -= overlapping_mobs.size() * DAMAGE_RATE * delta
	
	%ProgressBar.value = health
	
	if health <= 0.0:
		print("Health is depleted.")
		health_depleted.emit()
