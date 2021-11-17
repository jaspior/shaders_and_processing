extends Control

const RES_SHADER_DIR : String = "res://shaders"
const USER_SHADER_DIR : String = "user://shaders"
#const SHADER_TEMPLATE : String = "shader_type canvas_item;\n\nvoid fragment(){\n\tCOLOR = vec4(vec3(0.0,0.5,0.3), 1.);\n}"
const UPDATE_SHADER : float = 0.2 # update shader every 200ms
const SAVE_SHADER   : float = 2.0 # save every 2 seconds

var update_delta = 0.0
var save_delta = 0.0
var current_shader_path : String


func _ready():

	
	current_shader_path = $ColorRect.material.shader.get_path()
	$ColorRect.material.shader = load(current_shader_path)
	$TextEdit.text = $ColorRect.material.shader.code
	# pop up FileDialog on start, use user dir


