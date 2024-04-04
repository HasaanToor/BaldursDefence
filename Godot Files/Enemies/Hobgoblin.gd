extends PathFollow2D

# speed of enemy
@export var speed = 200
var health = 20

func _process(delta):
	# update the position along the path
	set_progress(get_progress() + speed*delta)
	
	# if it reaches the end of the path
	if get_progress_ratio() == 1:
		queue_free()
		Points.hp -= 10
	
	if health <= 0:
		queue_free()
		Points.points += 10
