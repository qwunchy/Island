extends Area2D
const distance = 10
var initial_angle=0
var angle = 0
const angular_speed = 10
var inital_x_position = 0
var inital_y_position = 0
func _ready():  
	inital_x_position=position.x
	inital_y_position=position.y
	$Sprite2D.rotate(initial_angle*PI/180+PI)
	angle = initial_angle
	
	
func _process(delta):
	position.x = cos(angle)*distance+inital_x_position
	position.y = sin(angle)*distance+inital_y_position
	$Sprite2D.rotate(delta*angular_speed)
	angle += angular_speed * delta
	if angle > PI+initial_angle or angle < -PI-initial_angle:
		hide()
		queue_free()


func _on_body_entered(body):
	print(body)
	body.queue_free()
