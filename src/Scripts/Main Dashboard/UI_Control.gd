extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var healthbar = $"../Middle-Screen/MPH/TextureProgress"

onready var leftarrow = $"../Left Arrow"

onready var rightarrow = $"../Left Arrow"


# Represents if the arrows are blinking
var left = false
var right = false
var emergency = false

var tickTimer = null

# Called when the node enters the scene tree for the first time.
func _ready():
	$Accelerate.connect("speed", self, "_on_speed")
	$Accelerate.connect("normal", self, "_on_normal")
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
#	if($"../Left Arrow".visible and $"../Right Arrow".visible):
#		yield(get_tree().create_timer(.6), "timeout")
#		$"../Left Arrow".visible = false
#		$"../Right Arrow".visible = false
#		yield(get_tree().create_timer(.6), "timeout")
#		$"../Left Arrow".visible = true
#		$"../Right Arrow".visible = true
#	elif($"../Left Arrow".visible):
#		yield(get_tree().create_timer(.6), "timeout")
#		$"../Left Arrow".visible = false
#		yield(get_tree().create_timer(.6), "timeout")
#		$"../Left Arrow".visible = true
#	elif($"../Right Arrow".visible):
#		yield(get_tree().create_timer(.6), "timeout")
#		$"../Left Arrow".visible = false
#		yield(get_tree().create_timer(.6), "timeout")
#		$"../Left Arrow".visible = true

func _on_speed():
	$"../Middle-Screen/CenterContainer".rect_size.y = 300
	$"../Middle-Screen/Speed Warning".visible = true
	
func _on_normal():
	$"../Middle-Screen/CenterContainer".rect_size.y = 633
	$"../Middle-Screen/Speed Warning".visible = false

func _on_Reduce_Gas_pressed():
	healthbar.value -= 10


func _on_Add_Gas_pressed():
	healthbar.value += 10


func _on_Left__pressed():
	emergency = false
	right = false
	$"../Right Arrow".visible = false
	$"../Left Arrow".visible = true
	left = !left
	while (left):
		yield(get_tree().create_timer(.6), "timeout")
		if(left):
			$"../Left Arrow".visible = true
		yield(get_tree().create_timer(.6), "timeout")
		$"../Left Arrow".visible = false
		


func _on_Right_pressed():
	emergency = false
	left = false;
	$"../Left Arrow".visible = false
	$"../Right Arrow".visible = true
	right = !right
	while (right):
		yield(get_tree().create_timer(.6), "timeout")
		if(right):
			$"../Right Arrow".visible = true
		yield(get_tree().create_timer(.6), "timeout")
		$"../Right Arrow".visible = false


func _on_Emergency_pressed():
	right = false
	left = false
	$"../Left Arrow".visible = false
	$"../Right Arrow".visible = false
	emergency = !emergency
	while(emergency):
		yield(get_tree().create_timer(.6), "timeout")
		if(emergency):
			$"../Left Arrow".visible = true
			$"../Right Arrow".visible = true
		yield(get_tree().create_timer(.6), "timeout")
		$"../Left Arrow".visible = false
		$"../Right Arrow".visible = false


func _on_Cruise_Control_pressed():
	print("pressed")
	$Accelerate.cruising = !$Accelerate.cruising
