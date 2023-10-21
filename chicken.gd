extends CharacterBody2D
var player
const speed = 50.0
var dir=0.0
func _ready():
	player = get_node("/root/main/Player")
	
func _physics_process(delta):
	if get_node_or_null("/root/main/Player")!=null:
		dir = global_position.direction_to(player.global_position)
		velocity.y=speed*sin(dir.angle())
		velocity.x=(speed*cos(dir.angle()))
		move_and_slide()

