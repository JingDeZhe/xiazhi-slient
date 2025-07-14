extends Node

## 玩家状态变化
signal states_changed()

var cur_location = "宿舍"
var player = Role.new({
	"fullname": "A",
	"gender": "1",
	"birthday": "1996-05-09",
	"description": "一个平常的大一学生",
})

func change_states(new_states: Dictionary) -> void:
	player.change_states(new_states)
	states_changed.emit()
