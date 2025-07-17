extends Node2D

@onready var dialogue: CanvasLayer = $Dialogue
@onready var player_name: Label = %PlayerName
@onready var player_health: ProgressBar = %PlayerHealth
@onready var player_stamina: ProgressBar = %PlayerStamina
@onready var player_mood: ProgressBar = %PlayerMood

func _ready() -> void:
	GmStates.connect("states_changed", on_player_states_changed)
	on_player_states_changed()
	
	var act = load("res://dialogues/act_01.dialogue")
	dialogue.start(act, "start")
	
func on_player_states_changed() -> void:
	player_name.text = GmStates.player.fullname
	player_health.value = GmStates.player.states.health
	player_stamina.value = GmStates.player.states.stamina
	player_mood.value = GmStates.player.states.mood
