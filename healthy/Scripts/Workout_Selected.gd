extends ItemList
#MET levels

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_item_selected(index: int) -> void:
	if index == 1: #Cycling
		FitnessManager.level = 8
	if index == 2: #Elliptical
		FitnessManager.level = 5
	if index == 3: #Running
		FitnessManager.level = 9.8
	if index == 4: #Walking
		FitnessManager.level = 4.3
	if index == 5: #Weights
		FitnessManager.level = 6
	
