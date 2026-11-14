extends Node2D
var level = 0
var weight = 0
var height = 0
var age = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
		pass


func _on_item_list_item_selected(index: int) -> void:
	if index == 1:
		level = 1
	if index == 2:
		level = 2
	if index == 3:
		level = 4
	if index == 4:
		level = 7.5
	print(level)


func _on_weight_text_submitted(new_text: String) -> void:
	weight = int(new_text)



func _on_age_text_submitted(new_text: String) -> void:
	age = int(new_text)
	


func _on_height_text_submitted(new_text: String) -> void:
	height = int(new_text)
	print(level)
	print(height)
	print(age)
	print(weight)
