extends StaticBody2D

var Arrow = preload("res://Projectiles/Sword.tscn")
var damage = 5
var pathName

var objectsInRange = []
var curr

var pointsRequired = 10

func _ready():
	set_pickable(true) # allows the object to detect the mouse cursor

func _process(delta):
	if !is_instance_valid(curr):
		for i in get_node("Container").get_child_count():
			get_node("Container").get_child(i).queue_free()


func _on_tower_body_entered(body):
	if "Hobgoblin" in body.name:
		var tempArray = []
		objectsInRange = get_node("Tower").get_overlapping_bodies() # gets all the objects in the range of the tower (including itself)

		for i in objectsInRange:
			if "Hobgoblin" in i.name:
				tempArray.append(i) # array of just enemies in range

		var currTarget = null

		for i in tempArray: # iterate array of enemies
			if currTarget == null:
				currTarget = i.get_node("../") # set target as first object
			else:
				if i.get_parent().get_progress() > currTarget.get_progress(): # if an enemy has more progress, that is the new target (target first)
					currTarget = i.get_node("../")

		curr = currTarget
		pathName = currTarget.name #PathFollow2D

		# shoot arrow
		var tempArrow = Arrow.instantiate()
		tempArrow.pathName = pathName
		tempArrow.damage = damage
		get_node("Container").add_child(tempArrow)
		tempArrow.global_position = $Aim.global_position


func _on_tower_body_exited(body):
	pass # Replace with function body.

func _on_mouse_entered():
	get_node("Area").show()

func _on_mouse_exited():
	get_node("Area").hide()
