extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var label_text = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	self.label_text = $"CenterContainer/Label".text


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

signal my_signal

func _on_Button_pressed():
	emit_signal("my_signal", self)
