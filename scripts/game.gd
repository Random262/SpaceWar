extends Node

var bestscore = 0 setget set_bestscore
const filepath = "user://bestscore.data"

func _ready():	
	load_bestscore()
	pass
	
func load_bestscore():
	var file = File.new()
	if not file.file_exists(filepath):
		save_bestscore()
		return
	file.open(filepath, File.READ)
	if file.get_len() > 0:
        bestscore = file.get_var()
	else:
		save_bestscore()
	file.close()
	pass
	
func save_bestscore():
	var file = File.new()
	file.open(filepath, File.WRITE)
	file.store_var(bestscore)
	file.close()
	pass
	
func set_bestscore(new_value):
	bestscore = new_value
	save_bestscore()
	pass	