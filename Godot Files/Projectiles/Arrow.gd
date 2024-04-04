extends CharacterBody2D

var target
var speed = 500
var pathName = ""
var damage

func _physics_process(delta):
	var pathFor2D = get_tree().get_root().get_node("Level1/Path2D")
	
	for i in pathFor2D.get_child_count():
		if pathFor2D.get_child(i).name == pathName:
			target = pathFor2D.get_child(i).get_child(0).global_position
	
	velocity = global_position.direction_to(target) * speed
	look_at(target)
	move_and_slide()



func _on_area_2d_body_entered(body):
	if "Hobgoblin" in body.name:
		body.get_parent().health -= damage
		queue_free()
