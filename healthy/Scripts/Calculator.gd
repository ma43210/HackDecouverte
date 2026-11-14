extends RichTextLabel
# Calc is short for calculator

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	FitnessManager.calories = (FitnessManager.MET * 3.5 * FitnessManager.weight) / 200 * FitnessManager.time
	text = "Calories burned: " + str(FitnessManager.calories)
