extends CharacterBody2D

signal laser_shoot(position: Vector2, direction: Vector2);
signal grenade_shoot(position: Vector2, direction: Vector2);

var speed: int = 350;

var can_laser: bool = true;
var can_grenade: bool = true;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# rotate
	look_at(get_global_mouse_position());
	
	# movement
	var direction = Input.get_vector("left","right","up","down");
	velocity = direction * speed;
	move_and_slide();
	
	# actions
	if (Input.is_action_pressed("primary action") and can_laser):
		var laser_markers = $LaserStartPositions.get_children();
		can_laser = false;
		$GPUParticles2D.emitting = true;
		$LaserReloadTimer.start();
		var laser = laser_markers[randi() % laser_markers.size()];
		var directon = (get_global_mouse_position() - position).normalized();
		laser_shoot.emit(laser.global_position, directon);
	
	if (Input.is_action_pressed("secondary action") and can_grenade):
		var grenade_markers = $GrenadeStartPositions.get_children();
		can_grenade = false;
		$GrenadeReloadTimer.start();
		var grenade = grenade_markers[randi() % grenade_markers.size()];
		var directon = (get_global_mouse_position() - position).normalized();
		grenade_shoot.emit(grenade.global_position, directon);
	
func _on_laser_reload_timer_timeout():
	can_laser = true;


func _on_grenade_reload_timer_timeout():
	can_grenade = true;
