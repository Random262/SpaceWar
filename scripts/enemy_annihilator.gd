extends "res://scripts/enemy.gd"

const scn_laser = preload("res://scenes/laser_enemy.tscn")

var ship = utils.find_node("ship")

func _ready():
	velocity.x = utils.choose([velocity.x, -velocity.x])
	
	#yield(utils.create_timer(1.5), "timeout")
	var test1 = utils.create_timer(1.5).connect("timeout", self, "_ready")	
	if ship:
		shoot()
	pass

func _process(delta):
	if get_pos().x <= 0+16:
		velocity.x = abs(velocity.x)
	if get_pos().x >= utils.view_size.width-16:
		velocity.x = -abs(velocity.x)
	pass
	
func shoot():
	var laser = scn_laser.instance()
	laser.set_pos(get_node("cannon").get_global_pos())
	utils.main_node.add_child(laser)	
	
	var test = utils.create_timer(1.5).connect("timeout", self, "shoot")
	pass	