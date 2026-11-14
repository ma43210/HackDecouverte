extends Sprite2D
var level: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	level = int(FitnessManager.level)
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(_delta: float) -> void:
	if level != int(FitnessManager.level):
		level = int(FitnessManager.level)
		var x = randf_range(325, 830)
		var y = randf_range(255, 370)
		self.position = Vector2(x, y)
		var angle = randf_range(0, 360)
		self.rotation_degrees = angle
		self.show()
		await get_tree().create_timer(0.5).timeout
		self.hide()
