extends Node2D

var speed: int = 250;
var startPosition: Vector2 = Vector2(100, 150);

# Called when the node enters the scene tree for the first time.
func _ready():
	position = startPosition;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# movement
	var direction = Input.get_vector("left","right","up","down");
	position += direction * speed * delta;
	
	# actions
	if (Input.is_action_pressed("primary action")):
		print("text");
	if (Input.is_action_pressed("secondary action")):
		print("text 2");
