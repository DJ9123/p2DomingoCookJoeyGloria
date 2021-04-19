extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Center.connect("emergency", self, "_on_emergency_pressed")
	$Main/Control/Accelerate.connect("speed", self, "_a")
#	signal tire_pressure_toggled
#	signal temperature_toggled
#	signal all_alerts_toggled
	$Main/Icons.connect("tire_pressure_toggled", $Center, "_alert_icon_changed")
	$Main/Icons.connect("temperature_toggled", $Center, "_alert_icon_changed")
	$Main/Icons.connect("all_alerts_toggled", $Center, "_alert_icon_changed")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_emergency_pressed(button):
	$Main/Control._on_Emergency_pressed()
	print("Emergency: ", button)
	
func _a():
	print($Center/Air_Flow)
	print("too fast")
