extends Node2D

onready var prePlayer = preload("res://Cenas/Outros/Player/Player.tscn")
onready var balao = preload("res://Cenas/Outros/Conteudo/Conteudo.tscn").instance()

func _on_Area2D2_body_entered():
	add_child(balao)
	balao.load_Instru('ginasio2fase2')


var playerPosition = Vector2(50, 290)

var player

func iniciarPlayer(posicao):
	var player = prePlayer.instance()
	player.position = posicao
	return player
	
func _ready():
	#$SoundX.play()
	player = iniciarPlayer(playerPosition)
	
	add_child(player)
	
	player.camera.limit_left = 0
	player.camera.limit_bottom = 735
	player.camera.limit_top = 0
	player.camera.limit_right = 1500
	player.camera.zoom = Vector2(1, 1)
	
func _process(delta):
	if Global.count >= 14:
		Global.fase1 = true
	else: 
		Global.fase1 = false

#Funções que indicam a próxima fase e o mapa anterior
	
func _on_Area2D_body_entered():
	if Global.fase1 == true:
		get_tree().change_scene("res://Cenas/Ginasio-02/Ginasio02_fase03.tscn")
	
