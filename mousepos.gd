extends Control

@export var sprite = ''

func _ready():
	if sprite=='':
		sprite = self
	else:
		sprite=get_node(sprite)

func _process(delta):
	var mouse = sprite.get_local_mouse_position()
	var shaderSize = sprite.size
	if(mouse.x>=0 && mouse.x<=shaderSize.x && mouse.y>=0 && mouse.y<=shaderSize.y): #hover mouse in window
		var output= (mouse/shaderSize)
		sprite.material.set_shader_parameter("mousepos", output)
		
	
	
