extends Node3D
class_name Level

@export var next_level : PackedScene

@onready var grid_map : GridMap = $GridMap
@onready var goal : Goal = $Goal
@onready var user_interface : Control = $UserInterface
@onready var player : Player = $Player

## Used to keep track of how much time has elapsed since level was started (for score-keeping)
var level_play_time : float
var level_play_time_paused : bool = false

func _ready():
	goal.level_complete.connect(level_complete)
	user_interface.next_level.connect(advance_to_next_level)
	GameManager.start_timer()

func _process(delta):
	if not level_play_time_paused:
		level_play_time += delta

func level_complete():
	GameManager.pause_timer()
	level_play_time_paused = true
	user_interface.display_success_screen(level_play_time)
	player.freeze()

func advance_to_next_level():
	get_tree().change_scene_to_packed(next_level)

func _on_update_ui_timer_timeout():
	user_interface.update_time_elapsed_label(level_play_time)
