extends Node
## Manages the game session.

## Keeps track of amount of time elapsed since the game began.
var total_time_elapsed : float

var time_paused : bool = true

func _process(delta):
	if not time_paused:
		total_time_elapsed += delta

func _unhandled_input(event):
	if event.is_action_pressed("quit"):
		quit_game()

## Used to close the application when the escape key is pressed.
func quit_game():
	get_tree().quit()

func start_timer():
	time_paused = false

func pause_timer():
	time_paused = true

func reset_timer():
	total_time_elapsed = 0.0
