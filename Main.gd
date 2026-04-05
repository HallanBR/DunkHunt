extends Node2D

var patosnatela = 0
var pato = preload("res://pato.tscn")
var flyaway = 0
var capturados = 0
var turno_ativo = false
var turno_finalizado = false

func _ready():
	$gerapato.connect("timeout", self, "_on_gerapato_timeout")
	$gerapato.start()

func _process(_delta):
	$HUD/label.text = str(capturados)

func nasce():
	var novop = pato.instance()
	add_child(novop)
	novop.position.x = rand_range(50, 700)
	novop.position.y = 700

func registrar_captura():
	if not turno_ativo:
		return
	capturados += 1
	patosnatela -= 1
	atualizaturno()

func _on_gerapato_timeout():
	flyaway = 0
	turno_finalizado = false
	patosnatela = int(rand_range(1, 6))
	turno_ativo = true
	for i in range(patosnatela):
		nasce()

func _on_espera_timeout():
	$novoturno.play()
	$gerapato.start()

func _on_topo_body_entered(body):
	$flyaway.play()
	if not turno_ativo:
		return
	if body.is_in_group("pato") and not body.morto and not body.contabilizado:
		body.contabilizado = true
		flyaway += 1
		patosnatela -= 1
		atualizaturno()

func _on_chao_body_entered(body):
	if body.is_in_group("pato") and body.morto:
		$colidiu.play()

func atualizaturno():
	if turno_finalizado:
		return
	if patosnatela == 0 and turno_ativo:
		turno_finalizado = true
		turno_ativo = false
		$espera.start()
		if flyaway > 0:
			$cao.play("rindo")
			$cao_rindo.play()
			capturados = 0
		else:
			$cao.play("captura")
			$cao_captura.play()
