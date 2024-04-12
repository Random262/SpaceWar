extends Area2D

func _ready():
	set_process(true)
	pass
	
func _process(delta):
	var motion = (utils.mouse_pos.x - get_pos().x) * 0.15
	translate(Vector2(motion, 0))
	
	
	var pos = get_pos()
	pos.x = clamp(pos.x, 0+16, utils.view_size.width-16)
	set_pos(pos)
	pass	
