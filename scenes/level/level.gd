extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser/laser.tscn");
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade/grenade.tscn");

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	print('body entered area')


func _on_area_2d_body_exited(body):
	print('body exited area')


func _on_player_laser_shoot(position, direction):
	var laser = laser_scene.instantiate() as Area2D;
	laser.position = position;
	laser.rotation = direction.angle();
	laser.direction = direction;
	$Projectiles.add_child(laser);


func _on_player_grenade_shoot(position, direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D;
	grenade.position = position;
	grenade.linear_velocity = direction * grenade.speed;
	$Projectiles.add_child(grenade);
