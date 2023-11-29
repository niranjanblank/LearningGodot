extends StaticBody2D

# custom signal
signal player_entered_gate(body)
signal player_exited_gate(body)

func _on_area_2d_body_entered(_body):
	player_entered_gate.emit(_body)


func _on_area_2d_body_exited(_body):
	player_exited_gate.emit(_body)
