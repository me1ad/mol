extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func count_files(folder_path: String) -> int:
	var dir = DirAccess.open(folder_path)

	if dir == null:
		return 0

	var count := 0
	dir.list_dir_begin()

	var file_name = dir.get_next()
	while file_name != "":
		if not dir.current_is_dir():
			count += 1
		file_name = dir.get_next()

	dir.list_dir_end()
	return count
