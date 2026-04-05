extends KinematicBody2D

var lado = 1
var speed = 100
var queda = 1
var morto = false
var contabilizado = false

func _ready():
	$quack.wait_time = rand_range(0.8, 2)
	randomize()
	add_to_group("pato")
	z_index = 0
	$movimento.wait_time = rand_range(0.4, 2)
	$anima.wait_time = rand_range(0.6, 1)

func _physics_process(delta):
	if morto:
		move_and_collide(Vector2(0, 200 * delta))
		return
	var motion = Vector2(speed * lado * delta, -140 * delta)
	move_and_collide(motion)
	if lado < 0:
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.flip_h = false

func _on_movimento_timeout():
	lado *= -1

func _on_anima_timeout():
	if $AnimatedSprite.animation == "cima":
		$AnimatedSprite.animation = "lado"
	else:
		$AnimatedSprite.animation = "cima"

func mata():
	if morto:
		return
	morto = true
	$quack.stop()
	$AnimatedSprite.animation = "susto"
	$morte.start()

func _on_morte_timeout():
	$quack.stop()
	$AnimatedSprite.animation = "morte"
	yield(get_tree().create_timer(1.0), "timeout")
	if not contabilizado:
		contabilizado = true
		get_parent().registrar_captura()
	queue_free()

func _on_quack_timeout():
	if morto:
		return
	$audio.play()
