extends Sprite2D
var level: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.hide
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if level != int(FitnessManager.level):
		var x = randf_range(325, 830)
		var y = randf_range(255, 370)
		self.position = Vector2(x, y)
		var angle = randf_range(0, 360)
		self.rotation = angle
		self.show
		await get_tree().create_timer(1).timeout
		self.hide
	level = FitnessManager.level
	print(level)
	print(int(FitnessManager.level))
