extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal tire_pressure_toggled

var normal = load("res://Sprites/Center Dashboard/tempnormal.png") 
var hot = load("res://Sprites/Center Dashboard/temphot.png") 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Tire_Pressure_pressed():
	$"tire-pressure".visible = !$"tire-pressure".visible


func _on_Show_Alerts_pressed():
	for n in self.get_children():
		print('weeh')


func _on_Tire_Pressure_toggled(button_pressed):
	if(button_pressed):
		$"tire-pressure".visible = true
	else:
		$"tire-pressure".visible = false
	
	emit_signal('tire_pressure_toggled')
	# pass # Replace with function body.


func _on_Show_Alerts_toggled(button_pressed):
	if(button_pressed):
		for n in self.get_children():
			n.visible = true
	else:
		for n in self.get_children():
			n.visible = false
		$"../Control/Tire Pressure".pressed = false
			#$"../Control/Tire Pressure"._toggled = false
		


func _on_Set_Hot_toggled(button_pressed):
	if(button_pressed):
		$"engine-temp".visible = true
		$"../placeholderrpm/placeholdertemp".texture = hot
	else:
		$"engine-temp".visible = false
		$"../placeholderrpm/placeholdertemp".texture = normal
