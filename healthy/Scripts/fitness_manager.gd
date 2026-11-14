extends Node
# Code that can be accessed from anywhere
var level = 0
var weight = 0
var age = 0
var time = 0
var user = ""
var MET = 0
var data = {}
var save_path = "user://savegame.json"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if not FileAccess.file_exists(save_path):
		return
	var file = FileAccess.open(save_path, FileAccess.READ)
	data = JSON.parse_string(file.get_as_text())
	file.close()
	age = data["age"]
	user = data["user"]
	age = data["age"]
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	data = {
	"user": user,
	"weight": weight,
	"level": level,
	}
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_string(JSON.stringify(data))
	file.close()
