extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var info = get_node("Control/Panel/Content")
onready var label = get_node("Control/Panel/Label")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Contacts_pressed():
	for x in info.get_children():
		var children = x.get_children()
		label.text = "Contacts"
		children[0].visible = false
		children[1].visible = true


func _on_Recents_pressed():
	for x in info.get_children():
		var children = x.get_children()
		label.text = "Recents"
		children[1].visible = false
		children[0].visible = true
