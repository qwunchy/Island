extends CharacterBody2D

const punch = preload("res://punch.tscn")
const SPEED = 150.0
var last_direction=0
var target_animation
var angle=0
var timep=0.0
signal deleted
signal player_position(pos)
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
		angle=180
		
	
	if Input.is_action_pressed("down"):
		velocity.y +=1
		last_direction = 2
		target_animation = "walk_down"
		angle=0
	
	if Input.is_action_pressed("left"):
		velocity.x -=1
		last_direction = 3
		target_animation = "walk_left"
		angle=90
	
	if Input.is_action_pressed("right"):
		velocity.x +=1
		last_direction = 4
		target_animation = "walk_right"
		angle=270
	
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
	
	if Input.is_action_just_pressed("attack") and timep<1:
		var spawn_punch = punch.instantiate()
		spawn_punch.initial_angle=angle
		spawn_punch.position.y+=2
		add_child(spawn_punch)
		timep=PI
	timep-=delta*5
	player_position.emit(position)
	move_and_slide()



func _on_area_2d_body_entered(body):
	deleted.emit()
	queue_free()
