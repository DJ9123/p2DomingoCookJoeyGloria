extends Node2D

#{
#		"filename": "",
#		"title": "",
#		"artist": "",
#		"album": "",
#		"lighter": "",
#		"darker": "",
#	},

var songs = [
	{
		"filename": "agony.png",
		"title": "Agony",
		"artist": "Yung Lean",
		"album": "Stranger",
		"lighter": "632c24",
		"darker": "4e0001",
	}, {
		"filename": "the-chicken-and-the-egg.png",
		"title": "The Chicken And The Egg",
		"artist": "Takeo Ischi",
		"album": "",
		"lighter": "df8a83",
		"darker": "cd4655",
	}, {
		"filename": "hit-my-line.png",
		"title": "Hit My Line",
		"artist": "Logic",
		"album": "No Pressure",
		"lighter": "d3af54",
		"darker": "ea7212",
	}, {
		"filename": "astrid.png",
		"title": "astrid",
		"artist": "Glaive",
		"album": "cypress grove",
		"lighter": "73706A",
		"darker": "0d5f46",
	}, {
		"filename": "soft-lipa-1.png",
		"title": "When I Arrive",
		"artist": "Soft Lipa",
		"album": "Secrets of Tu Cheng Hsi: Renovate",
		"lighter": "5d5084",
		"darker": "141917",
	}, {
		"filename": "less-go.png",
		"title": "LESS GO",
		"artist": "DaBaby Car",
		"album": "HUH",
		"lighter": "aca484",
		"darker": "595a52",
	}, {
		"filename": "nobody.png",
		"title": "Nobody",
		"artist": "Mitski",
		"album": "Be the Cowboy",
		"lighter": "928B91",
		"darker": "243c3e",
	}, {
		"filename": "eugene.png",
		"title": "Eugene",
		"artist": "Sufjan Stevens",
		"album": "Carrie & Lowell",
		"lighter": "668288",
		"darker": "3c342d",
	}, {
		"filename": "sayonara-wild-heart.png",
		"title": "Sayonara Wild Heart",
		"artist": "Daniel Olsén",
		"album": "Sayonara Wild Hearts",
		"lighter": "ae70ff",
		"darker": "3173d3",
	}, {
		"filename": "shrike.png",
		"title": "Shrike",
		"artist": "Hozier",
		"album": "Wasteland, Baby!",
		"lighter": "8B8F8B",
		"darker": "58a6a2",
	}, {
		"filename": "lullaby-in-the-peaceful-light.png",
		"title": "Lullaby in the Peaceful Light",
		"artist": "Masakatsu Takagi",
		"album": "Wolf Children",
		"lighter": "8CADB3",
		"darker": "3b613b",
	}, {
		"filename": "fishy-on-me.png",
		"title": "Fishy On Me",
		"artist": "Tiko",
		"album": "Certified Bangers",
		"lighter": "9F9A9A",
		"darker": "f2c26e",
	}, 
]

var spriteTextures = [
	preload("res://Sprites/Center Dashboard/Music/agony.png"),
	preload("res://Sprites/Center Dashboard/Music/the-chicken-and-the-egg.png"),
	preload("res://Sprites/Center Dashboard/Music/hit-my-line.png"),
	preload("res://Sprites/Center Dashboard/Music/astrid.png"),
	preload("res://Sprites/Center Dashboard/Music/soft-lipa-1.png"),
	preload("res://Sprites/Center Dashboard/Music/less-go.png"),
	preload("res://Sprites/Center Dashboard/Music/nobody.png"),
	preload("res://Sprites/Center Dashboard/Music/eugene.png"),
	preload("res://Sprites/Center Dashboard/Music/sayonara-wild-heart.png"),
	preload("res://Sprites/Center Dashboard/Music/shrike.png"),
	preload("res://Sprites/Center Dashboard/Music/lullaby-in-the-peaceful-light.png"),
	preload("res://Sprites/Center Dashboard/Music/fishy-on-me.png"),
]

var nowPlayingLength = 150
var nowPlayingIndex = 0
var nowPlayingList = []
var nowPlaying = {}

var elapsed = 0
var paused = true
var music_activated = false

onready var lighter = $Lighter
onready var darker = $Darker
onready var sprite = $Sprite
onready var progress = $TextureProgress
onready var album = $Info/Album
onready var title = $Info/Title
onready var artist = $Info/Artist
onready var pauseButton = $Controls/Pause/CenterContainer/Label


# Called when the node enters the scene tree for the first time.
func _ready():
	nowPlayingList = Array(songs)
	nowPlaying = nowPlayingList[nowPlayingIndex]
	updateNowPlaying()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	print(paused)
	if not paused:
		elapsed += delta
		update_progress()


func update_progress():
	progress.value = elapsed / nowPlayingLength * 100
	if progress.value >= 100:
		_on_Next_activated(null)


func reset():
	elapsed = 0
	paused = false


func updateNowPlaying():
	print("nowPlaying: ", nowPlaying)
	lighter.color = Color(nowPlaying.lighter)
	darker.color = Color(nowPlaying.darker)
	sprite.texture = spriteTextures[nowPlayingIndex % nowPlayingList.size()]
	album.text = nowPlaying.album
	title.text = nowPlaying.title
	artist.text = nowPlaying.artist


func _on_Previous_activated(_button):
	if music_activated:
		nowPlayingIndex -= 1
		nowPlaying = nowPlayingList[nowPlayingIndex % nowPlayingList.size()]
		reset()
		updateNowPlaying()


func _on_Next_activated(_button):
	if music_activated:
		nowPlayingIndex += 1	
		nowPlaying = nowPlayingList[nowPlayingIndex % nowPlayingList.size()]
		reset()
		updateNowPlaying()


func _on_Rewind_activated(_button):
	elapsed -= 10
	if elapsed < 0:
		elapsed = 0
	update_progress()


func _on_Pause_activated(_button):
	paused = !paused
	if paused:
		pauseButton.text = "Resume"
	else:
		pauseButton.text = "Pause"


func _on_Forward_activated(_button):
	elapsed += 10
	if elapsed > nowPlayingLength:
		_on_Next_activated(null)
	update_progress()


func _on_Music_activated(_button):
	if not music_activated:
		paused = false
		music_activated = true


func _on_Radio_activated(_button):
	paused = true
	music_activated = false
