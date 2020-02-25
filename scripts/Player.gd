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

func _ready():
	set_physics_process(true)
	add_to_group("player")

func _physics_process(delta):
	if ending:
		velocity.x = 0
		velocity.y += GRAV * delta
		velocity = move_and_slide(velocity)
		
		if morreu:
			velocity.y = -1000
		morreu = false
		get_tree().call_group("fade","fade_out")
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
		
		if position.y > 500:
			dead()
			
		was_on_floor = is_on_floor()
		jump = false
		jump_release = false
		pulo_mola = false
	
func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			jump = true
		else:
			jump_release = true

func happy():
	$anim.play("victory")
	ending = true

func pulo_mola():
	pulo_mola = true

func dead():
	ending = true
	morreu = true
	$anim.play("hurt")
	collision_layer = 0
	collision_mask = 0

func _on_timer_game_over_timeout():
	print("acabou")