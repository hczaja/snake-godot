extends Node2D

@export var size : int = 32
@export var speed : float = 0.5

@export var snake_body_scene : PackedScene

var body_segments : Array[SnakeBody]

func _ready():
	$Timer.start(speed)

	clear_body_segments()
	add_body_segment()


func _process(delta):
	if Input.is_action_pressed("move_left"):
		$Head.set_direction_left()
	if Input.is_action_pressed("move_right"):
		$Head.set_direction_right()
	if Input.is_action_pressed("move_up"):
		$Head.set_direction_up()
	if Input.is_action_pressed("move_down"):
		$Head.set_direction_down()


func _on_timer_timeout():
	var body_length : int = len(body_segments)
	
	for i in range(body_length - 1, 0, -1):
		body_segments[i].position = body_segments[i-1].position
	
	body_segments[0].position = $Head.position
	$Head.position += size * $Head.direction.normalized()


func add_body_segment():
	var body_length : int = len(body_segments)

	var body_segment = snake_body_scene.instantiate()
	if body_length == 0:
		body_segment.position = $Head.position
	else:
		body_segment.position =  body_segments[len(body_segments) - 1].position
	
	body_segments.append(body_segment)
	add_child(body_segment)


func clear_body_segments():
	body_segments.clear()


func _on_apple_eaten():
	add_body_segment()
