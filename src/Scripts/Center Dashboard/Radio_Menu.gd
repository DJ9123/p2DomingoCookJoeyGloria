extends Node2D


var station = 88.1

# Called when the node enters the scene tree for the first time.
func _ready():
	updateStationText()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


#func _on_Radio_Control_rotation(knob, knob_rot):
##	print(knob_rot)
#	var radio_amount = round(knob_rot/720 * 100)
#
#	if (radio_amount == 0):
#		radio_amount = 1
#
#	print(radio_amount)
#	$"../Radio_Menu/CenterContainer/Station".text = str(radio_amount)
	


func _on_Radio_Control_rotation_increase():
	station += 0.2
	updateStationText()


func _on_Radio_Control_rotation_decrease():
	station -= 0.2
	updateStationText()
	
func updateStationText():
	if (station > 107.9):
		station = 88.1
	if (station < 88.1):
		station = 107.9

	$CenterContainer/Station.text = str(station)


func _on_preset_activated(button):
	station = round(float(button.label_text) * 10)/10
	updateStationText()


func _on_AM_activated():
	pass # Replace with function body.


func _on_FM_activated():
	pass # Replace with function body.
