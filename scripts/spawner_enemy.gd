extends Node

const enemy_kamikaze = preload("res://scenes/enemy_kamikaze.tscn")

func _ready():
	spawn()
	pass

func spawn():
	randomize()
	
	while true:
		var enemy = enemy_kamikaze.instance()
		var pos = Vector2()
		pos.x = rand_range(0+16, utils.view_size.width-16)
		pos.y = 0-16
		enemy.set_pos(pos)
		get_node("container").add_child(enemy)
		yield(utils.create_timer(rand_range(0.5, 1.25)), "timeout")
	pass