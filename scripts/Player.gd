extends KinematicBody2D
const VELX = 500
const GRAV = 1500
var velocity = Vector2(0,0)
var jump = false
var jump_release = false
var was_on_floor = false
var ending = false
var pulo_mola = false
var morreu = false
var kill_enemy = false
var modo_voador = false
var voo = false
var victory = false
func _ready():
	set_physics_process(true)
	add_to_group("player")
func _physics_process(delta):
	if ending:
		velocity.x = 0
		velocity.y += GRAV * delta
		if victory:
			velocity.y = 0
		velocity = move_and_slide(velocity)
		if position.y > 650:
			get_tree().call_group("scenes", "game_over")
			
	else:
		#Gravidade
		velocity.y += GRAV * delta
		velocity.x = VELX
		velocity = move_and_slide(velocity, Vector2(0, -1))
		
		if is_on_floor():
			if not was_on_floor:
				$animation.play("player_elastico")
				$animation.play("dust")
			$anim.play("walk")
			if jump:
				velocity.y = -1000
				$sound_jump.play()
		else:
			$anim.play("jump")
			if jump_release:
				velocity.y *= .3
		if pulo_mola:
			velocity.y = -1200
		if kill_enemy:
			velocity.y = -800
		if position.y > 500:
			dead()
		if voo:
			velocity.y = -800
			$animation.play("asas")
			$sound_voo.play()
		was_on_floor = is_on_floor()
		jump = false
		jump_release = false
		pulo_mola = false
		kill_enemy = false
		voo = false
func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			jump = true
			if modo_voador:
				voo = true
		else:
			jump_release = true
func happy():
	powerup_finished()
	$anim.play("victory")
	ending = true
	victory = true
func pulo_mola():
	pulo_mola = true
func dead():
	get_tree().call_group("scenes", "stop_song")
	if !ending and !morreu:
		ending = true
		morreu = true
		$anim.play("hurt")
		collision_layer = 0
		collision_mask = 0
		$sound_dead.play()
		velocity.y = -1000
func kill_enemy():
	kill_enemy = true
func ativar_asas():
	$asas.show()
	modo_voador = true
func powerup_finished():
	get_tree().call_group("hud", "_hide_bar")
	$asas.hide()
	modo_voador = false