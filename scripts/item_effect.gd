extends Resource
class_name ItemEffect

## 效果类型枚举
enum EffectType {
	INSTANT,    # 瞬时生效
	OVER_TIME,  # 持续生效
	TOGGLE      # 开关型效果
}

## 效果目标属性（对应RoleStates中的字段）
enum TargetProperty {
	HEALTH,
	STAMINA,
	MOOD,
	ENERGY,
	HUNGER
}

var type: EffectType
var target: TargetProperty
var value: float          # 修改值（可正可负）
var duration: float = 0.0 # 持续时间（秒）
var stacks: bool = false  # 是否允许叠加

func _init(
	p_type: EffectType,
	p_target: TargetProperty,
	p_value: float,
	p_duration: float = 0.0,
	p_stacks: bool = false
):
	type = p_type
	target = p_target
	value = p_value
	duration = p_duration
	stacks = p_stacks

## 将效果应用到角色
func apply(role: Role) -> void:
	var property_name = TargetProperty.keys()[target].to_lower()
	match type:
		EffectType.INSTANT:
			role.change_states({property_name: value})
		EffectType.OVER_TIME:
			_apply_over_time_effect(role, property_name)
		EffectType.TOGGLE:
			_apply_toggle_effect(role, property_name)

## 持续效果处理（需角色支持）
func _apply_over_time_effect(role: Role, property: String) -> void:
	if role.has_method("add_timed_effect"):
		role.add_timed_effect(
			{property: value / duration}, # 每秒变化量
			duration
		)

## 开关效果处理（如中毒/增益光环）
func _apply_toggle_effect(role: Role, property: String) -> void:
	if role.has_method("toggle_effect"):
		role.toggle_effect(property, value)
