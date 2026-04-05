extends Area2D

func _ready():
	z_index = 3

func _process(_delta):
	if get_parent():
		position = get_parent().get_local_mouse_position()

func _input(_event):
	if not Input.is_action_just_pressed("atirar"):
		return
	if get_parent():
		position = get_parent().get_local_mouse_position()
	$AudioStreamPlayer2D.play()
	var bodies = get_overlapping_bodies()
	var alvo_pato = null
	for b in bodies:
		if b.is_in_group("pato") and not b.morto:
			alvo_pato = b
			break
	if alvo_pato:
		alvo_pato.mata()
	else:
		print("Sem patos por aqui")
