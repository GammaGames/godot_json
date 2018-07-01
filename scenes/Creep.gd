extends Sprite

func _ready():
	# I like using tween for movement, you can ignore everything in this file
	$Tween.connect("tween_completed", self, "_on_tween_completed")
	_on_tween_completed(self, "foo")

func _on_tween_completed(object, key):
	var rand = randi() % 4
	var dir = Vector2(0, 0)
	match rand:
		0: dir = Vector2(0, 1)
		1: dir = Vector2(0, -1)
		2: dir = Vector2(1, 0)
		3: dir = Vector2(-1, 0)

	dir = dir * 64
	$Tween.interpolate_property(self, "global_position", self.global_position, self.global_position + dir, 1, Tween.TRANS_QUART, Tween.EASE_OUT)
	$Tween.start()
