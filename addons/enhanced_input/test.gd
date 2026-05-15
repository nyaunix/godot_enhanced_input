extends Node

var main_gd

func _init(main):
	main_gd = main
	test()

func test():
	main_gd.key_gd.bind_true("move_left", self.print_1)
	main_gd.key_gd.bind_false("move_right", self.print_2)
	main_gd.motion_gd.bind(print_Vector2)
	pass

func print_1():
	print("1")
func print_2():
	print("2")
func print_Vector2(data_in: Vector2):
	print("motion: ", data_in)
