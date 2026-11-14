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
		FitnessManager.MET = 8
	if index == 2: #Elliptical
		FitnessManager.MET = 5
	if index == 3: #Running
		FitnessManager.MET = 9.8
	if index == 4: #Walking
		FitnessManager.MET = 4.3
	if index == 5: #Weights
		FitnessManager.MET = 6
	
