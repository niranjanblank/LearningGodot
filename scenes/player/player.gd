extends CharacterBody2D

var can_laser: bool = true
var can_grenade: bool = true

signal laser(pos, direction)
signal grenade(pos, direction)

@export var max_speed: int = 500
var speed: int = max_speed

func _process(_delta):
	
	# input movement
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	
	# rotate
	look_at(get_global_mouse_position())
	
	# shooting laser
	if Input.is_action_just_pressed('primary action') and can_laser and Globals.laser_amount > 0:
		Globals.laser_amount -= 1
		can_laser = false
		$GPUParticles2D.emitting = true
		# randomly select marker
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		var player_direction = (get_global_mouse_position() - position).normalized()
		$Timer.start()
		# emit the position we selected 
		laser.emit(selected_laser.global_position, player_direction)
		
	if Input.is_action_just_pressed('secondary action') and can_grenade and Globals.grenade_amount > 0:
		Globals.grenade_amount -= 1
		can_grenade = false
		var grenade_markers = $GrenadeStartPosition.get_children()
		var selected_grenade = grenade_markers[0]
		var pos = selected_grenade.global_position
		var player_direction = (get_global_mouse_position() - position).normalized()
		$GrenadeReloadTimer.start()
		grenade.emit(pos,player_direction)


func _on_timer_timeout():
	can_laser = true
	


func _on_grenade_reload_timer_timeout():
	can_grenade = true
