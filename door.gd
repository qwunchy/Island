extends StaticBody2D
	

var enable = false
var flag = false
func _on_area_2d_body_entered(body):
	if str(body).begins_with("Player"):
		enable = true

func _on_area_2d_body_exited(body):
	if str(body).begins_with("Player"):
		enable = false

func interact() -> void:
	if $AnimatedSprite2D.animation=="shut":
		$AnimatedSprite2D.animation="open"
		get_node("CollisionShape2D").disabled=true
	else:
		$AnimatedSprite2D.animation="shut"
		get_node("CollisionShape2D").disabled=false
func _ready():
	pass

func _process(delta):
	if enable and Input.is_action_just_pressed("interact"):
		interact()

