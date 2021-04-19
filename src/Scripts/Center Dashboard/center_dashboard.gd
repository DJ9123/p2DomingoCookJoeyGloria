extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var navButtons = {
	"Radio": null,
	"Music": null,
	"Phone": null,
	"Map": null,
	"Settings": null,
	"Home": null,
}

var knobs = {
	"Volume_Control": null,
	"Radio_Control": null,
	"Air_Temp": null,
	"Air_Flow": null,
	"Air_Speed": null,
}

signal emergency


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node(@"../Main/Control/Accelerate").connect("speed", self, "_a")
	for button in navButtons.keys():
		navButtons[button] = get_tree().get_root().find_node(button + "_Menu",true,false)
		get_tree().get_root().find_node(button,true,false).connect("activated",self,"_on_dash_click")
		
	for knob in knobs.keys():
		knobs[knob] = get_tree().get_root().find_node(knob,true,false)
		knobs[knob].connect("rotation",self,"_on_knob_rotation")
		
#	Start playing music if the music screen is enabled first
	if navButtons["Music"].visible:
		$Music_Menu._on_Music_activated(null)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_dash_click(button):
	print(button, button.label_text)
	for nav in navButtons.keys():
		navButtons[nav].visible = false
	navButtons[button.label_text].visible = true


func _on_knob_rotation(knob, rot):
#	print(knob.label_text, rot)
	pass


func _on_Warning_activated(button):
	emit_signal("emergency", button)


func _a():
	print('too fast! from the center screen')


func _alert_icon_changed(children):
	for alert_icon in $Home_Menu/Blank/Settings_Menu2/Control/VBoxContainer.get_children():
		alert_icon.visible = false
	var visible = []
	for child in children:
		if child.visible:
			visible.append(child)
			
	if visible.size() > 0:
		$Home_Menu.visible = true
		$Home_Menu/Blank.visible = true
		for vis in visible:
			var alert_icon_change = get_tree().get_root().find_node(vis.name + "-notification",true,false)
			if (alert_icon_change):
				alert_icon_change.visible = true
			
	else:
		$Home_Menu/Blank.visible = false
			
		
