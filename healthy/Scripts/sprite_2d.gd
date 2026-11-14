extends Sprite2D
var list = [8, 9, 10, 11, 12]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	list.shuffle()
	texture = load("res://Profile Pics/" + str(list[1]) + ".png")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
