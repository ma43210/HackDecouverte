extends Sprite2D
var list = [8, 9, 10, 11, 12]
var num = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	list.shuffle()
	if int(FitnessManager.texture) != 0:
		num = FitnessManager.texture
	else:
		num = list[1]
		FitnessManager.texture = num
	texture = load("res://Profile Pics/" + str(int(num)) + ".png")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
