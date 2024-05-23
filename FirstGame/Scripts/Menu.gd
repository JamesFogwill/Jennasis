extends Control


func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/game.tscn")


func _on_host_pressed():
	print("Join as Host")
	get_tree().change_scene_to_file("res://Scenes/game.tscn")
	MultiplayerManager.become_host()


func _on_join_pressed():
	print("Join as Player 2")
	get_tree().change_scene_to_file("res://Scenes/game.tscn")
	MultiplayerManager.join_as_player2()
	
	
func _on_options_pressed():
	get_tree().change_scene_to_file("res://Scenes/options_menu.tscn")


func _on_exit_pressed():
	get_tree().quit()


