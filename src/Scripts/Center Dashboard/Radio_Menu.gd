extends Node2D


var station = 88.1

var mode = "fm"
var fmPresets = [
	"92.3",
	"96.5",
	"103.5",
]

var amPresets = [
	"790",
	"950",
	"1340",
]

# Called when the node enters the scene tree for the first time.
func _ready():
	_on_FM_activated(null)
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
	if (mode == "fm"):
		station += 0.2
	else:
		station += 10
	updateStationText()


func _on_Radio_Control_rotation_decrease():
	if (mode == "fm"):
		station -= 0.2
	else:
		station -= 10
	updateStationText()
	
func updateStationText():
	if (mode == "fm"):
		if (station > 107.9):
			station = 88.1
		if (station < 88.1):
			station = 107.9
	else:
		if (station > 1700):
			station = 540
		if (station < 540):
			station = 1700

	$CenterContainer/Station.text = str(station)


func _on_preset_activated(button):
	if (mode == "fm"):
		station = round(float(button.label_text) * 10)/10
	else:
		station = int(button.label_text)
	updateStationText()


func _on_AM_activated(_button):
	mode = "am"
	station = 540
	$Preset1.label_text = amPresets[0]
	$Preset2.label_text = amPresets[1]
	$Preset3.label_text = amPresets[2]
	updateStationText()


func _on_FM_activated(_button):
	mode = "fm"
	station = 88.1
	$Preset1.label_text = fmPresets[0]
	$Preset2.label_text = fmPresets[1]
	$Preset3.label_text = fmPresets[2]
	updateStationText()


func _on_Previous_activated():
	pass # Replace with function body.
