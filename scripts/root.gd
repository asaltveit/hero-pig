extends Node2D

var skeleton_scene = preload("res://scenes/skeleton.tscn")
var enemies = []

func generate_enemy():
	if enemies.is_empty():
		var x = 0
		var y = 500
		var skeleton = skeleton_scene.instantiate()
		skeleton.position = Vector2i(x, y)
		add_child(skeleton)
		enemies.append(skeleton)
		

func _ready():
	pass # Replace with function body.


func _process(_delta):
	generate_enemy()
