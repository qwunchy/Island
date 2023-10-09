extends CharacterBody2D


const SPEED = 150.0
var last_direction=0
var target_animation
# Get the gravity from the project settings to be synced with RigidBody nodes.

func _ready():
	target_animation = "idle_down"
	$AnimatedSprite2D.play()
func _physics_process(delta):
	velocity=Vector2.ZERO
	
	if Input.is_action_pressed("up"):
		velocity.y -=1
		last_direction = 1
		target_animation = "walk_up"
		
	
	if Input.is_action_pressed("down"):
		velocity.y +=1
		last_direction = 2
		target_animation = "walk_down"
	
	if Input.is_action_pressed("left"):
		velocity.x -=1
		last_direction = 3
		target_animation = "walk_left"
	
	if Input.is_action_pressed("right"):
		velocity.x +=1
		last_direction = 4
		target_animation = "walk_right"
	
	
	if velocity.length() > 0:
		velocity = velocity.normalized()*SPEED
	elif last_direction == 1:
		target_animation="idle_up"
	elif last_direction == 2:
		target_animation="idle_down"
	elif last_direction == 3:
		target_animation="idle_left"
	elif last_direction == 4:
		target_animation="idle_right"
	$AnimatedSprite2D.animation = str(target_animation)
	move_and_slide()
