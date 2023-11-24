extends StaticBody2D

# custom signal
signal player_entered_gate(body)
signal player_exited_gate(body)

func _on_area_2d_body_entered(body):
	player_entered_gate.emit(body)


func _on_area_2d_body_exited(body):
	player_exited_gate.emit(body)
