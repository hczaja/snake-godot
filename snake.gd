extends Area2D
signal hit

@export var speed = 128
var direction = Vector2.DOWN

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		
	if Input.is_action_pressed("move_left"):
		direction = Vector2.LEFT
		$Sprite2D.rotation = deg_to_rad(270)
	if Input.is_action_pressed("move_right"):
		direction = Vector2.RIGHT
		$Sprite2D.rotation = deg_to_rad(90)
	if Input.is_action_pressed("move_up"):
		direction = Vector2.UP
		$Sprite2D.rotation = deg_to_rad(0)
	if Input.is_action_pressed("move_down"):
		direction = Vector2.DOWN
		$Sprite2D.rotation = deg_to_rad(180)
		
	position += delta * (direction.normalized() * speed)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

func _on_body_entered(body):
	hide()
	hit.emit()
	$CollisionShape2D.set_deferred("disabled", true)
