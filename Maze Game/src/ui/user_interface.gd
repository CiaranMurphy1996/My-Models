extends Control

signal next_level()

@onready var time_elapsed_label = $TimeElapsedLabel
@onready var success_panel : Panel = $SuccessPanel
@onready var level_play_time_label : Label = $SuccessPanel/LevelPlayTimeLabel

func update_time_elapsed_label(value : float):
	time_elapsed_label.text = "Time: %s" % int(value)

func display_success_screen(level_play_time : float):
	var minutes : String = str(int(level_play_time / 60.0))
	var seconds : String = str(int(fmod(level_play_time, 60.0)))
	
	level_play_time_label.text = "LEVEL COMPLETED IN %s MINUTES AND %s SECONDS" % [minutes, seconds]
	success_panel.show()

func _on_next_level_button_button_up():
	next_level.emit()

func _on_quit_button_button_up():
	GameManager.quit_game()
