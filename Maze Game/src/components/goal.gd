extends Area3D
class_name Goal

signal level_complete

func _on_body_entered(body):
	level_complete.emit()
