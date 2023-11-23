extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_gate_player_entered_gate():
	print("player has entered")

func _on_gate_player_exited_gate():
	print("player exited")


func _on_player_laser(pos, direction):
	var laser = laser_scene.instantiate()
	# update laser position
	laser.position = pos
	laser.rotation_degrees = rad_to_deg	(direction.angle()) + 90
	laser.direction = direction
	$Projectiles.add_child(laser)
	

func _on_player_grenade(pos, direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	# update laser position
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$Grenades.add_child(grenade)
