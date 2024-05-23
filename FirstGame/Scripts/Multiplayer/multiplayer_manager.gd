extends Node

const Server_Port = 8080
const Server_IP = "127.0.0.1"

var multiplayer_scene = preload("res://Scenes/multiplayer_player.tscn")
var players_spawn_node

func become_host():
	print("Starting Host")
	
	players_spawn_node = get_tree().get_current_scene().get_node("Players")
	# create a server
	var server_peer = ENetMultiplayerPeer.new()
	server_peer.create_server(Server_Port)
	
	multiplayer.multiplayer_peer = server_peer
	# when player connects this function is called
	multiplayer.peer_connected.connect(add_player_to_game)
	multiplayer.peer_disconnected.disconnect(del_player)


func join_as_player2():
	print("Joining")
	
	# set up client peer
	var client_peer = ENetMultiplayerPeer.new()
	client_peer.create_client(Server_IP,Server_Port)
	
	multiplayer.multiplayer_peer = client_peer 
	
	
# network id of the player passed in
func add_player_to_game(id: int):
	print("Player %s joined the game" % id)
	# initiate the new player character
	var player_to_add = multiplayer_scene.instantiate()
	player_to_add.player_id = id
	player_to_add.name = str(id)
	
	# add new player as child on the Players node
	players_spawn_node.add_child(player_to_add, true)
	
func del_player(id: int):
	print("Player %s left the game" % id)
	
