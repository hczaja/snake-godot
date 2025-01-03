extends Area2D

signal eats_apple

var direction : Vector2 = Vector2.DOWN

func _ready():
	set_direction_down()


func _process(delta):
	pass		


func set_direction_left():
	if direction == Vector2.RIGHT:
		return
	direction = Vector2.LEFT
	$Sprite2D.rotation = deg_to_rad(270)


func set_direction_right():
	if direction == Vector2.LEFT:
		return
	direction = Vector2.RIGHT
	$Sprite2D.rotation = deg_to_rad(90)


func set_direction_up():
	if direction == Vector2.DOWN:
		return
	direction = Vector2.UP
	$Sprite2D.rotation = deg_to_rad(0)


func set_direction_down():
	if direction == Vector2.UP:
		return
	direction = Vector2.DOWN
	$Sprite2D.rotation = deg_to_rad(180)


func _on_area_entered(area):
	if area.is_in_group("Apple"):
		area.queue_free()
		eats_apple.emit()
