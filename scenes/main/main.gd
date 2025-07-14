extends Node2D
@onready var player_info: RichTextLabel = %PlayerInfo
@onready var dialogue: CanvasLayer = $Dialogue

func _ready() -> void:
	GmStates.connect("states_changed", on_player_states_changed)
	on_player_states_changed()
	
	var act = load("res://dialogues/act_01.dialogue")
	dialogue.start(act, "start")
	
func on_player_states_changed() -> void:
	player_info.text = GmStates.player.get_info()
