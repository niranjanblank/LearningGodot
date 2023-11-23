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


func _on_player_laser(pos):
	var laser = laser_scene.instantiate()
	# update laser position
	laser.position = pos
	$Projectiles.add_child(laser)
	

func _on_player_grenade(pos):
	var grenade = grenade_scene.instantiate()
	# update laser position
	grenade.position = pos
	$Grenades.add_child(grenade)
