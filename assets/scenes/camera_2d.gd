extends Camera2D

@export var camera_speed: int = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_up"):
		position.y -= camera_speed
	if Input.is_action_pressed("ui_down"):
		position.y += camera_speed
	if Input.is_action_pressed("ui_left"):
		position.x -= camera_speed 
	if Input.is_action_pressed("ui_right"):
		position.x += camera_speed
