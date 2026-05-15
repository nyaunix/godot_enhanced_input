extends Node

var functions: Array[Callable] = []

func call_functions(data_in: Vector2):
	for f in functions: 
		f.call(data_in)

#region public
func bind(function_in: Callable):
	functions.insert(functions.bsearch(function_in), function_in)
	
func unbind(name_in: String, function_in: Callable):
	var i = functions.find(name_in)
	assert(i != -1, "unbind can only valid value")
	functions.erase(function_in)
#endregion
