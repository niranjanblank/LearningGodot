extends Node2D


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


func _on_player_laser():
	print("laser from level")
	

func _on_player_grenade():
	print("grenade from level")
