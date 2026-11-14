extends Node2D
var weight = 0
var height = 0
var age = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
		pass





func _on_weight_text_submitted(new_text: String) -> void:
	FitnessManager.weight = int(new_text)



func _on_age_text_submitted(new_text: String) -> void:
	FitnessManager.age = int(new_text)
	
