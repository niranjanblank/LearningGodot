extends Node2D
class_name LevelParent

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass




func _on_gate_player_exited_gate(_body):
	print("player exited")


func _on_player_laser(pos, direction):
	var laser = laser_scene.instantiate()
	# update laser position
	laser.position = pos
	laser.rotation_degrees = rad_to_deg	(direction.angle()) + 90
	laser.direction = direction
	$Projectiles.add_child(laser)
	$UI.update_laser_text()
	

func _on_player_grenade(pos, direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	# update laser position
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$Grenades.add_child(grenade)
	$UI.update_grenade_text()


func _on_house_player_entered():
	# get the entire scene tree
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D2, "zoom", Vector2(1,1), 1 )
	



func _on_house_player_exited():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D2,"zoom", Vector2(0.6,0.6), 1)
	pass # Replace with function body.
