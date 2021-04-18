extends Area2D

var start_pos = Vector2()
var start_rot

export(int) var min_rot = 0
export(int) var max_rot = 270
export(float) var sensitivity = 0.5 # higher = more sensitive

var label_text = ""

signal rotation
signal rotation_increase
signal rotation_decrease

func _ready():
	self.label_text = $Label.text
	set_process(false)

func _process(_delta):
	var distance = start_pos - get_global_mouse_position()
	var knob_rot = start_rot + distance.y * sensitivity # change distance.y to distance.x for horizontal control
	
	if knob_rot < min_rot:
		knob_rot = min_rot
	elif knob_rot > max_rot:
		knob_rot = max_rot
		
	if ($Sprite.rotation_degrees != knob_rot):
		if ($Sprite.rotation_degrees < knob_rot):
			emit_signal("rotation_increase")
		else:
			emit_signal("rotation_decrease")
		
		$Sprite.rotation_degrees = knob_rot
		$CenterContainer/Label.text = str(round(knob_rot))
		emit_signal("rotation", self, knob_rot)
	
	if Input.is_action_just_released("click"):
		set_process(false)

func _on_LeftKnob_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("click"):
		start_pos = get_global_mouse_position()
		start_rot = $Sprite.rotation_degrees
		set_process(true)
		
