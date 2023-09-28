extends CharacterBody2D

var speed = 100;

func _process(delta):
	velocity = Vector2.RIGHT * speed;	
	move_and_slide();
