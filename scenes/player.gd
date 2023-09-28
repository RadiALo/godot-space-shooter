extends Node2D

var speed: int = 25;
var startPosition: Vector2 = Vector2(100, 150);

# Called when the node enters the scene tree for the first time.
func _ready():
	position = startPosition;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += speed * delta;
	rotation_degrees += 720 * delta;
