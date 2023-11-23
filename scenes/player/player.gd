extends CharacterBody2D

var can_laser: bool = true
var can_grenade: bool = true

signal laser
signal grenade

func _process(_delta):
	
	# input movement
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 300
	move_and_slide()
	
	# shooting laser
	if Input.is_action_just_pressed('primary action') and can_laser:
		can_laser = false
		$Timer.start()
		laser.emit()
		
	if Input.is_action_just_pressed('secondary action') and can_grenade:
		can_grenade = false
		$GrenadeReloadTimer.start()
		grenade.emit()


func _on_timer_timeout():
	can_laser = true
	


func _on_grenade_reload_timer_timeout():
	can_grenade = true
