extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var label_text = "" setget set_label_text, get_label_text 

# Called when the node enters the scene tree for the first time.
func _ready():
	label_text = $CenterContainer/Label.text


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

signal activated

func _on_Button_pressed():
	emit_signal("activated", self)

func get_label_text():
	return label_text
	
func set_label_text(value):
	label_text = value
	$CenterContainer/Label.text = value
