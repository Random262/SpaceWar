extends Node

const enemies = [
	preload("res://scenes/enemy_kamikaze.tscn"),
	preload("res://scenes/enemy_annihilator.tscn")
]

var flag = true


func _ready():
	get_tree().connect("node_removed", self, "_on_node_removed")
	spawn()		
	pass

func spawn():
	randomize()
	while flag:		
		yield(utils.create_timer(1.2), "timeout")
		if is_ship_group_empty():
			flag = false
			break
		var enemy = utils.choose(enemies).instance()
		var pos = Vector2()
		pos.x = rand_range(0+16, utils.view_size.width-16)
		pos.y = 0-16
		enemy.set_pos(pos)
		get_node("container").add_child(enemy)
		yield(utils.create_timer(rand_range(0.5, 1.2)), "timeout")
	pass
	
func is_ship_group_empty():
    var ships = get_tree().get_nodes_in_group("ship")
    return ships.size() == 0

func _on_node_removed(node):
    if node.is_in_group("ship") and is_ship_group_empty():
        flag = false
    pass
