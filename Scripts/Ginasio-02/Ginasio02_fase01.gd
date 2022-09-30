extends Node2D

onready var prePlayer = preload("res://Cenas/Outros/Player/Player.tscn")
onready var balao = preload("res://Cenas/Outros/Conteudo/Conteudo.tscn").instance()
onready var instru = preload("res://Cenas/Outros/Conteudo/Conteudo.tscn").instance()

func _on_Area2D2_body_entered(body):
	add_child(instru)
	Global.current_dialogo = Global.dialogo["language"]["eng"]["dialogo"]["instruGym2Level1"]["talk01"]
	instru.load_Instru()

var playerPosition = Vector2(50, 290)

var player

func iniciarPlayer(posicao):
	var player = prePlayer.instance()
	player.position = playerPosition
	return player
	
func _ready():
	#$SoundX.play()
#	$Player/Camera.current = false
	player = iniciarPlayer(playerPosition)

	add_child(player)
	
	#adicionando o balao de instrução para dizer ao player o próximo passo dentro do jogo
	add_child(balao)
	Global.current_dialogo = Global.dialogo["language"]["eng"]["instructions"]["gym2"]
	balao.load_Instru()
	
	player.camera.limit_left = 0
	player.camera.limit_bottom = 736
	player.camera.limit_top = 0
	player.camera.limit_right = 1504
	player.camera.zoom = Vector2(1, 1)
	

func _process(delta):
	if Global.count >= 14:
		Global.fase1 = true
	else: 
		Global.fase1 = false

#Funções que indicam a próxima fase e o mapa anterior

func _on_Area2D_body_entered(body):
	if Global.fase1 == true:
		get_tree().change_scene("res://Cenas/Ginasio-02/Ginasio02_fase02.tscn")
	

