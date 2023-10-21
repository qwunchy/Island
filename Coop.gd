extends StaticBody2D
const chicken = preload("res://chicken.tscn")
var i = 20
func _process(delta):
	if i>6:
		var chicken_spawn=chicken.instantiate()
		chicken_spawn.position.y=30
		chicken_spawn.position.x = 315
		get_parent().add_child(chicken_spawn)
		i=0
	i+=delta
