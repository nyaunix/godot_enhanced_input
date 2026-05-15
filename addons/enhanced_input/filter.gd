extends Node
var key_gd
var motion_gd
var actions: Array[StringName] = []

func _init(main):
	key_gd = main.key_gd
	motion_gd = main.motion_gd
	reload()

func reload():
	actions.clear()
	for a in InputMap.get_actions():
		if !a.begins_with("ui_"): #comment it if need consider engine preset
			actions.append(a)
	actions.sort()

func _unhandled_input(event: InputEvent):
	filter_input(event)

#search InputMap event
func filter_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion: 
		motion_gd.call_functions(event.screen_velocity)
	else: for a in actions:
		if event.is_action(a):
			prepare_input(event, a)


func prepare_input(event: InputEvent, name_in: StringName) -> void:
	if event.is_pressed():
		key_gd.call_true(name_in)
	else:
		key_gd.call_false(name_in)
