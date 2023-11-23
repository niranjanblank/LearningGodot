extends StaticBody2D

# custom signal
signal player_entered_gate
signal player_exited_gate

func _on_area_2d_body_entered():
	player_entered_gate.emit()


func _on_area_2d_body_exited():
	player_exited_gate.emit()
