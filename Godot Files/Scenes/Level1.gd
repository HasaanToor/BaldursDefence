extends Node2D

@onready var hobgoblin = preload("res://Enemies/Hobgoblin.tscn") # load hobgoblin enemy
var path
var PointPath
var enemy

# Called when the node enters the scene tree for the first time.
func _ready():
	path = get_tree().get_root().get_node("Level1/Path2D") # path2D that the enemies will follow
	PointPath = get_tree().get_root().get_node("Level1/UI")
	
	wave1()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	PointPath.get_node("HealthLabel").set_text("Health:❤" + str(Points.hp))
	PointPath.get_node("PointLabel").set_text("Coins:💰" + str(Points.points))
	if Points.hp <= 0:
		get_tree().change_scene_to_file("res://MainMenu/GameOver.tscn")
	await get_tree().create_timer(1.0).timeout # timer
	if (path.get_child_count() == 0):
		get_tree().change_scene_to_file("res://MainMenu/Win.tscn")

func wave1():
	for i in 5: # repeat 5 times
		enemy = hobgoblin.instantiate()
		path.add_child(enemy)
		await get_tree().create_timer(1).timeout # timer
	
	for i in 10: # repeat 5 times
		enemy = hobgoblin.instantiate()
		path.add_child(enemy)
		await get_tree().create_timer(0.5).timeout # timer
		
	for i in 20: # repeat 5 times
		enemy = hobgoblin.instantiate()
		path.add_child(enemy)
		await get_tree().create_timer(0.25).timeout # timer
