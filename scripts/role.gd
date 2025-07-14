extends Resource
class_name Role

@export var fullname: String = ""
@export var nickname: String = ""
@export var gender: String = ""
@export_multiline var description: String = ""
@export var birthday: String = ""

@export var states: RoleStates = RoleStates.new()

func get_age() -> int:
	var birth_year = birthday.split("-")[0].to_int()
	var current_year = Time.get_date_dict_from_system()["year"]
	return current_year - birth_year

func get_info() -> String:
	return """
{fullname} ({nickname})
性别: {gender}
年龄: {age}
状态: 生命{health}/体力{stamina}/心情{mood}
""".format({
		"fullname": fullname,
		"nickname": nickname,
		"gender": gender,
		"age": get_age(),
		"health": states.health,
		"stamina": states.stamina,
		"mood": states.mood
	})

func _init(init_data: Dictionary = {}):
	fullname = init_data.get("fullname", "")
	nickname = init_data.get("nickname", fullname)
	gender = init_data.get("gender", "0")
	description = init_data.get("description", "")
	birthday = init_data.get("birthday", "")
	
	var states_data = init_data.get("states", {})
	if states_data is RoleStates:
		states = states_data
	elif states_data is Dictionary:
		_apply_states_dict(states_data)
		
func change_states(new_states: Dictionary) -> void:
	_apply_states_dict(new_states)

func _apply_states_dict(states_dict: Dictionary) -> void:
	if states_dict.has("health"): 
		states.health += states_dict.get("health", 0)
	if states_dict.has("stamina"): 
		states.stamina += states_dict.get("stamina", 0)
	if states_dict.has("mood"): 
		states.mood += states_dict.get("mood", 0)
	if states_dict.has("energy"): 
		states.energy += states_dict.get("energy", 0)
	if states_dict.has("hunger"): 
		states.hunger += states_dict.get("hunger", 0)
