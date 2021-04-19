extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal tire_pressure_toggled
signal temperature_toggled
signal all_alerts_toggled

onready var healthbar = $"../Middle-Screen/MPH/TextureProgress"

var normal = load("res://Sprites/Center Dashboard/tempnormal.png") 
var hot = load("res://Sprites/Center Dashboard/temphot.png") 

var red = load("res://Sprites/Center Dashboard/bar_red.png") 
var green = load("res://Sprites/Center Dashboard/bar_green.png") 

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
	
	emit_signal('tire_pressure_toggled', self.get_children())
	# pass # Replace with function body.


func _on_Show_Alerts_toggled(button_pressed):
	if(button_pressed):
		for n in self.get_children():
			n.visible = true
		healthbar.texture_progress = red
		healthbar.value = 10
		
	else:
		for n in self.get_children():
			n.visible = false
		healthbar.texture_progress = green
		healthbar.value = 100
		$"../Control/Tire Pressure".pressed = false
		$"../Control/Set Hot".pressed = false
		
	emit_signal('all_alerts_toggled', self.get_children())
			#$"../Control/Tire Pressure"._toggled = false
		


func _on_Set_Hot_toggled(button_pressed):
	if(button_pressed):
		$"engine-temp".visible = true
		$"../placeholderrpm/placeholdertemp".texture = hot
	else:
		$"engine-temp".visible = false
		$"../placeholderrpm/placeholdertemp".texture = normal
		
	emit_signal('temperature_toggled', self.get_children())
