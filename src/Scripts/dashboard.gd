extends NinePatchRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var music = get_tree().get_root().find_node("Music",true,false)
	var radio = get_tree().get_root().find_node("Radio",true,false)
	radio.connect("my_signal",self,"dash_click")
	music.connect("my_signal",self,"dash_click")

func dash_click(button):
	print("ayy", button, button.label_text)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
