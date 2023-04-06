extends Button

@export var scene = ""

func _ready():
	pass # Replace with function body.

func _on_pressed():
	get_tree().change_scene_to_file(scene)
