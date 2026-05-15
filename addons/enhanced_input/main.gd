extends Node

var key_gd = preload("res://addons/enhanced_input/key.gd").new()
var motion_gd = preload("res://addons/enhanced_input/motion.gd").new()
var filter_gd = preload("res://addons/enhanced_input/filter.gd").new(self)

func _ready():
	add_child(filter_gd)
	
	#test
	#preload("res://addons/enhanced_input/test.gd").new(self)
