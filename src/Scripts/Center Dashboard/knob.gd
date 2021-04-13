extends Area2D

var start_pos = Vector2()
var start_rot

var min_rot = 0
var max_rot = 270
var sensitivity = 0.5 # higher = more sensitive

var label_text = ""

signal rotation

func _ready():
	self.label_text = $Label.text
	set_process(false)

func _process(delta):
	var distance = start_pos - get_global_mouse_position()
	var knob_rot = start_rot + distance.y * sensitivity # change distance.y to distance.x for horizontal control
	
	if knob_rot < min_rot:
		knob_rot = min_rot
	elif knob_rot > max_rot:
		knob_rot = max_rot
		
	if ($Sprite.rotation_degrees != knob_rot):
		$Sprite.rotation_degrees = knob_rot
		$CenterContainer/Label.text = str(round(knob_rot))
		emit_signal("rotation", self, knob_rot)
	
	if Input.is_action_just_released("click"):
		set_process(false)

func _on_LeftKnob_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("click"):
		start_pos = get_global_mouse_position()
		start_rot = $Sprite.rotation_degrees
		set_process(true)
		
