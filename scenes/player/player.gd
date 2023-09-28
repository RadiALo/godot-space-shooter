extends CharacterBody2D

var speed: int = 150;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# movement
	var direction = Input.get_vector("left","right","up","down");
	velocity = direction * speed;
	move_and_slide();
	
	# actions
	if (Input.is_action_pressed("primary action")):
		print("laser");
	if (Input.is_action_pressed("secondary action")):
		print("granade");
