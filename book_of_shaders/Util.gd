extends Object
class_name Util

# Thanks to https://www.davidepesce.com/2019/11/04/essential-guide-to-godot-filesystem-api/
static func copy_recursive(from, to):
	var directory = Directory.new()
	
	# create target directory, if nonexistent
	if directory.dir_exists(to): return
	
	directory.make_dir_recursive(to)
	
	# Open directory
	var error = directory.open(from)
	if error == OK:
		# List directory content
		directory.list_dir_begin(true)
		var file_name = directory.get_next()
		while file_name != "":
			if directory.current_is_dir():
				copy_recursive(from + "/" + file_name, to + "/" + file_name)
			else:
				directory.copy(from + "/" + file_name, to + "/" + file_name)
			file_name = directory.get_next()
	else:
		print("Error copying " + from + " to " + to)
