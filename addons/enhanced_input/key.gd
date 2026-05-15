extends Node

#region private data
var names_true: Array[String] = []
var names_false: Array[String] = []
var functions_true: Array[Array] = [[_init]] #clear when _ready
var functions_false: Array[Array] = [[_init]] #clear when _ready
#endregion

#region private logic
func _init():
	functions_true.clear()
	functions_false.clear()

func place_true(i: int, name_in: StringName) -> bool:
	return !names_true.is_empty() and names_true.size() > i and names_true[i] == name_in
func place_false(i: int, name_in: StringName) -> bool:
	return !names_false.is_empty() and names_false.size() > i and names_false[i] == name_in
#endregion

#region public logic
#region call
func call_true(name_in: String):
	var i = names_true.bsearch(name_in)
	if place_true(i, name_in):
		for f in functions_true[i]: 
			f.call()

func call_false(name_in: String):
	var i = names_false.bsearch(name_in)
	if place_false(i, name_in):
		for f in functions_false[i]: 
			f.call()
#endregion

#region binding
func bind_true(name_in: String, function_in: Callable):
	var i = names_true.bsearch(name_in)
	if place_true(i, name_in): #found
		functions_true[i].append(function_in)
	else: #not found
		names_true.insert(i, name_in)
		functions_true.insert(i, [function_in])

func bind_false(name_in: String, function_in: Callable):
	var i = names_false.bsearch(name_in)
	if place_false(i, name_in): #found
		functions_false[i].append(function_in)
	else: #not found
		names_false.insert(i, name_in)
		functions_false.insert(i, [function_in])
	
func unbind_true(name_in: String, function_in: Callable):
	var i = names_true.bsearch(name_in)
	assert(place_true(i, name_in), "unbind can only valid value")
	functions_true[i].erase(function_in)

func unbind_false(name_in: String, function_in: Callable):
	var i = names_false.bsearch(name_in)
	assert(place_false(i, name_in), "unbind can only valid value")
	functions_false[i].erase(function_in)
#endregion
#endregion
