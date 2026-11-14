extends Node

var xp = 0
var xp_to_next_level = 50 * FitnessManager.level



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if FitnessManager.new_input:
		add_xp(FitnessManager.calories/10)


func add_xp(amount: int) -> void:
	xp += amount
	check_level_up()
func check_level_up() -> void:

	while xp >= xp_to_next_level:

		xp -= xp_to_next_level

		FitnessManager.level += 1

		xp_to_next_level = 50 * FitnessManager.level

		print("LEVEL UP!")
		print("Current Level: ", FitnessManager.level)
