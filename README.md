Godot 4.2+

## Documentation

0. Actions starting with "ui_" are ignored by default. You can change this behavior in `filter.gd` inside the `reload()` function.

1. Load `main.gd` into the scene using Globals (AutoLoad) or `add_child()`.

2. Bind / unbind actions.
   `bind_true` = action pressed
   `bind_false` = action released, canceled, etc.

   # InputMap
   main.key.bind_true("action_name", my_function)
   main.key.unbind_true("action_name", my_function)

   # Mouse motion, my_function(Vector2)
   main.motion.bind("action_name", my_function)
   main.motion.unbind("action_name", my_function)

3. If the InputMap is modified during gameplay, call:
   main.filter_gd.reload()

   
## How the plugin works

1. You bind functions to an InputMap Action name.
2. The player presses a key, mouse button, or other input.
3. The plugin filters the input and checks for matching Actions from the InputMap.
4. All functions bound to that Action name are executed.
(This is a very simplified description, as there are optimizations that would make the description more complex)
