extends Node

var player_score = 0
var opponent_score = 0


func _on_left_body_entered(body):
	$ball.position = Vector2(512,300)
	opponent_score += 1
	get_tree().call_group('ball_group','stop_ball')
	$countdown_timer.start()
	$restart_delay.visible = true
	$score_sound.play()
	$player.position.x = 35

func _on_right_body_entered(body):
	$ball.position = Vector2(512,300)
	player_score += 1
	get_tree().call_group('ball_group','stop_ball')
	$countdown_timer.start()
	$restart_delay.visible = true
	$score_sound.play()
	$opponent.position.x = 1024 - 35

func _process(delta):
	$player_score.text = str(player_score)
	$opponent_score.text = str(opponent_score)
	$restart_delay.text = str(int($countdown_timer.time_left) + 1)

func _on_countdown_timer_timeout():
	get_tree().call_group('ball_group','restart_ball')
	$restart_delay.visible = false
