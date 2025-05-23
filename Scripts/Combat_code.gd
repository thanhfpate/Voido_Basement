extends CharacterBody2D

const COMBO_WINDOW_TIME: float = 0.5 # seconds

var state: String = "IDLE"
var current_combo_button: String = ""
var combo_stage: int = 0
var combo_timer: float = 0.0

@onready var anim: AnimationPlayer = $Combo_animation

func _ready() -> void:
	anim.animation_finished.connect(_on_animation_finished)

func _process(delta: float) -> void:
	if state == "IDLE":
		if Input.is_action_just_pressed("attack_light"):
			start_attack("light")
		elif Input.is_action_just_pressed("attack_medium"):
			start_attack("medium")
		elif Input.is_action_just_pressed("attack_heavy"):
			start_attack("heavy")
	elif state == "COMBO_WINDOW":
		combo_timer -= delta
		if combo_timer <= 0:
			state = "IDLE"
			current_combo_button = ""
			combo_stage = 0
		else:
			if Input.is_action_just_pressed("attack_light"):
				handle_input("light")
			elif Input.is_action_just_pressed("attack_medium"):
				handle_input("medium")
			elif Input.is_action_just_pressed("attack_heavy"):
				handle_input("heavy")

func start_attack(button: String) -> void:
	current_combo_button = button
	combo_stage = 1
	play_attack_animation(button, combo_stage)
	state = "ATTACKING"

func handle_input(button: String) -> void:
	if button == current_combo_button and combo_stage < get_max_stages(current_combo_button):
		combo_stage += 1
		play_attack_animation(current_combo_button, combo_stage)
		state = "ATTACKING"
	elif button != current_combo_button:
		start_attack(button)
	combo_timer = COMBO_WINDOW_TIME

func play_attack_animation(button: String, stage: int) -> void:
	var anim_name: String = button + str(stage)
	if anim.has_animation(anim_name):
		anim.play(anim_name)
	else:
		print("Animation not found: ", anim_name)
		state = "IDLE"

func _on_animation_finished(anim_name: StringName) -> void:
	if state == "ATTACKING":
		state = "COMBO_WINDOW"
		combo_timer = COMBO_WINDOW_TIME

func get_max_stages(button: String) -> int:
	match button:
		"light": return 3
		"medium": return 2
		"heavy": return 1
	return 0
