extends Control

@onready var game_play_time_label : Label = $SuccessPanel/GamePlayTimeLabel

func _ready():
	var minutes : String = str(int(GameManager.total_time_elapsed / 60.0))
	var seconds : String = str(int(fmod(GameManager.total_time_elapsed, 60.0)))
	
	game_play_time_label.text = "GAME COMPLETED IN %s MINUTES AND %s SECONDS" % [minutes, seconds]

func _on_quit_button_button_up():
	GameManager.quit_game()
