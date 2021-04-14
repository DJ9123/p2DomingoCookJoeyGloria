extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = 0
var acceleration = .3
var elapsed = 0
var distance = 0
const MAX_SPEED = 270
var speed = 0

var cruising = false

var accelerating = false

signal speed

signal normal

var emitted = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_mouse_button_pressed(BUTTON_LEFT) and accelerating and !cruising):
		if(speed < MAX_SPEED):
			elapsed += delta
			velocity = velocity + (elapsed * acceleration)
			distance = velocity * elapsed + (.5 * (acceleration*(elapsed*elapsed)))
			speed = distance/elapsed
			if(speed > 150 and !emitted):
				emitted = true
				print("emitting")
				emit_signal("speed")
		# print("Speed: ", speed)
	elif(speed > 0 and !cruising):
		if(speed < 150 and emitted):
				emitted = false
				emit_signal("normal")
		speed -= 1
		# print("Speed: ", speed)
	elif(speed <= 0):
		velocity = 0
		elapsed = 0
		
	
	get_tree().get_root().find_node("MPH_Label",true,false).text = str(round(floor(abs(speed)))) + "mph"
	var dial = get_node(@"../../placeholdercircle/Parent_Dial/Dial")
	# print(4.5 * speed/280)
#	dial.rotate((4.5 * speed/280) - dial.rotation)
	dial.rotation_degrees = speed
	# print(dial.rotation)


func _on_Button_button_up():
	# elapsed = 0
	accelerating = false
	# Replace with function body.


func _on_Button_button_down():
	accelerating = true
#	print($"../../placeholdercircle/Parent_Dial/Dial".rotation)
#	$"../../placeholdercircle/Parent_Dial/Dial".rotation_degrees = 90
	# pass # Replace with function body.
